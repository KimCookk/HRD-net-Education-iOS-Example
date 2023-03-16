//
//  DeleteModel.swift
//  DBcrud
//
//  Created by TJ on 2022/07/03.
//

import Foundation

class DeleteModel{
    var urlPath = "http://localhost:8080/ios/student_delete_ios.jsp?"
    func deleteItems(code: String) -> Bool{
        var result: Bool = true
        let urlAdress = "code=\(code)"
        
        urlPath = urlPath + urlAdress
        // 한글 url encoding
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: .default)
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = defaultSession.dataTask(with: url){(data , response, error) in
            if error != nil{
                print("Fail to Delete Items")
                result = false
            }else{
                print("Success to Delete Items")
            }
           
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return result
        
    }
}
