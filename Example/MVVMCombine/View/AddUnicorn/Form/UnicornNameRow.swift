//
//  UnicornNameRow.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 29.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI
import MVVMCombine

struct UnicornNameRow: View {
    
    // MARK: Bindings & Properties
    
    @Binding var name: String
    
    var color: Color
    
    var placeholder: String {
        "Pegasus"
    }
    
    // MARK: Body
    
    var body: some View {
        TextField(placeholder, text: $name)
            .pickerTextStyle(color)
    }
}

// MARK: Preview

struct UnicornNameRow_Previews: PreviewProvider {
    static var previews: some View {
        UnicornNameRow(name: .constant("Pegasus"),
                       color: Color.unicornRed)
    }
}
