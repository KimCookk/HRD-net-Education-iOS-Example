//
//  AnimalModel.swift
//  AnimalTable
//
//  Created by TJ on 2022/06/18.
//

import Foundation


struct Animal
{
    var name: String
    var image: String
    var type: AnimalType
    var isFly: Bool
    
    init()
    {
        self.name = ""
        self.image = ""
        self.type = AnimalType.UNKOWN
        self.isFly = false
    }
    
    init(name: String , image: String, type: AnimalType, isFly: Bool)
    {
        self.name = name
        self.image = image
        self.type = type
        self.isFly = isFly
    }
    
    func print() -> String
    {
        let name = self.name
        let type = self.type.rawValue
        let isFly = self.isFly ? "있습니다" : "없습니다"
        let result = "이 동물의 이름은 \(name)이며 분류는 \(type)이며 날 수 \(isFly)."
        
        return result
    }
}

struct SegueMessage
{
    static var animalMessage = Animal()
}

enum AnimalType: String
{
    case MAMMALIA = "포유류"
    case BUG = "벌레"
    case UNKOWN = "알수없음"
}
