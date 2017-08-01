//
//  ArticleTableDataSource.swift
//  imageBoard
//
//  Created by dadong on 2017. 8. 1..
//  Copyright © 2017년 dadong. All rights reserved.
//

import UIKit

class ArticleTableDataSource: NSObject, UITableViewDataSource {
    
    var articles: [Article] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        let articleText = articles[indexPath.row].image_desc
        
        cell.textLabel?.text = articleText
        
        return cell
    }
    
}

