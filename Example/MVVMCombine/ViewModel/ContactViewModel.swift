//
//  ContactViewModel.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 28.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI
import MVVMCombine

class ContactViewModel: MwxObservableViewModel<ContactView> {
    
    // MARK: Properties
    
    var title: LocalizedStringKey {
        "Contact"
    }
    
    var name: String {
        "MOHAMED SALEM"
    }
    
    var job: String {
        "iOS Developer"
    }
    
    // MARK: View Lifecycle
    
    override func didAppear() {
    }
    
    override func didDisappear() {
    }
    
    // MARK: Public Functions
    
    func linkedin() {
        if let url = URL(string: "https://www.linkedin.com/in/machometus/") {
            UIApplication.shared.open(url)
        }
    }
    
    func xing() {
        if let url = URL(string: "https://www.xing.com/profile/Mohamed_Salem19") {
            UIApplication.shared.open(url)
        }
    }
    
    func twitter() {
        if let url = URL(string: "https://twitter.com/MSalemsson") {
            UIApplication.shared.open(url)
        }
    }
}
