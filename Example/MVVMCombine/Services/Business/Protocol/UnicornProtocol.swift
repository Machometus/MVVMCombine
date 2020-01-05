//
//  UnicornProtocol.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 27.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import Foundation
import Combine

protocol UnicornProtocol {
    
    /// Get list of all unicrons available
    func getAll() -> AnyPublisher<[UnicornViewItem], Never>
    
    /// Get a unicorn for a given ID if available
    func get(id: String) -> AnyPublisher<UnicornViewItem?, Never>
    
    /// Add a newly created unicorn
    func add(unicorn: UnicornViewItem) -> AnyPublisher<Bool, Never>
    
    /// Update an existed unicorn with a new unicorn
    func update(unicorn: UnicornViewItem, with newUnicorn: UnicornViewItem) -> AnyPublisher<Bool, Never>
    
    /// Delete a unicorn
    func delete(unicorn: UnicornViewItem) -> AnyPublisher<Bool, Never>
}
