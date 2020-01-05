//
//  AddUnicornView.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 28.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI
import MVVMCombine

struct AddUnicornView: MwxView {
    
    // MARK: View Model
    
    @ViewModel var vm: AddUnicornViewModel
    
    // MARK: Body
    
    var body: some View {
        MwxNavigationBody {
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
    
    func setupNavigationBar(with vm: AddUnicornViewModel) -> some View {
        
        self.navigationBarTitle(vm.title,
                                displayMode: .inline)
            .navigationBarItems(
                leading:
                Button(action: vm.dismiss) {
                    Image(systemName: "xmark")
            })
            .mangoNavigationBarStyle()
    }
}

// MARK: Preview

struct AddUnicornView_Previews: PreviewProvider {
    static var previews: some View {
        AddUnicornView()
    }
}
