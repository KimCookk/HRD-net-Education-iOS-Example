//
//  QueryModel.swift
//  NetworkGetJson
//
//  Created by TJ on 2022/06/19.
//

import Foundation

// AnyObject 이유
protocol QueryModelProtocol: AnyObject{
    func itemDownloaded(items: [Student])
}

class QueryModel{
    var delegate: QueryModelProtocol!
    let urlPath = "https://zeushahn.github.io/Test/ios/student.json"
    
    func downloadItems(){
        print("* downloadItems")
        let url: URL = URL(string: urlPath)!
        // URL 은 목적지 주소 와 시작점 주소 정보를 포함하고 있다.
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to Download data")
            }
            else
            {
                print("Success to Download data")
                print(data)
                self.parseJson(data!)
            }
        }
        task.resume() // 위 task 선언 실질적 실행은 .resume()
        
    }
    
    // JsonFile -> String
    func parseJson(_ data: Data){
        print("* JSON parsing")
        let decoder = JSONDecoder()
        let str = String(decoding: data, as: UTF8.self)
        print(str)
        
        var locations: [Student] = []
        do{
            let students = try decoder.decode([StudentJson].self, from: data)
            for student in students{
                let quey = Student(scode: student.code, sname: student.name, sdept: student.dept, sphone: student.phone)
                locations.append(quey)
            }
            //print(locations)
            
        }catch let error{
            //print("Fail Error : \(error.localizedDescription)")
            print(String(describing: error))
        }
        
        // 화면 구성을 동시에 하기 위함
        //
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
            print("QueryModel async")
        })
        
        
        
    }
}
