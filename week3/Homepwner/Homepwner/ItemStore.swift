//
//  ItemStore.swift
//  Homepwner
//
//  Created by dadong on 2017. 7. 17..
//  Copyright © 2017년 dadong. All rights reserved.
//

import UIKit

class ItemStore {

    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item {
        
        let newItem = Item(random: true)
        allItems.append(newItem)
        
        return newItem
        
    }
    
    init() {
        for _ in 0..<10 {
            createItem()
        }
    }
}


