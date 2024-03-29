//
//  TableViewController.swift
//  SqliteToDoList
//
//  Created by TJ on 2022/06/26.
//

import UIKit

class TableViewController: UITableViewController {

  
    var toDoList: [ToDo] = []
    var sqlite = SqliteConnection(name: "todo")

    @IBOutlet var todoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func initData()
    {
        toDoList = sqlite.readAllData()
        todoTableView.reloadData()
    }

    // MARK: - Table view data source

    @IBAction func touchAddBtn(_ sender: Any) {
        
        var alert = UIAlertController(title: "Todo List", message: "추가 할 내용을 입력하시오!", preferredStyle: .alert)
        var addAction = UIAlertAction(title: "추가", style: .default, handler: {ACTION in
            
            let content = alert.textFields?[0].text
            self.sqlite.insertData(content: content!)
            self.initData()
        })
        var cancleAction = UIAlertAction(title: "취소", style: .cancel, handler: {ACTION in
            
        })
        
        alert.addTextField()
        alert.addAction(addAction)
        alert.addAction(cancleAction)

        present(alert, animated: true)
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TableViewCell
        
        cell.contentLabel.text = toDoList[indexPath.row].content
        // Configure the cell...

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
            //tableView.deleteRows(at: [indexPath], with: .fade)
            var selectTodo = toDoList[indexPath.row]
            sqlite.deleteData(tdId: selectTodo.id)
            initData()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
