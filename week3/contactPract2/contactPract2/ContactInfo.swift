//
//  ContactInfo.swift
//  contactPract2
//
//  Created by dadong on 2017. 7. 20..
//  Copyright © 2017년 dadong. All rights reserved.
//

import UIKit

class ContactInfo: NSObject {
    
    var name: String
    var number: String
    
    init(name: String, number: String) {
        self.name = name
        self.number = number
    }
    
    convenience init(random: Bool = false) {
        if random{
            
            let names = ["dadong","Sohn","spb","lefal","jaeho"]
            let numbers = ["123", "456", "345", "123143","3245"]
            
            //배열안의 원소만큼의 숫자까지 랜덤숫자 생성
            var idx = arc4random_uniform(UInt32(names.count))
            //해당 배열에서 랜덤 숫자번째의 이름 대입
            let randomName = names[Int(idx)]
            
            idx = arc4random_uniform(UInt32(numbers.count))
            let randomNumber = numbers[Int(idx)]
            
           
            self.init(name: randomName, number: randomNumber)
            
            
        } else {
            
            self.init(name: "", number: "")
        }
    }
    
}
