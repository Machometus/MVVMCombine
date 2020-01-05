//
//  UnicornListView.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 27.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI
import MVVMCombine

struct UnicornListView: MwxView {
    
    // MARK: View Model
    
    @ViewModel var vm: UnicornListViewModel
    
    // MARK: Body
    
    var body: some View {
        MwxNavigationBody {
            MwxBody {
                if !vm.isEmpty {
                    UnicornList(unicorns: $vm.unicorns)
                        .coordinated(by: vm.unicornDetail)
                }
                else {
                    Text("No unicorns found")
                        .noTextStyle()
                }
            }
            .creamBodyStyle()
            .loading($vm.isLoading)
            .setupNavigationBar(with: vm)
        }
        .bind(to: vm)
    }
}

// MARK: Behaviour

fileprivate extension View {
    
    func setupNavigationBar(with vm: UnicornListViewModel) -> some View {
        
        self.navigationBarTitle(vm.title,
                                displayMode: .inline)
            .navigationBarItems(
                leading:
                Button(action: vm.reload) {
                    Image(systemName: "arrow.clockwise")
                },
                trailing:
                Button(action: vm.addUnicorn.show) {
                    Image(systemName: "plus")
                }
                .coordinated(by: vm.addUnicorn)
        )
            .mangoNavigationBarStyle()
    }
}

// MARK: Preview

struct UnicornListView_Previews: PreviewProvider {
    static var previews: some View {
        UnicornListView()
    }
}
