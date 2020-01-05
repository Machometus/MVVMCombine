//
//  AnyCoordinator.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 13.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

/// You conform to the `AnyCoordinator` protocol to define the
/// coordinator that manages the navigation lifecycle of a view by
/// coordinating its corresponding view model.
/// Implement the required `viewModelType` property to provide
/// the view model type.
public protocol AnyCoordinator {
    
    // MARK: Behaviour
    
    /// The presentation use by the coordinator to present
    /// the view for the corresponding view model.
    var presentation: MwxPresentation { get set }
    
    /// The input used to initialize this view model and passed
    /// from presenting view models.
    var input: MwxInput? { get set }
    
    /// The callback closure that is invoked when the view
    /// for the corresponding view model disappears.
    var onDisappear: (() -> Void)? { get set }
    
    // MARK: Relationship
    
    /// The managing coordinator that presented and is
    /// used to manage the current coordinator.
    var managingCoordinator: AnyCoordinator? { get set }
    
    // MARK: View Factory
    
    /// The view that is of the coordinator manages its navigation
    /// lifecycle by coordinating its corresponding view model.
    var view: AnyView { get }
    
    // MARK: Public Navigation
    
    /// Call this function to show the coordinator by changing
    /// its activator state property.
    /// - Note: Only works with link and sheet coordinators.
    func show()
    
    /// Call this function to show the coordinator by changing
    /// its activator state property.
    /// - Note: Only works with link and sheet coordinators.
    /// - Parameters:
    ///     - input: A `MwxInput` indicates the input data
    ///     store of the coordinator.
    func show(with input: MwxInput?)
    
    /// Call this function to deactivate the coordinator by changing
    /// its activator state property.
    /// - Note: Only works with link coordinators.
    func pop()
    
    /// Call this function to deactivate the coordinator by changing
    /// its activator state property.
    /// - Note: Only works with sheet coordinators.
    func dismiss()
    
    /// Call this function to select the tab coordinator by changing
    /// its selection state property.
    /// - Note: Works with current tab coordinator or its managing
    /// coordinator hierarchy.
    /// - Parameters:
    ///     - selection: A `Int` indicates the index
    ///     tag of the selected tab view item.
    func select(tab selection: Int)
    
    // MARK: Internal Navigation
    
    /// Call this function to deactivate the coordinator by changing
    /// its activator state property.
    func deactivate()
    
    /// Call this function to select the tab coordinator by changing
    /// its selection state property.
    /// - Note: Only works with the current tab coordinator.
    /// - Parameters:
    ///     - selection: A `Int` indicates the index
    ///     tag of the selected tab view item.
    func setSelection(tab selection: Int)
}
