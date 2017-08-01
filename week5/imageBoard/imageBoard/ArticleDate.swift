//
//  ArticleDate.swift
//  imageBoard
//
//  Created by dadong on 2017. 8. 1..
//  Copyright © 2017년 dadong. All rights reserved.
//

import Foundation

class ArticleDate {
    
    static func getDate(from article: Article) -> String {
        let articledate = DateFormatter()
        articledate.dateStyle = .long
        articledate.timeStyle = .medium
        articledate.monthSymbols = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        
        let date = Date(timeIntervalSince1970: TimeInterval(exactly: article.created_at)!)
        
        let dateString = articledate.string(from: date)
        
        return dateString
    }
}
