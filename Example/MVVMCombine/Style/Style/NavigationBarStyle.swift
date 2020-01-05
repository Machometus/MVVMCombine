//
//  NavigationBarStyle.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 28.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

// MARK: Navigation Configurator

// https://stackoverflow.com/a/58427754/1205484
// Although SwiftUI does not expose navigation styling directly, you can work around that by using UIViewControllerRepresentable. Since SwiftUI is using a regular UINavigationController behind the scenes, the view controller will still have a valid .navigationController property.
struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}

// MARK: View Behaviour

extension View {
    
    func mangoNavigationBarStyle() -> some View {
        self.background(
            NavigationConfigurator { nc in
                nc.navigationBar.barStyle = .black
                nc.navigationBar.tintColor = .cream
                nc.navigationBar.barTintColor = .mango
                nc.navigationBar.backgroundColor = .mango
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.cream]
        })
    }
}
