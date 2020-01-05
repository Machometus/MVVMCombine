//
//  MwxViewModel.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 28.11.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

/// A piece of view model.
///
/// You define the model that is used by your view to
/// bind to properties and logic needed and to handle
/// its lifecycle.
open class MwxViewModel<V: MwxView>: AnyViewModel {
    
    // MARK: Typealiases
    
    /// The type of view for this view model.
    ///
    /// When you create a custom view model, Swift infers this
    /// type from the generic `V` type property.
    public typealias ViewType = V
    
    /// A typealias for the `tabCoordinators` property.
    public typealias MwxTab = AnyCoordinator
    
    // MARK: Coordinators
    
    /// The coordinator managing this view model.
    public var coordinator: AnyCoordinator?
    
    /// The tab coordinators managed by the managing coordinator
    /// of this view model.
    public lazy var tabCoordinators: [AnyCoordinator]? = tabs()
    
    // MARK: Input & Output
    
    /// The input factory used to generate inputs in this view model.
    public var output: MwxOutput
    
    /// The input used to initialize this view model and passed
    /// from presenting view models.
    public var input: MwxInput
    
    // MARK: Initialization
    
    /// Creates an instance of this view model
    /// **Required.**
    public required init() {
        self.output = MwxOutput()
        self.input = MwxInput()
    }
    
    // MARK: Lifecycle
    
    /// The function called when the view for this view model
    /// appears each time.
    open func didAppear() {
    }
    
    /// Define services and corresponding conforming protocols
    /// and lifecycle for each service.
    open func didDisappear() {
    }
    
    // MARK: Navigation
    
    /// Override this function to define the tab coordinators
    /// managed by the managing coordinator of this view model.
    /// - Returns: The tab coordinators managed by the
    /// managing coordinator of this view model
    open func tabs() -> [MwxTab] {
        return []
    }
    
    /// Call this function to pop the view for this view model
    /// if navigationly pushed.
    /// - Note: Only works with link coordinators.
    public func pop() {
        coordinator?.pop()
    }
    
    /// Call this function to dismiss the view for this view
    /// model if presented modally.
    /// - Note: Only works with sheet coordinators
    public func dismiss() {
        coordinator?.dismiss()
    }
    
    /// Call this function to select the tab for this view model
    /// if tabs are defined.
    /// - Note: Only works if tab coordinators defined.
    /// - Parameters:
    ///     - selection: A `Int` indicates the selected
    ///     tab index.
    public func select(tab selection: Int) {
        coordinator?.select(tab: selection)
    }
}
