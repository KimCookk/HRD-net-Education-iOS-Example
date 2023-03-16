//
//  Student.swift
//  SqliteCRUD
//
//  Created by TJ on 2022/06/26.
//

import Foundation

class Student{
    var id: Int // primary key
    var name: String? // 필수 값이 아니다 , null 값이 가능하다.
    var dept: String?
    var phone: String?
    
    init(id: Int , name: String? , dept: String? , phone: String?){
        self.id = id
        self.name = name
        self.dept = dept
        self.phone = phone
    }
    
}
