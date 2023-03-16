//
//  UpdateModel.swift
//  DBcrud
//
//  Created by TJ on 2022/07/03.
//

import Foundation

class UpdateModel{
    var urlPath = "http://localhost:8080/ios/student_update_ios.jsp?"
    func updateItems(code: String, name: String, dept: String, phone: String) -> Bool{
        var result: Bool = true
        let urlAdress = "code=\(code)&name=\(name)&dept=\(dept)&phone=\(phone)"
        
        urlPath = urlPath + urlAdress
        
        // 한글 url encoding
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: .default)
        
        let task = defaultSession.dataTask(with: url){(data , response, error) in
            if error != nil{
                print("Fail to Update Items")
                result = false
            }else{
                print("Success to Update Items")
            }
        }
        task.resume()
        return result
    }
}
