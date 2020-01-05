//
//  UnicornCell.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 29.12.19.
//  Copyright © 2019 Machometus. All rights reserved.
//

import SwiftUI
import MVVMCombine

struct UnicornCell: MwxCell {
    
    // MARK: View Item
    
    @ViewItem var item: UnicornViewItem
    
    // MARK: Body
    
    var body: some View {
        
        HStack {
            Image(item.colorImageName)
                .listIconStyle()
            Text(item.name)
                .listTitleStyle(item.fontColor)
            Spacer()
            Image(item.arrowImageName)
                .disclosureStyle()
        }
        .onTapGesture {
            self.item.detail?()
        }
    }
}

// MARK: Preview

struct UnicornCell_Previews: PreviewProvider {
    static var previews: some View {
        UnicornCell(item: UnicornViewItem(name: "Pegasus",
                                          color: .blue))
    }
}
