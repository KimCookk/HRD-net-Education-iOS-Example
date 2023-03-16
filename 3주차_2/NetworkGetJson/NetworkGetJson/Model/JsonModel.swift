//
//  JsonModel.swift
//  NetworkGetJson
//
//  Created by TJ on 2022/06/19.
//

import Foundation

// Json Codable
// Json Data 파싱하는데 편리하나 , Json Properties 명과 반드시 동일해아하는 제약사항 존재

struct StudentJson: Codable
{
    var phone: String
    var code: String
    var name: String
    var dept: String
    // 
}
