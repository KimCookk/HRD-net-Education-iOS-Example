//
//  ToDoList.swift
//  TableReview
//
//  Created by TJ on 2022/06/18.
//

import Foundation

struct ToDoList{
    
    var item: String
    var itemImageFile: String
    
    init(item: String , itemImageFile: String)
    {
        self.item = item
        self.itemImageFile = itemImageFile
    }
}
