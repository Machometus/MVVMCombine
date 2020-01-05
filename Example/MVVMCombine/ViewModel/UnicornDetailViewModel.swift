//
//  UnicornDetailViewModel.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 29.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI
import Combine
import MVVMCombine

class UnicornDetailViewModel: MwxObservableViewModel<UnicornDetailView> {
    
    // MARK: Services
    
    @Service var unicornService: UnicornProtocol
    
    // MARK: Publishers
    
    @Published var name: String = ""
    @Published var color: UnicornColor = .red
    
    // MARK: Subscriptions
    
    var updateSubscription: AnyCancellable?
    var deleteSubscription: AnyCancellable?
    
    // MARK: Properties
    
    var title: LocalizedStringKey {
        "Edit Unicorn"
    }
    
    var unicorn: UnicornViewItem?
    
    // MARK: View Lifecycle
    
    override func didAppear() {
        getUnicornFromInput()
    }
    
    override func didDisappear() {
        updateSubscription?.cancel()
        deleteSubscription?.cancel()
    }
    
    // MARK: Public Functions
    
    func save() {
        
        guard let unicorn = unicorn else {
            dismiss()
            return
        }
        
        let newUnicorn = UnicornViewItem(name: name,
                                         color: color)
        
        updateSubscription = unicornService.update(unicorn: unicorn,
                                                   with: newUnicorn)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] success in
                    self?.pop()
            })
    }
    
    func delete() {
        
        guard let unicorn = unicorn else {
            dismiss()
            return
        }
        
        deleteSubscription = unicornService.delete(unicorn: unicorn)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] success in
                    self?.pop()
            })
    }
    
    // MARK: Private Functions
    
    private func getUnicornFromInput() {
        if let item = input.unicorn as? UnicornViewItem {
            unicorn = item
            name = item.name
            color = item.color
        }
    }
}
