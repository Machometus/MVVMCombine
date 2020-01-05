//
//  PickerStyle.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 29.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

// MARK: View Behaviour

extension View {
    
    func unicornWheelPickerStyle() -> some View {
        self.pickerStyle(WheelPickerStyle())
            .frame(width: 240,
                   height: 160)
            .clipped()
    }
}
