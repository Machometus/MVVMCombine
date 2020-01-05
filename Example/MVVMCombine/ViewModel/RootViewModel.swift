//
//  RootViewModel.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 19.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import MVVMCombine

class RootViewModel: MwxObservableViewModel<RootView> {
    
    // MARK: Inputs
    
    var unicornInput: MwxInput {
        output(title: "Unicorns",
               image: "list")
    }
    
    var contactInput: MwxInput {
        output(title: "Contact",
               image: "contact")
    }
    
    // MARK: Coordinators
    
    lazy var unicornList = {
        UnicornListViewModel
            .tab(self)
            .with(unicornInput)
    }()
    
    lazy var contact = {
        ContactViewModel
            .tab(self)
            .with(contactInput)
    }()
    
    // MARK: Tab Items
    
    override func tabs() -> [MwxTab] {
        return [
            unicornList,
            contact
        ]
    }
    
    // MARK: View Lifecycle
    
    override func didAppear() {
        select(tab: 1)
    }
}
