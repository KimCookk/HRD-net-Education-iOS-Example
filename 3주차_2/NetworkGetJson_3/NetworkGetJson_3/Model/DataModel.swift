//
//  DataModel.swift
//  NetworkGetJson_2
//
//  Created by TJ on 2022/06/19.
//

import Foundation

struct Student
{
    var scode: String
    var sdept: String
    var sname: String
    var sphone: String
}

struct JsonStudent: Codable
{
    var code: String
    var dept: String
    var name: String
    var phone: String
}
protocol QueryModelProtocol: AnyObject {
    func itemDownloaded(students: [Student])
}

class QueryModel{
    var delegate: QueryModelProtocol!
    let url = URL(string: "https://zeushahn.github.io/Test/ios/student.json")
    
    func downloadItems()
    {
        let urlSession = Foundation.URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url!, completionHandler: {(data , response, error) in
            if error != nil
            {
                print("dataTask Error")
            }
            else
            {
                print("dataTask Success")
                self.parseJson(data!)
            }
        })
        task.resume()
    }
    func parseJson(_ data: Data)
    {
        let decoder = JSONDecoder()
        let str = String(decoding: data, as: UTF8.self)
        print(str)
        
        var students: [Student] = []
        do{
            let jsonStudents = try decoder.decode([JsonStudent].self, from: data)
            for jsonStudent in jsonStudents
            {
                let student = Student(scode: jsonStudent.code, sdept: jsonStudent.dept, sname: jsonStudent.name, sphone: jsonStudent.phone)
                students.append(student)
            }
        }catch let error{
            print(error.localizedDescription)
        }
        
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(students: students)
            print("QueryModel async")
        })
    }
}
