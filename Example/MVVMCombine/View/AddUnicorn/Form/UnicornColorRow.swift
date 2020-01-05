//
//  UnicornColorRow.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 29.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI
import MVVMCombine

struct UnicornColorRow: View {
    
    // MARK: Bindings
    
    @Binding var color: UnicornColor
    
    // MARK: Body
    
    var body: some View {
        HStack {
            Spacer()
            Picker(selection: $color, label: EmptyView()) {
                ForEach(UnicornColor.allCases, id: \.rawValue) { color in
                    UnicornPickerItemRow(color: color)
                }
            }
            .unicornWheelPickerStyle()
            Spacer()
        }
    }
}

// MARK: Preview

struct UnicornColorRow_Previews: PreviewProvider {
    static var previews: some View {
        UnicornColorRow(color: .constant(.red))
    }
}
