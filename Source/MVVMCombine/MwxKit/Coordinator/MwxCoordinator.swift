//
//  MwxCoordinator.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 12.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

/// Enum for the possible presentations supported by the
/// current implementation for view model coordinators.
public enum MwxPresentation {
    
    /// Define a coordinator presentation as the root view
    /// for your application window.
    case root
    
    /// Define a coordinator presentation as a tab item
    /// to embed it to current tab view context
    case tab
    
    /// Define a coordinator presentation as a navigation
    /// link to push the view over current context.
    case link
    
    /// Define a coordinator presentation as a sheet
    /// to present the view modally over current context.
    case sheet
}

/// You define the coordinator that manages the navigation
/// lifecycle of a view by coordinating its corresponding view model.
/// Implement the required `viewModelType` property to provide
/// the view model type.
public class MwxCoordinator<VM: AnyViewModel>: AnyCoordinator, ObservableObject {
    
    // MARK: Activators
    
    /// The published activator property which manages the
    /// the active state of link and sheet coordinators.
    /// - Note: Only works with link and sheet coordinators.
    @Published public var activator: Bool = false
    
    /// The published selection property which manages the
    /// the selection state of tab coordinators.
    /// - Note: Only works with tab coordinators.
    @Published public var selection: Int = 0
    
    // MARK: Generic Type
    
    /// The type of view model for this coordinator.
    ///
    /// When you create a coordinator, Swift infers this
    /// type from the generic `VM` type property.
    public var viewModelType: VM.Type
    
    // MARK: Behaviour
    
    /// The presentation use by the coordinator to present
    /// the view for the corresponding view model.
    public var presentation: MwxPresentation
    
    /// The input used to initialize this view model and passed
    /// from presenting view models.
    public var input: MwxInput?
    
    /// The callback closure that is invoked when the view
    /// for the corresponding view model disappears.
    public var onDisappear: (() -> Void)?
    
    // MARK: Relationship
    
    /// The managing coordinator that presented and is
    /// used to manage the current coordinator.
    public var managingCoordinator: AnyCoordinator?
    
    // MARK: View Factory
    
    /// The wrapper factory of the view coordinated by
    /// current defined coordinator.
    public var wrappedView: some MwxView {
        VM.make()
            .with(input)
            .coordinated(by: self)
    }
    
    /// The view that is of the coordinator manages its navigation
    /// lifecycle by coordinating its corresponding view model.
    public lazy var view: AnyView = {
        AnyView(
            wrappedView
        )
    }()
    
    // MARK: Initialization
    
    /// Creates an instance of this coordinator.
    /// - Parameters:
    ///     - viewModelType: A `Type` indicates the view
    ///     type of the coordinator.
    ///     - presentation: A `MwxPresentation` indicates
    ///     the presentation of the coordinator.
    ///     - managingCoordinator: A `AnyCoordinator`
    ///     indicates managing coordinator of the coordinator.
    ///     - input: A `MwxInput` indicates the input data store
    ///     of the coordinator.
    ///     - onDisappear: A `() -> Void` indicates the
    ///     disappearance callback closure of the coordinator.
    public required init(viewModelType: VM.Type,
                         presentation: MwxPresentation,
                         managingCoordinator: AnyCoordinator? = nil,
                         input: MwxInput? = nil,
                         onDisappear: @escaping () -> Void) {
        self.viewModelType = viewModelType
        self.presentation = presentation
        self.managingCoordinator = managingCoordinator
        self.input = input
        self.onDisappear = onDisappear
    }
    
    // MARK: Public Navigation
    
    /// Call this function to show the coordinator by changing
    /// its activator state property.
    /// - Note: Only works with link and sheet coordinators.
    public func show() {
        activator = true
    }
    
    /// Call this function to show the coordinator by changing
    /// its activator state property.
    /// - Note: Only works with link and sheet coordinators.
    /// - Parameters:
    ///     - input: A `MwxInput` indicates the input data
    ///     store of the coordinator.
    public func show(with input: MwxInput?) {
        view = AnyView(wrappedView.with(input))
        show()
    }
    
    /// Call this function to deactivate the coordinator by changing
    /// its activator state property.
    /// - Note: Only works with link coordinators.
    public func pop() {
        if presentation == .link {
            deactivate()
        }
    }
    
    /// Call this function to deactivate the coordinator by changing
    /// its activator state property.
    /// - Note: Only works with sheet coordinators.
    public func dismiss() {
        if presentation == .sheet {
            deactivate()
        }
    }
    
    /// Call this function to select the tab coordinator by changing
    /// its selection state property.
    /// - Note: Works with current tab coordinator or its managing
    /// coordinator hierarchy.
    /// - Parameters:
    ///     - selection: A `Int` indicates the index
    ///     tag of the selected tab view item.
    public func select(tab selection: Int) {
        
        // Set selection if current coordinator is tab
        setSelection(tab: selection)
        
        // If not then iterate through all its managing
        // coordinator to find out the tab view
        var coordinator: AnyCoordinator? = self
        
        while coordinator?.managingCoordinator != nil &&
            coordinator?.presentation != .tab {
                coordinator = coordinator?.managingCoordinator
        }
        
        // Set selection for the managaing coordinator if tab
        coordinator?.managingCoordinator?.setSelection(tab: selection)
    }
    
    // MARK: Internal Navigation
    
    /// Call this function to deactivate the coordinator by changing
    /// its activator state property.
    public func deactivate() {
        activator = false
    }
    
    /// Call this function to select the tab coordinator by changing
    /// its selection state property.
    /// - Note: Only works with the current tab coordinator.
    /// - Parameters:
    ///     - selection: A `Int` indicates the index
    ///     tag of the selected tab view item.
    public func setSelection(tab selection: Int) {
        self.selection = selection
    }
}

public extension MwxCoordinator {
    
    // MARK: Static Initializers
    
    /// Creates an instance of this coordinator.
    /// - Parameters:
    ///     - input: A `MwxInput` indicates the input data store
    ///     of the coordinator.
    func with(_ input: MwxInput?) -> MwxCoordinator {
        self.input = input
        return self
    }
    
    /// Creates an instance of this coordinator.
    /// - Parameters:
    ///     - onDisappear: A `() -> Void` indicates the
    ///     disappearance callback closure of the coordinator.
    func onDisappear(_ onDisappear: @escaping () -> Void) -> MwxCoordinator {
        self.onDisappear = onDisappear
        return self
    }
}
