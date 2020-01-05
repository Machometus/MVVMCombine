//
//  UnicornDetailView.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 29.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI
import MVVMCombine

struct UnicornDetailView: MwxView {
    
    // MARK: View Model
    
    @ViewModel var vm: UnicornDetailViewModel
    
    // MARK: Body
    
    var body: some View {
        MwxBody {
            MwxBody {
                UnicornForm(name: $vm.name,
                            color: $vm.color,
                            action: vm.save)
            }
            .cantalopeBodyStyle()
            .setupNavigationBar(with: vm)
        }
        .bind(to: vm)
    }
}

// MARK: Behaviour

fileprivate extension View {
    
    func setupNavigationBar(with vm: UnicornDetailViewModel) -> some View {
        
        self.navigationBarTitle(vm.title,
                                displayMode: .inline)
            .navigationBarItems(
                trailing:
                Button(action: vm.delete) {
                    Image(systemName: "trash")
            })
            .mangoNavigationBarStyle()
    }
}

// MARK: Preview

struct UnicornDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UnicornDetailView()
    }
}
