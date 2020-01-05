//
//  DataUrlService.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 27.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import Foundation

class DataUrlService: DataUrlProtocol {
    
    var base: String {
        "https://crudcrud.com/api/\(secret)/"
    }
    
    var secret: String {
        "398567a7a33448d39ed88a6cad93b03e"
    }
    
    func unicorns() -> URL? {
        URL(string: base + "unicorns")
    }
    
    func unicorn(id: String) -> URL? {
        URL(string: base + "unicorns/" + id)
    }
}
