//
//  ArticleStore.swift
//  imageBoard
//
//  Created by dadong on 2017. 8. 1..
//  Copyright © 2017년 dadong. All rights reserved.
//

import UIKit

enum ArticleResult {
    case success([Article])
    case failure(Error)
}

enum ArticleError: Error {
    case noArticle
}

class ArticleStore {
    
    static let shared = ArticleStore()
    
    private var session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchAllArticles(completion: @escaping (ArticleResult) -> Void) {
        
        let url = BoostCampAPI.fetchAllArticlesURL
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.get.rawValue
        
        let task = session.dataTask(with: request) { (data, response, error) in
            let result = BoostCampAPI.articles(from: data!)
            
            OperationQueue.main.addOperation {
                completion(result)
            }
            
        }
        
        task.resume()
    }
    
    func postArticle(image: UIImage, imgTitle: String, imgDesc: String) {
        
        let url = BoostCampAPI.articleURL
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.post.rawValue
        
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let params: [String:String] = ["image_title":imgTitle,
                                       "image_desc":imgDesc]

        request.httpBody = createBody(parameters: params, boundary: boundary, data: UIImageJPEGRepresentation(image, 0.5)!, mimeType: "image/jpg", filename: "mugeun.jpg")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                let json = try JSONSerialization.data(withJSONObject: data!, options: .prettyPrinted)
                print(json)
            } catch let error {
                print(error)
            }
            
            let result = BoostCampAPI.articles(from: data!)
            
            print(result)
        }
        task.resume()
            }
    
    func putArticle(id: String) {
        let url = BoostCampAPI.articleURL.appendingPathComponent("/\(id)")
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.put.rawValue
        request.addValue("multipart/form-data", forHTTPHeaderField: "Content-type")
    }
    
    func deleteArticle(id: String) {
        let url = BoostCampAPI.articleURL.appendingPathComponent("/\(id)")
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.delete.rawValue
    }
    
    func createBody(parameters: [String: String],
                    boundary: String,
                    data: Data,
                    mimeType: String,
                    filename: String) -> Data {
        
        let body = NSMutableData()
        
        let boundaryPrefix = "--\(boundary)\r\n"
        
        for (key, value) in parameters {
            body.appendString(boundaryPrefix)
            body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.appendString("\(value)\r\n")
        }
        
        body.appendString(boundaryPrefix)
        body.appendString("Content-Disposition: form-data; name=\"image_data\"; filename=\"\(filename)\"\r\n")
        body.appendString("Content-Type: \(mimeType)\r\n\r\n")
        
        body.append(data)
        body.appendString("\r\n")
        body.appendString("--".appending(boundary.appending("--")))
        
        return body as Data
    }
}

extension NSMutableData {
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}

