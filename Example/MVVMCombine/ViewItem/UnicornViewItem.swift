//
//  UnicornViewItem.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 27.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI
import MVVMCombine

enum UnicornColor: String, CaseIterable {
    
    // MARK: Cases
    
    case red = "red"
    case green = "green"
    case blue = "blue"
    
    // MARK: Initializers
    
    init(color: String) {
        self = UnicornColor.allCases.first{ "\($0)" == color } ?? .red
    }
    
    // MARK: Converters
    
    func color() -> Color {
        switch self {
        case .red:
            return Color.unicornRed
        case .green:
            return Color.unicornGreen
        case .blue:
            return Color.unicornBlue
        }
    }
}

class UnicornViewItem: MwxViewItem {
    
    // MARK: Properties
    
    var unicorn: Unicorn = Unicorn(name: "",
                                   colour: "")
    
    var detail: (() -> Void)?
    
    // MARK: Getters
    
    var id: String {
        unicorn._id
    }
    
    var name: String {
        unicorn.name
    }
    
    var color: UnicornColor {
        UnicornColor(color: unicorn.colour)
    }
    
    var colorImageName: String {
        color.rawValue
    }
    
    var arrowImageName: String {
        "arrow_" + color.rawValue
    }
    
    var fontColor: Color {
        color.color()
    }
    
    // MARK: Initializers
    
    init(name: String, color: UnicornColor) {
        super.init()
        self.unicorn = Unicorn(name: name, colour: color.rawValue)
    }
    
    init(unicorn: Unicorn) {
        super.init()
        self.unicorn = unicorn
    }
}
