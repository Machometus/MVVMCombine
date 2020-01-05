//
//  ViewModelExtensions.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 10.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import UIKit
import SwiftUI

/// A set of view model static initializer functions for coordinator factory.
public extension AnyViewModel {
    
    // MARK: Coordinator Factory
    
    /// Call this function to create an instance of a coordinator of
    /// root presentation for this view Model type.
    /// - Returns: The coordinator instance of this view model type.
    static func root() {
        let root = coordinator(presentation: .root)
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: root.view)
        }
    }
    
    /// Call this function to create an instance of a coordinator of
    /// tab presentation for this view Model type.
    /// - Parameters:
    ///     - sender: A generic `MwxViewModel` indicates the
    ///     sender view model for this request.
    /// - Returns: The coordinator instance of this view model type.
    static func tab<V: MwxView>(_ sender: MwxViewModel<V>) -> MwxCoordinator<Self> {
        return coordinator(presentation: .tab,
                           managingCoordinator: sender.coordinator)
    }
    
    /// Call this function to create an instance of a coordinator of
    /// link presentation for this view Model type.
    /// - Parameters:
    ///     - sender: A generic `MwxViewModel` indicates the
    ///     sender view model for this request.
    /// - Returns: The coordinator instance of this view model type.
    static func link<V: MwxView>(_ sender: MwxViewModel<V>) -> MwxCoordinator<Self> {
        return coordinator(presentation: .link,
                           managingCoordinator: sender.coordinator)
    }
    
    /// Call this function to create an instance of a coordinator of
    /// sheet presentation for this view Model type.
    /// - Parameters:
    ///     - sender: A generic `MwxViewModel` indicates the
    ///     sender view model for this request.
    /// - Returns: The coordinator instance of this view model type.
    static func sheet<V: MwxView>(_ sender: MwxViewModel<V>) -> MwxCoordinator<Self> {
        return coordinator(presentation: .sheet,
                           managingCoordinator: sender.coordinator)
    }
    
    /// Creates an instance of a coordinator for this view Model type.
    /// - Parameters:
    ///     - presentation: A `MwxPresentation` indicates
    ///     the presentation of the coordinator.
    ///     - managingCoordinator: A `AnyCoordinator`
    ///     indicates managing coordinator of the coordinator.
    /// - Returns: The coordinator instance of this view model type.
    static func coordinator(presentation: MwxPresentation,
                            managingCoordinator: AnyCoordinator? = nil) -> MwxCoordinator<Self> {
        return MwxCoordinator(viewModelType: self,
                              presentation: presentation,
                              managingCoordinator: managingCoordinator,
                              onDisappear: {})
    }
}

/// A set of view model static initializer functions for view factory.
public extension AnyViewModel {
    
    // MARK: View Factory
    
    /// Call this function to create the view and register its corresponding
    /// view model prototype.
    /// - Returns: The view for this view model.
    static func make() -> some MwxView {
        
        // Register this view model for future injections
        Mwx.register(Self.init)
            .lifeCycle(.prototype)

        return ViewType.init()
    }
}
