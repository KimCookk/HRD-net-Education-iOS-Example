//
//  InsertModel.swift
//  DBcrud
//
//  Created by TJ on 2022/07/03.
//

import Foundation


class InsertModel{
    var urlPath = "http://localhost:8080/ios/student_insert_ios.jsp?"
    func insertItems(code: String, name: String, dept: String, phone: String) -> Bool{
        var result: Bool = true
        let urlAdress = "code=\(code)&name=\(name)&dept=\(dept)&phone=\(phone)"
        
        urlPath = urlPath + urlAdress
        
        // 한글 url encoding
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: .default)
        
        let task = defaultSession.dataTask(with: url){(data , response, error) in
            if error != nil{
                print("Fail to Insert Items")
                result = false
            }else{
                print("Success to Insert Items")
            }
        }
        task.resume()
        return result
    }
}
// 운영 소프트웨어 엔지니어링
