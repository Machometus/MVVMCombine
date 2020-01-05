//
//  AnyViewModel.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 30.11.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

/// You conform to the `AnyViewModel` protocol to define the
/// model that is used by your view to bind to properties and logic
/// needed and to handle its lifecycle.
/// Implement the required `ViewType` property to provide the
/// view type.
public protocol AnyViewModel {
    
    // MARK: Associatedtypes
    
    /// The type of view for this view model.
    ///
    /// When you create a custom view model, Swift infers this
    /// type from the generic `V` type property.
    associatedtype ViewType: MwxView
    
    // MARK: Coordinators
    
    /// The coordinator managing this view model.
    var coordinator: AnyCoordinator? { get set }
    
    /// The tab coordinators managed by the managing coordinator
    /// of this view model.
    var tabCoordinators: [AnyCoordinator]? { get set }
    
    // MARK: Input & Output
    
    /// The input factory used to generate inputs in this view model.
    var output: MwxOutput { get set }
    
    /// The input used to initialize this view model and passed
    /// from presenting view models.
    var input: MwxInput { get set }
    
    // MARK: Initialization
    
    /// Creates an instance of this view model.
    /// **Required.**
    init()
    
    // MARK: Lifecycle
    
    /// The function called when the view for this view model
    /// appears each time.
    func didAppear()
    
    /// The function called when the view for this view model
    /// disappears each time.
    func didDisappear()
    
    // MARK: Navigation
    
    /// Call this function to pop the view for this view model
    /// if navigationly pushed.
    /// - Note: Only works with link coordinators.
    func pop()
    
    /// Call this function to dismiss the view for this view
    /// model if presented modally.
    /// - Note: Only works with sheet coordinators.
    func dismiss()
    
    /// Call this function to select the tab for this view model
    /// if tabs are defined.
    /// - Note: Only works if tab coordinators defined.
    /// - Parameters:
    ///     - selection: A `Int` indicates the selected
    ///     tab index.
    func select(tab selection: Int)
}
