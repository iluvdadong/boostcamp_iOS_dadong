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
    let itemArchiveURL: URL = {
        let documentsDirectories =
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
       return documentDirectory.appendingPathComponent("items.archive")
        
    
    } ()
    
    init() {
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [item] //휴 ㅠㅠ
        allItems = archivedItems
    }
    
    
    @discardableResult func createItem() -> Item {
        
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    

    
    func removeItem(_ item: Item) {
    
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(From fromIndex: Int, to toIndex: Int) {
    
        if fromIndex == toIndex {
            return
        }
        
        // get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        
        // Remove item from array
        allItems.remove(at: fromIndex)
        
        // Insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
    
    // 앱을 종료할 때 Item인스턴스를 저장하도록 NSKeyedArchiver클래스를 사용
    func saveChanges() -> Bool {
        print("Saving items to: \(itemArchiveURL.path )")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path)
    
    }
  
}


