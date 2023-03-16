//
//  DetailViewController.swift
//  SqliteCRUD
//
//  Created by TJ on 2022/06/26.
//

import UIKit
import SQLite3

class DetailViewController: UIViewController {

    
    @IBOutlet weak var sidTextField: UITextField!
    @IBOutlet weak var snameTextField: UITextField!
    @IBOutlet weak var sdeptTextField: UITextField!
    @IBOutlet weak var sphoneTextField: UITextField!
    
    var receiveId = 0
    var receiveName = ""
    var receiveDept = ""
    var receivePhone = ""
    
    var db: OpaquePointer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sidTextField.text = String(receiveId)
        sidTextField.isEnabled = false
        snameTextField.text = receiveName
        sdeptTextField.text = receiveDept
        sphoneTextField.text = receivePhone
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentsData.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("error opening database")
        }
        
    }
    
    func reciveInput(_ id: Int , _ name: String, _ dept: String ,_ phone: String)
    {
        receiveId = id
        receiveName = name
        receiveDept = dept
        receivePhone = phone
    }
    
    
    @IBAction func touchEditBtn(_ sender: Any) {
        var statement: OpaquePointer?
        let sid: String = sidTextField.text!
        let sname = snameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let sdept = sdeptTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let sphone = sphoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let SQLITE_TRANSIENT = unsafeBitCast(-1 , to: sqlite3_destructor_type.self) // db 한글 호환을 위해
        
        let queryString = "UPDATE student SET sname = ? , sdept = ? , sphone = ? WHERE sid = ?" // Swift 는 SQL 를 모르기 때문에 ? , ? , ?
        
        if sqlite3_prepare(db, queryString, -1, &statement, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("Error Preparing Query : \(errMsg)")
            return
        }
        else{
            print("Sucess Preparing Query")
        }
        
        
        sqlite3_bind_text(statement, 1, sname, -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(statement, 2, sdept, -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(statement, 3, sphone, -1, SQLITE_TRANSIENT)
        sqlite3_bind_int(statement, 4, Int32(sid)!)

        if sqlite3_step(statement) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("Error Inserting Query : \(errMsg)")
        }
        else{
            print("Sucess Inserting Query")
        }
        
        let resultAlert = UIAlertController(title: "결과", message: "수정 되었습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
            self.navigationController?.popViewController(animated: true)
        })
        resultAlert.addAction(okAction)
        present(resultAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func touchDeleteBtn(_ sender: Any) {
        
        var statement: OpaquePointer?
        let sid: String = sidTextField.text!
        let queryString = "DELETE FROM student WHERE sid = ?" // Swift 는 SQL 를 모르기 때문에 ? , ? , ?
        sqlite3_prepare(db, queryString, -1, &statement, nil)
        sqlite3_bind_int(statement, 1, Int32(sid)!)
        sqlite3_step(statement)
        
        let resultAlert = UIAlertController(title: "결과", message: "삭제 되었습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
            self.navigationController?.popViewController(animated: true)
        })
        resultAlert.addAction(okAction)
        present(resultAlert, animated: true, completion: nil)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
    
}
