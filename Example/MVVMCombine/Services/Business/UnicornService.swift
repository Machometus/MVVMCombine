//
//  UnicornService.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 27.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import Foundation
import Combine
import MVVMCombine

class UnicornService: UnicornProtocol {
    
    // MARK: Services
    
    @Service var dataService: DataProtocol
    
    // MARK: Implementation
    
    func getAll() -> AnyPublisher<[UnicornViewItem], Never> {
        return dataService.getUnicorns()
            .map { unicorns in
                unicorns.map { UnicornViewItem(unicorn: $0) }
        }
        .catch { _ in
            Just([])
        }
        .eraseToAnyPublisher()
    }
    
    func get(id: String) -> AnyPublisher<UnicornViewItem?, Never> {
        return dataService.getUnicorn(id: id)
            .map { UnicornViewItem(unicorn: $0) }
            .catch { _ in
                Just(nil)
            }
            .eraseToAnyPublisher()
    }
    
    func add(unicorn: UnicornViewItem) -> AnyPublisher<Bool, Never> {
        return dataService.postUnicorn(unicorn: unicorn.unicorn)
            .eraseToAnyPublisher()
    }
    
    func update(unicorn: UnicornViewItem, with newUnicorn: UnicornViewItem) -> AnyPublisher<Bool, Never> {
        return dataService.putUnicorn(id: unicorn.id, unicorn: newUnicorn.unicorn)
            .eraseToAnyPublisher()
    }
    
    func delete(unicorn: UnicornViewItem) -> AnyPublisher<Bool, Never> {
        return dataService.deleteUnicorn(id: unicorn.id)
            .eraseToAnyPublisher()
    }
}
