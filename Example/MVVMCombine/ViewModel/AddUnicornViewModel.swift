//
//  AddUnicornViewModel.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 28.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI
import Combine
import MVVMCombine

class AddUnicornViewModel: MwxObservableViewModel<AddUnicornView> {
    
    // MARK: Services
    
    @Service var unicornService: UnicornProtocol
    
    // MARK: Publishers
    
    @Published var name: String = ""
    @Published var color: UnicornColor = .red
    
    // MARK: Subscriptions
    
    var addSubscription: AnyCancellable?
    
    // MARK: Properties
    
    var title: LocalizedStringKey {
        "New Unicorn"
    }
    
    // MARK: View Lifecycle
    
    override func didAppear() {
        name = ""
        color = .red
    }
    
    override func didDisappear() {
        addSubscription?.cancel()
    }
    
    // MARK: Public Functions
    
    func save() {
        
        let newUnicorn = UnicornViewItem(name: name,
                                         color: color)
        
        addSubscription = unicornService.add(unicorn: newUnicorn)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] success in
                    self?.dismiss()
            })
    }
}
