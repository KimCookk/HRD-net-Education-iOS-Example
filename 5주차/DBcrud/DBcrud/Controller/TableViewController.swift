//
//  TableViewController.swift
//  DBcrud
//
//  Created by TJ on 2022/07/02.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var listTableView: UITableView!
    
    var feedItems: [DBModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        reloadAction()
    }
    
    func reloadAction()
    {
        print("realoadAction")
        let queryModel = QueryModel()
        queryModel.delegate = self
        queryModel.downloadItems()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = "성명 : \(feedItems[indexPath.row].sname)"
        cell.detailTextLabel?.text = "학번 : \(feedItems[indexPath.row].scode)"
        
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
            let code = feedItems[indexPath.row].scode
            let deleteMode = DeleteModel()
            let result = false
            print("deleteItems start")
            _ = deleteMode.deleteItems(code: code)
            print("deleteItems end")
         
            reloadAction()
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
        if(segue.identifier == "detailSegue"){
            let cell = sender as! UITableViewCell
            let indexPath = self.listTableView.indexPath(for: cell)
            
            let selectDBModel = feedItems[indexPath!.row]
            Message.scode = selectDBModel.scode;
            Message.sname = selectDBModel.sname;
            Message.sdept = selectDBModel.sdept;
            Message.sphone = selectDBModel.sphone;

        }
    }
    

}

extension TableViewController: QueryModelProtocol{
    func itemDownloaded(items: [DBModel]) {
        feedItems = items
        self.listTableView.reloadData()
    }
}
