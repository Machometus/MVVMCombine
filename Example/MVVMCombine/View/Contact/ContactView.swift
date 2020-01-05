//
//  ContactView.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 28.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI
import MVVMCombine

struct ContactView: MwxView {
    
    // MARK: View Model
    
    @ViewModel var vm: ContactViewModel
    
    // MARK: Body
    
    var body: some View {
        MwxNavigationBody {
            MwxBody {
                VStack(spacing: 48) {
                    Image("me")
                        .contactImageStyle()
                        .snailAnimation(scale: 1.2,
                                        rotation: 360,
                                        power: .heavy,
                                        forever: false)
                    VStack {
                        Text(vm.name)
                            .contactNameStyle()
                        Text(vm.job)
                            .contactJobStyle()
                    }
                    HStack(spacing: 24) {
                        Button(action: vm.linkedin) {
                            Image("linkedin")
                            .contactIconStyle()
                        }
                        Button(action: vm.xing) {
                            Image("xing")
                            .contactIconStyle()
                        }
                        Button(action: vm.twitter) {
                            Image("twitter")
                            .contactIconStyle()
                        }
                    }
                }
            }
            .creamBodyStyle()
            .setupNavigationBar(with: vm)
        }
        .bind(to: vm)
    }
}

// MARK: Behaviour

fileprivate extension View {
    
    func setupNavigationBar(with vm: ContactViewModel) -> some View {
        
        self.navigationBarTitle(vm.title,
                                displayMode: .inline)
            .mangoNavigationBarStyle()
    }
}

// MARK: Preview

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
