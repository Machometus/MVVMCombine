//
//  TextStyle.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 29.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

// MARK: Text Behaviour

extension Text {
    
    func listTitleStyle(_ color: Color) -> some View {
        self.font(.largeTitle)
            .foregroundColor(color)
            .padding([.leading, .bottom], 10)
    }
    
    func pickerTextStyle(_ color: Color) -> some View {
        self.foregroundColor(color)
    }
    
    func noTextStyle() -> some View {
        self.bold()
            .foregroundColor(.mango)
    }
    
    func contactNameStyle() -> some View {
        self.font(.largeTitle)
            .foregroundColor(.mango)
    }
    
    func contactJobStyle() -> some View {
        self.font(.title)
            .foregroundColor(.starfish)
    }
}
