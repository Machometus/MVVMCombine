//
//  MwxView.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 11.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

/// A piece of user interface.
///
/// You create custom views by declaring types that conform to the
/// `MwxView` protocol.
/// Implement the required `body` property to provide the content
/// and behavior for your custom view.
/// Implement the required `vm` property to provide the view model.
public protocol MwxView: View {
    
    // MARK: Associatedtypes
    
    /// The type of view model for this view.
    ///
    /// When you create a custom view, Swift infers this type from
    /// your implementation of the required `vm` property.
    associatedtype VM
    
    // MARK: View Model
    
    /// Declares the view model of this view.
    var vm: VM { get }
    
    // MARK: Initialization
    
    /// Creates an instance of this view.
    /// **Required.**
    init()
}
