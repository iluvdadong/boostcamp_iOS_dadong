//
//  ItemStore.swift
//  Homepwner
//
//  Created by dadong on 2017. 7. 17..
//  Copyright © 2017년 dadong. All rights reserved.
//

import UIKit

class ItemStore {
    
//    var allItems = [Item]()
    var itemsOverFifty = [Item]()
    var itemsUnderFifty = [Item]()
    
    @discardableResult func createItem() -> Item {
        
        let newItem = Item(random: true)
        
        if newItem.valuesInDollars >= 50 {
            itemsOverFifty.append(newItem)
        } else {
            itemsUnderFifty.append(newItem)
        }
//        allItems.append(newItem)
        
        return newItem
        
    }
    
    init() {
        for _ in 0..<20 {
            createItem()
        }
    }
    
//    func getCountOverFifty() -> Int {
//        
//        var count: Int = 0
//        
//        for item in allItems {
//            if item.valuesInDollars >= 50 {
//                count += 1
//            
//            }
//            else {
//                
//            }
//        }
//        
//        return count
//
//    }
//
//    func getCountUnderFifty() -> Int {
//        
//        var count: Int = 0
//        
//        for item in allItems {
//            if item.valuesInDollars < 50 {
//                count += 1
//                
//            }
//            else {
//                
//            }
//        }
//        
//        return count
//        
//    }
    
}


