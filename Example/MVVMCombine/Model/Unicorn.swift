//
//  Unicorn.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 27.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import Foundation

struct Unicorn: Codable {
    
    // MARK: Properties
    
    let _id: String
    let name: String
    let age: Int
    let colour: String
    
    // MARK: Initializers
    
    init(name: String, colour: String) {
        self._id = UUID().uuidString
        self.name = name
        self.age = 0
        self.colour = colour
    }
    
    // MARK: Encoder & Decoder

    private enum CodingKeys: String, CodingKey {
        case _id
        case name
        case age
        case colour
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        _id = try container.decode(String.self, forKey: ._id)
        name = try container.decode(String.self, forKey: .name)
        age = try container.decode(Int.self, forKey: .age)
        colour = try container.decode(String.self, forKey: .colour)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(colour, forKey: .colour)
    }
}
