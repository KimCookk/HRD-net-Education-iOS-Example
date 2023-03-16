//
//  AddViewController.swift
//  SqliteCRUD
//
//  Created by TJ on 2022/06/26.
//

import UIKit
import SQLite3

class AddViewController: UIViewController {

    @IBOutlet weak var snameTextField: UITextField!
    @IBOutlet weak var sdeptTextField: UITextField!
    @IBOutlet weak var sphoneTextField: UITextField!
    
    var db: OpaquePointer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentsData.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("error opening database")
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchAddBtn(_ sender: Any) {
        
        var statement: OpaquePointer?
        let sname = snameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let sdept = sdeptTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let sphone = sphoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
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
        
        
        sqlite3_bind_text(statement, 1, sname, -1, SQLITE_TRANSIENT)
        //sqlite3_bind_text(statement, 1 => 인덱스, "김태성", -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(statement, 2, sdept, -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(statement, 3, sphone, -1, SQLITE_TRANSIENT)

        if sqlite3_step(statement) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("Error Inserting Query : \(errMsg)")
        }
        else{
            print("Sucess Inserting Query")
        }
        
        let resultAlert = UIAlertController(title: "결과", message: "추가되었습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
            self.navigationController?.popViewController(animated: true)
        })
        resultAlert.addAction(okAction)
        present(resultAlert, animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
