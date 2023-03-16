//
//  QueryModel.swift
//  DBcrudTest
//
//  Created by TJ on 2022/07/02.
//

import Foundation

protocol QueryModelProtocol: AnyObject{
    func itemDownloaded(items: [UserJSON])
}

class QueryModel{
    let urlPath = "http://localhost:8080/ios/user_query_ios.jsp"
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
        var locations: [UserJSON] = []
        
        do{
            let users = try decoder.decode([UserJSON].self, from: data)
            for user in users {
                let query = UserJSON(userID: user.userID, password: user.password)
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
