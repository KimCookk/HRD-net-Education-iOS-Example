//
//  QueryModel.swift
//  DBcrud
//
//  Created by TJ on 2022/07/02.
//

import Foundation

protocol QueryModelProtocol: AnyObject{
    func itemDownloaded(items: [DBModel])
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
        var locations: [DBModel] = []
        
        do{
            let students = try decoder.decode([StudentJSON].self, from: data)
            for student in students {
                let query = DBModel(scode: student.scode, sname: student.sname, sdept: student.sdept, sphone: student.sphone)
                locations.append(query)
            }
            print("locations Count : \(locations.count)")
        }catch let error{
            print("Fail : \(error.localizedDescription)")
        }
        DispatchQueue.main.async(execute: {()->Void in
            self.delegate.itemDownloaded(items: locations)
        })
        
        
    }
}
