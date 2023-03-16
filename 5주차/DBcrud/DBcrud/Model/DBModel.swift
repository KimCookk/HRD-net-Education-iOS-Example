//
//  DBModel.swift
//  DBcrud
//
//  Created by TJ on 2022/07/02.
//

import Foundation

struct DBModel{
    // Property
    var scode: String
    var sname: String
    var sdept: String
    var sphone: String
    
    // Constructor
    init(scode: String, sname: String, sdept: String, sphone: String)
    {
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
    }
}
