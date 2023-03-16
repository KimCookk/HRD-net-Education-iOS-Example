//
//  DBModel.swift
//  SqlToDoList
//
//  Created by TJ on 2022/07/03.
//

import Foundation


protocol QueryModelProtocol: AnyObject{
    func itemDownloaded(items: [ToDo])
}


class QueryModel{
    let urlPath = "http://localhost:8080/ios/student_query_ios.jsp"
    var delegate: QueryModelProtocol!
    
    func downloadItems()
    {
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: .default)
        
        let task = defaultSession.dataTask(with: url){(data , response, error) in
            if error != nil{
                print("Fail to download Items")
            }else{
                print("Success to download Items")
                self.parseJson(data!)
            }
        }
        task.resume()
    }
    func parseJson(_ data: Data){
        let decoder = JSONDecoder()
        var todos: [ToDo] = []
        
        do{
            let todoJsons = try decoder.decode([ToDoJson].self, from: data)
            for todoJson in todoJsons {
                let todo = ToDo(content: todoJson.tdContent)
                todos.append(todo)
            }
            print("locations Count : \(todos.count)")
        }catch let error{
            print("Fail : \(error.localizedDescription)")
        }
        DispatchQueue.main.async(execute: {()->Void in
            self.delegate.itemDownloaded(items: todos)
        })
        
        
    }
}

