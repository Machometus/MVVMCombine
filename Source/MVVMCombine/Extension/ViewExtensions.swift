//
//  ViewExtensions.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 09.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

/// A set of view wrapping up properties and methods.
public extension MwxView {
    
    // MARK: View Model
    
    /// The type of view model for this view.
    ///
    /// When you create a custom view, Swift infers this type from
    /// your implementation of the required `vm` property.
    weak var viewModel: MwxViewModel<Self>? {
        // HACK: Since property wrappers are not supported in protocol
        return self.vm as? MwxViewModel<Self>
    }
    
    // MARK: View Wrappers
    
    /// Call this function to wrap up the view model for this view with
    /// its current coordinator.
    /// - Parameters:
    ///     - coordinator: A `AnyCoordinator` indicates the
    ///     coordinator for this view.
    /// - Returns: The wrapped up view for this coordinator.
    func coordinated(by coordinator: AnyCoordinator?) -> some MwxView {
        
        if let coordinator = coordinator {
            self.viewModel?.coordinator = coordinator
        }
        
        return self
    }
    
    /// Call this function to wrap up the view model for this view with
    /// its input data store.
    /// - Parameters:
    ///     - input: A `MwxInput` indicates the input data store
    ///     of the coordinator.
    /// - Returns: The wrapped up view for this input.
    func with(_ input: MwxInput?) -> some MwxView {
        
        if let input = input {
            self.viewModel?.input = input
        }
        
        return self
    }
}
