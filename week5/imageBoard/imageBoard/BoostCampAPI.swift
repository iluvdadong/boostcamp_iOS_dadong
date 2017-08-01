//
//  BoostCampAPI.swift
//  imageBoard
//
//  Created by dadong on 2017. 8. 1..
//  Copyright © 2017년 dadong. All rights reserved.
//


import Foundation

enum APIType: String {
    case fetchAllArticles = "/"
    case login = "/login"
    case signUp = "/user"
    case article = "/image"
}

enum BCAPIError: Error {
    case invalidJSONData
    case invalidURL
}

struct BoostCampAPI {
    
    private static let baseURLString = "https://ios-api.boostcamp.connect.or.kr"
    
    static var fetchAllArticlesURL: URL {
        return boostCampURL(type: .fetchAllArticles)
    }
    
    static var signUpURL: URL {
        return boostCampURL(type: .signUp)
    }
    
    static var loginURL: URL {
        return boostCampURL(type: .login)
    }
    
    static var articleURL: URL {
        return boostCampURL(type: .article)
    }
    
    static func imageURL(with article: Article) -> URL? {
        let url = URL(string: baseURLString + "/" + article.image_url)
        return url
    }
    
    private static func boostCampURL(type: APIType) -> URL {
        
        let components = URLComponents(string: baseURLString)!
        
        guard let url = components.url?.appendingPathComponent(type.rawValue) else {
            print(BCAPIError.invalidURL)
            return components.url!
        }
        
        return url
    }
    
    static func user(from data: Data) -> UserResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let jsonDictionary = jsonObject as? [String:Any] else {
                return .failure(BCAPIError.invalidJSONData)
            }
            
            guard
                let id = jsonDictionary["_id"] as? String,
                let nickname = jsonDictionary["nickname"] as? String,
                let email = jsonDictionary["email"] as? String,
                let password = jsonDictionary["password"] as? String else {
                    return .failure(BCAPIError.invalidJSONData)
            }
            
            let user = User()
            user._id = id
            user.nickname = nickname
            user.email = email
            user.password = password
            
            return .success(user)
        } catch let error {
            return .failure(error)
        }
    }
    
    static func articles(from data: Data) -> ArticleResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let jsonArray = jsonObject as? [[String:Any]] else {
                return .failure(BCAPIError.invalidJSONData)
            }
            
            var articles: [Article] = []
            
            for json in jsonArray {
                if let article = self.article(from: json) {
                    articles.append(article)
                }
            }
            
            return .success(articles)
        } catch let error {
            return .failure(error)
        }
    }
    
    static func article(from json: [String:Any]) -> Article? {
        guard
            let _id = json["_id"] as? String,
            let created_at = json["created_at"] as? Int,
            let image_url = json["image_url"] as? String,
            let author = json["author"] as? String,
            let thumb_image_url = json["thumb_image_url"] as? String,
            let author_nickname = json["author_nickname"] as? String,
            let image_title = json["image_title"] as? String,
            let image_desc = json["image_desc"] as? String else {
                return nil
        }
        
        let article = Article()
        article._id = _id
        article.created_at = created_at
        article.image_url = image_url
        article.author = author
        article.thumb_image_url = thumb_image_url
        article.author_nickname = author_nickname
        article.image_title = image_title
        article.image_desc = image_desc
        
         print("FUCKFUCKFUCK YOU")
        return article
        
    }
}

