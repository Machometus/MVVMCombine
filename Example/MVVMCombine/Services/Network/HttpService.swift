//
//  HttpService.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 27.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import Foundation
import Combine

class HttpService: HttpProtocol {
        
    func get(url: URL?) -> AnyPublisher<(data: Data, response: URLResponse), URLError> {
        
        guard let url = url else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func post<T: Codable>(url: URL?, value: T) -> AnyPublisher<(data: Data, response: URLResponse), URLError> {
                
        guard let url = url,
        let json = try? JSONEncoder().encode(value) else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = json
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func put<T: Codable>(url: URL?, value: T) -> AnyPublisher<(data: Data, response: URLResponse), URLError> {
                
        guard let url = url,
        let json = try? JSONEncoder().encode(value) else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = json
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func delete(url: URL?) -> AnyPublisher<(data: Data, response: URLResponse), URLError> {
        
        guard let url = url else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
