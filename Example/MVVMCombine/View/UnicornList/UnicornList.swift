//
//  UnicornList.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 29.12.19.
//  Copyright © 2019 Machometus. All rights reserved.
//

import SwiftUI
import MVVMCombine

struct UnicornList: View {
    
    // MARK: Bindings & Properties
    
    @Binding var unicorns: [UnicornViewItem]
    
    // MARK: Body
    
    var body: some View {
        
        List {
            ForEach(self.unicorns, id:\.id) { unicorn in
                UnicornCell(item: unicorn)
                    .defaultCellStyle()
                
            }
        }
        .defaultListStyle()
    }
}

// MARK: Preview

struct UnicornList_Previews: PreviewProvider {
    static var previews: some View {
        UnicornList(unicorns: .constant([]))
    }
}
