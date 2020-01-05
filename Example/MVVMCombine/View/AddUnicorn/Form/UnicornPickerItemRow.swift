//
//  UnicornPickerItemRow.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 29.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI
import MVVMCombine

struct UnicornPickerItemRow: View {
    
    // MARK: Properties
    
    var color: UnicornColor
    
    // MARK: Body
    
    var body: some View {
        HStack {
            Image(color.rawValue)
                .pickerIconStyle()
            Spacer()
            Text(color.rawValue.uppercased())
                .pickerTextStyle(color.color())
        }
        .tightPickerItemStyle()
        .tag(color)
    }
}

// MARK: Preview

struct UnicornPickerItemRow_Previews: PreviewProvider {
    static var previews: some View {
        UnicornPickerItemRow(color: .red)
    }
}
