//
//  RandomNumberGenerator.swift
//  NumberTouchGame
//
//  Created by dadong on 2017. 7. 26..
//  Copyright © 2017년 dadong. All rights reserved.
//

import Foundation

class RandomNumberGernerator {
    @discardableResult public static func generateRandomNumbers(from min: Int, to max: Int ) -> [Int] {
        var randomNumbers: [RandomNumber] = [RandomNumber]()
        
        for i in min...max {
            let randomNumberForSort: Int = Int(arc4random_uniform(UInt32(max*100)))
            
            let randomNumber = RandomNumber(value: i, randomNumberForSort: randomNumberForSort)
            
            randomNumbers.append(randomNumber)
        
        }
        randomNumbers.sort { (a,b) -> Bool in
            return a.randomNumberForSort > b.randomNumberForSort
        }
        
        var numbers: [Int] = [Int]()
        
        for randomNumber in randomNumbers {
            numbers.append(randomNumber.value)
        }
        
        return numbers
    }

}


struct RandomNumber {

    var value: Int
    var randomNumberForSort: Int
    
    init(value: Int, randomNumberForSort: Int) {
        self.value = value
        self.randomNumberForSort = randomNumberForSort
    }

}
