//
//  DataService.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 27.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import Foundation
import Combine
import MVVMCombine

class DataService: DataProtocol {
    
    // MARK: Services
    
    @Service var dataUrlService: DataUrlProtocol
    @Service var httpService: HttpProtocol
    
    // MARK: Implementation
    
    func getUnicorns() -> AnyPublisher<[Unicorn], Error> {
        
        let url = dataUrlService.unicorns()
        
        return httpService.get(url: url)
            .map(\.data)
            .decode(type: [Unicorn].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getUnicorn(id: String) -> AnyPublisher<Unicorn, Error> {
        
        let url = dataUrlService.unicorn(id: id)
        
        return httpService.get(url: url)
            .map(\.data)
            .decode(type: Unicorn.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func postUnicorn(unicorn: Unicorn) -> AnyPublisher<Bool, Never> {
        
        let url = dataUrlService.unicorns()
        
        return httpService.post(url: url, value: unicorn)
            .map { _ in
                true
        }
        .catch { _ in
            Just(false)
        }
        .eraseToAnyPublisher()
    }
    
    func putUnicorn(id: String, unicorn: Unicorn) -> AnyPublisher<Bool, Never> {
        
        let url = dataUrlService.unicorn(id: id)
        
        return httpService.put(url: url, value: unicorn)
            .map { _ in
                true
        }
        .catch { _ in
            Just(false)
        }
        .eraseToAnyPublisher()
    }
    
    func deleteUnicorn(id: String) -> AnyPublisher<Bool, Never> {
        
        let url = dataUrlService.unicorn(id: id)
        
        return httpService.delete(url: url)
            .map { _ in
                true
        }
        .catch { _ in
            Just(false)
        }
        .eraseToAnyPublisher()
    }
}
