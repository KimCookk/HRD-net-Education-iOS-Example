//
//  TableViewController.swift
//  TableReview
//
//  Created by TJ on 2022/06/18.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet weak var tableTv: UITableView!
    
    var dataArray: [ToDoList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataInit()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    func dataInit()
    {
        dataArray.append(ToDoList(item: "책 구매", itemImageFile: "cart.png"))
        dataArray.append(ToDoList(item: "약속", itemImageFile: "clock.png"))
        dataArray.append(ToDoList(item: "스터디", itemImageFile: "pencil.png"))

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = dataArray[indexPath.row].item
        cell.imageView?.image = UIImage(named: dataArray[indexPath.row].itemImageFile)
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            dataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // 이동 할 item 복사
        let itemToMove = dataArray[fromIndexPath.row]
        // 이동 할 item 삭제
        dataArray.remove(at: fromIndexPath.row)
        // item 이동 할 위치로 삽입
        dataArray.insert(itemToMove, at: to.row)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    override func viewWillAppear(_ animated: Bool) {
        appendData()
        tableTv.reloadData()
    }
    
    func appendData()
    {
        if Message.check == "New"
        {
            dataArray.append(ToDoList(item: Message.item, itemImageFile: Message.itemImageFile))
            Message.check = "Old"
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detailSegue"{
            let cell = sender as! UITableViewCell
            let indexPath = tableTv.indexPath(for: cell)
            
            Message.item = dataArray[indexPath!.row].item
            Message.itemImageFile = dataArray[indexPath!.row].itemImageFile
        }
    }
    

}
