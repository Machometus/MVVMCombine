//
//  UnicornSaveRow.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 29.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI
import MVVMCombine

struct UnicornSaveRow: View {
    
    // MARK: Properties
    
    var color: Color
    var action: () -> Void
    
    var title: String {
        "Save"
    }
    
    // MARK: Body
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(title)
                    .pickerTextStyle(color)
                Spacer()
            }
        }
    }
}

// MARK: Preview

struct UnicornSaveRow_Previews: PreviewProvider {
    static var previews: some View {
        UnicornSaveRow(color: Color.unicornRed,
                       action: { })
    }
}
