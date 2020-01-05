//
//  DataProtocol.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 27.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import Foundation
import Combine

protocol DataProtocol {
    
    /// Get list of all unicorns available or publish an error
    func getUnicorns() -> AnyPublisher<[Unicorn], Error>
    
    /// Get a unicorn for a given ID if available or publish an error
    func getUnicorn(id: String) -> AnyPublisher<Unicorn, Error>
    
    /// Post a new unicorn
    func postUnicorn(unicorn: Unicorn) -> AnyPublisher<Bool, Never>
    
    /// Put an updated unicorn
    func putUnicorn(id: String, unicorn: Unicorn) -> AnyPublisher<Bool, Never>
    
    /// Delete a unicorn
    func deleteUnicorn(id: String) -> AnyPublisher<Bool, Never>
}
