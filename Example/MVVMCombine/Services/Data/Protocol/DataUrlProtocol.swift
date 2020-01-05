//
//  DataUrlProtocol.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 27.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import Foundation

protocol DataUrlProtocol {
    
    /// Base Url for HTTP requests including secret
    var base: String { get }
    
    /// Unicorns Url
    func unicorns() -> URL?
    
    /// Unicorn Url for a given ID
    func unicorn(id: String) -> URL?
}
