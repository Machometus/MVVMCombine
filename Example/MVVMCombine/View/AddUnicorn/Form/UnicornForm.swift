//
//  UnicornForm.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 29.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI
import MVVMCombine

struct UnicornForm: View {
    
    // MARK: Bindings & Properties
    
    @Binding var name: String
    @Binding var color: UnicornColor
    
    var action: () -> Void
    
    var nameHeaderTitle: String {
        "name".uppercased()
    }
    
    var colorHeaderTitle: String {
        "color".uppercased()
    }
    
    var colorLiteral: Color {
        color.color()
    }
    
    // MARK: Body
    
    var body: some View {
        Form {
            Section(header: Text(nameHeaderTitle)) {
                UnicornNameRow(name: $name,
                               color: colorLiteral)
                    .defaultRowStyle()
            }
            Section(header: Text(colorHeaderTitle)) {
                UnicornColorRow(color: $color)
                    .defaultRowStyle()
            }
            Section {
                UnicornSaveRow(color: colorLiteral,
                               action: action)
                    .defaultRowStyle()
            }
        }
        .defaultFormStyle()
    }
}

// MARK: Preview

struct UnicornForm_Previews: PreviewProvider {
    static var previews: some View {
        UnicornForm(name: .constant("Pegasus"),
                    color: .constant(UnicornColor.red),
                    action: { } )
    }
}
