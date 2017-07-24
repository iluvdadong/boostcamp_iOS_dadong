//
//  Item.swift
//  Homepwner
//
//  Created by dadong on 2017. 7. 17..
//  Copyright © 2017년 dadong. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var valuesInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    
    init(name: String, valueInDollars: Int, serialNumber: String?) {
        self.name = name
        self.serialNumber = serialNumber
        self.valuesInDollars = valueInDollars
        self.dateCreated = Date()
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var idx = arc4random_uniform(UInt32(nouns.count))
            let randomAdjective = adjectives[Int(idx)]
            
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name: randomName, valueInDollars: randomValue, serialNumber: randomSerialNumber)
        } else {
            self.init(name: "", valueInDollars: 0, serialNumber: nil)
        }
        
        
    }
    
}

