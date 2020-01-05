//
//  UnicornListViewModel.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 27.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI
import Combine
import MVVMCombine

class UnicornListViewModel: MwxObservableViewModel<UnicornListView> {
    
    // MARK: Services
    
    @Service var unicornService: UnicornProtocol
    
    // MARK: Publishers
    
    @Published var unicorns = [UnicornViewItem]()
    @Published var isLoading: Bool = true
    
    // MARK: Subscriptions
    
    var subscription: AnyCancellable?
    
    // MARK: Properties
    
    var title: LocalizedStringKey {
        "Unicorns"
    }
    
    var isEmpty: Bool {
        unicorns.isEmpty
    }
    
    // MARK: Coordinators
    
    lazy var addUnicorn = {
        AddUnicornViewModel
            .sheet(self)
            .onDisappear { [weak self] in
                self?.fetchUnicorns()
        }
    }()
    
    lazy var unicornDetail = {
        UnicornDetailViewModel
            .link(self)
            .onDisappear { [weak self] in
                self?.fetchUnicorns()
        }
    }()
    
    // MARK: View Lifecycle
    
    override func didAppear() {
        fetchUnicorns()
    }
    
    override func didDisappear() {
        subscription?.cancel()
    }
    
    // MARK: Public Functions
    
    func reload() {
        isLoading = true
        fetchUnicorns()
    }
    
    // MARK: Private Functions
    
    private func fetchUnicorns() {
        subscription = unicornService.getAll()
            .delay(for: .milliseconds(isLoading ? 6000 : 0), scheduler: RunLoop.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] unicorns in
                    self?.isLoading = false
                    self?.process(unicorns)
            })
    }
    
    private func process(_ unicorns: [UnicornViewItem]) {
        unicorns
            .forEach { unicorn in
                unicorn.detail = { [weak self] in
                    self?.detail(unicorn)
                } }
        
        self.unicorns = unicorns
    }
    
    private func detail(_ unicorn: UnicornViewItem) {
        let input = output(unicorn: unicorn)
        unicornDetail.show(with: input)
    }
}
