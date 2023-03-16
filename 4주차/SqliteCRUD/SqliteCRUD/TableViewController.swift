//
//  TableViewController.swift
//  SqliteCRUD
//
//  Created by TJ on 2022/06/26.
//

import UIKit
import SQLite3 // * 필수

class TableViewController: UITableViewController {

    @IBOutlet var studentsTableView: UITableView!
    
    var db: OpaquePointer?
    var students: [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // SQLite 생성하기
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentsData.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("error opening database")
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS student (sid INTEGER PRIMARY KEY AUTOINCREMENT , sname TEXT , sdept TEXT , sphone TEXT)", nil, nil, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("Error createing Table : \(errMsg)")
        }
        else
        {
           
        }
        // Temporary Insert
//        tempInsert()
        
        // DB Content Load
        //readDBValues()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        readDBValues()
    }
    
    func tempInsert(){
        var statement: OpaquePointer?
        let SQLITE_TRANSIENT = unsafeBitCast(-1 , to: sqlite3_destructor_type.self) // db 한글 호환을 위해
        
        let queryString = "INSERT INTO student ( sname , sdept , sphone) VALUES ( ? , ? , ?)" // Swift 는 SQL 를 모르기 때문에 ? , ? , ?
        
        if sqlite3_prepare(db, queryString, -1, &statement, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("Error Preparing Query : \(errMsg)")
            return
        }
        else{
            print("Sucess Preparing Query")
        }
        
        sqlite3_bind_text(statement, 1, "김태성", -1, SQLITE_TRANSIENT)
        //sqlite3_bind_text(statement, 1 => 인덱스, "김태성", -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(statement, 2, "컴퓨터정보통신학과", -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(statement, 3, "01087453240", -1, SQLITE_TRANSIENT)

        if sqlite3_step(statement) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("Error Inserting Query : \(errMsg)")
        }
        else{
            print("Sucess Inserting Query")
        }
    }
    func readDBValues(){
        students.removeAll() // 배열 내용 초기화

        var statement: OpaquePointer?

        let queryString = "SELECT * FROM student"
        
        if sqlite3_prepare(db, queryString, -1, &statement, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("Error Preparing Select Query : \(errMsg)")
            return
        }
        else{
            print("Sucess Preparing Select Query")
        }
        
        while sqlite3_step(statement) == SQLITE_ROW{
            let sid = Int(sqlite3_column_int(statement, 0)) // 64bit 기준 object-c 로 만들어져서
            let sname = String(cString: sqlite3_column_text(statement, 1))
            let sdept = String(cString: sqlite3_column_text(statement, 2))
            let sphone = String(cString: sqlite3_column_text(statement, 3))
            
            print("SELECT STUDENT ( \(sid) , \(sname) , \(sdept) , \(sphone))")
            students.append(Student(id: sid, name: sname, dept: sdept, phone: sphone))
        }
        studentsTableView.reloadData()
    }
    func deleteAction(id: Int)
    {
        var statement: OpaquePointer?
        let queryString = "DELETE FROM student WHERE sid = ?" // Swift 는 SQL 를 모르기 때문에 ? , ? , ?
        sqlite3_prepare(db, queryString, -1, &statement, nil)
        sqlite3_bind_int(statement, 1, Int32(id))
        sqlite3_step(statement)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)

        let student = students[indexPath.row]
        cell.textLabel?.text = "학번 : \(student.id)"
        cell.detailTextLabel?.text = "성명 : \(student.name!)"
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
            let selectID = students[indexPath.row].id
            deleteAction(id: selectID)
            tableView.deleteRows(at: [indexPath], with: .fade)

            readDBValues()
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
        if segue.identifier == "detailSegue"{
            let cell = sender as! UITableViewCell
            let indexPath = self.studentsTableView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            
            let student = students[indexPath!.row]
            
            let sid = student.id
            let sname = student.name!
            let sdept = student.dept!
            let phone = student.phone!
            
            detailView.reciveInput(sid, sname, sdept, phone)
        }
    }
    

}
