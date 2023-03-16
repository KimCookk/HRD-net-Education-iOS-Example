//
//  SqliteConnection.swift
//  SqliteToDoList
//
//  Created by TJ on 2022/06/26.
//

import Foundation
import SQLite3

class SqliteConnection
{
    var name: String
    
    var db: OpaquePointer?
    
    init(name: String)
    {
        self.name = name
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("todo.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("error opening database")
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS todo (tdId INTEGER PRIMARY KEY AUTOINCREMENT , tdContent TEXT)", nil, nil, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("Error createing Table : \(errMsg)")
        }
        else
        {
           
        }
    }
    func readAllData() -> [ToDo]
    {
        var todoList: [ToDo] = []
        
        var statement: OpaquePointer?
        let queryString = "SELECT * FROM todo"
        
        if sqlite3_prepare(db, queryString, -1, &statement, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("Error Preparing Select Query : \(errMsg)")
            return todoList
        }
        else{
            print("Sucess Preparing Select Query")
        }
        
        while sqlite3_step(statement) == SQLITE_ROW{
            let tdId = Int(sqlite3_column_int(statement, 0)) // 64bit 기준 object-c 로 만들어져서
            let tdContent = String(cString: sqlite3_column_text(statement, 1))
            
            todoList.append(ToDo(id: tdId, content: tdContent))
            print("SELECT TODO ( \(tdId) , \(tdContent) )")
            
        }
        
        return todoList
    }
    
    func insertData(content: String)
    {
        var statement: OpaquePointer?
        let SQLITE_TRANSIENT = unsafeBitCast(-1 , to: sqlite3_destructor_type.self) // db 한글 호환을 위해
        let queryString = "INSERT INTO todo ( tdContent ) VALUES ( ? )" // Swift 는 SQL 를 모르기 때문에 ? , ? , ?
        
        if sqlite3_prepare(db, queryString, -1, &statement, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("Error Preparing Query : \(errMsg)")
            return
        }
        else{
            print("Sucess Preparing Query")
        }
        
        sqlite3_bind_text(statement, 1, content, -1, SQLITE_TRANSIENT)
       

        if sqlite3_step(statement) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("Error Inserting Query : \(errMsg)")
        }
        else{
            print("Sucess Inserting Query")
        }
    }
    
    func deleteData(tdId: Int)
    {
        var statement: OpaquePointer?
        let queryString = "DELETE FROM todo WHERE tdId = ?" // Swift 는 SQL 를 모르기 때문에 ? , ? , ?
        sqlite3_prepare(db, queryString, -1, &statement, nil)
        sqlite3_bind_int(statement, 1, Int32(tdId))
        sqlite3_step(statement)
    }
    
}

class ToDo
{
    var id: Int
    var content: String
    
    init(id: Int , content: String)
    {
        self.id = id
        self.content = content
    }
}
