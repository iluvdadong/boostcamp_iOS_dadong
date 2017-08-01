//
//  UserManager.swift
//  imageBoard
//
//  Created by dadong on 2017. 8. 1..
//  Copyright © 2017년 dadong. All rights reserved.
//

import Foundation

enum SignUpResult {
    case success(User)
    case failure(Error)
}

enum LoginResult {
    case success(User)
    case failure(Error)
}

enum LoginError: Error {
    case loginError
}

enum UserResult {
    case success(User)
    case failure(Error)
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

class UserManager {
    
    static let shared = UserManager()
    
    var me: User!
    
    static let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func signUp(email: String, nickname: String, password: String, confirm: String, completion: @escaping (SignUpResult) -> Void) {
        
        let url = BoostCampAPI.signUpURL
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = HttpMethod.post.rawValue
        
        let payload: [String:String] = ["email": email, "password": password, "nickname": nickname]
        let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: .prettyPrinted)
        
        request.httpBody = jsonData
        
        let task = UserManager.session.dataTask(with: request) { (data, response, error) in
            let result = BoostCampAPI.user(from: data!)
            
            switch result {
            case let .success(user):
                completion(.success(user))
            case let .failure(error):
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func login(email: String, password: String, completion: @escaping (LoginResult) -> Void) {
        
        let url = BoostCampAPI.loginURL
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = HttpMethod.post.rawValue
        
        let payload: [String:String] = ["email": email, "password": password]
        let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: .prettyPrinted)
        
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let result = BoostCampAPI.user(from: data!)
            
            switch result {
            case let .success(user):
                self.me = user
                completion(.success(user))
            case let .failure(error):
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

