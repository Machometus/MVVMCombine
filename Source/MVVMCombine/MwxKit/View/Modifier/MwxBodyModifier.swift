//
//  MwxBodyModifier.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 28.11.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

/// A view modifier used to bind and wrap up a body or navigation view
/// to its corresponding view model lifecycle.
public struct MwxBodyModifier<VM: AnyViewModel>: ViewModifier {
    
    /// The type of view model for this view modifier.
    ///
    /// When you bind to a view modifier, Swift infers this type from
    /// your implementation of the required `vm` property.
    public var viewModel: VM
    
    /// Gets the current body of the caller.
    /// **Required.** Default implementation provided.
    /// - Parameters:
    ///     - content: A `Content` is a proxy for the view that
    ///     will have the modifier represented by Self applied to it.
    /// - Returns: The current body of self. content is a proxy for
    /// the view that will have the modifier represented by Self applied to it.
    public func body(content: Content) -> some View {
        content
            .onAppear {
                self.viewModel.didAppear()
            }
            .onDisappear {
                self.viewModel.didDisappear()
            }
    }
}

/// A view modifier used to bind and wrap up a body view and its tabs
/// to its corresponding view model lifecycle.
struct MwxTabBodyModifier<VM: AnyViewModel>: ViewModifier {
    
    /// The type of view model for this view modifier.
    ///
    /// When you bind to a view modifier, Swift infers this type from
    /// your implementation of the required `vm` property.
    public var viewModel: VM
    
    /// Gets the current body of the caller.
    /// **Required.** Default implementation provided.
    /// - Parameters:
    ///     - content: A `Content` is a proxy for the view that
    ///     will have the modifier represented by Self applied to it.
    /// - Returns: The current body of self. content is a proxy for
    /// the view that will have the modifier represented by Self applied to it.
    public func body(content: Content) -> some View {
        
        //If tabs are not available for this tab view then just bind it
        guard let coordinator = viewModel.coordinator as? MwxCoordinator<VM>,
            let tabs = viewModel.tabCoordinators else {
            return AnyView(content
                .onAppear {
                    self.viewModel.didAppear()
                }
                .onDisappear {
                    self.viewModel.didDisappear()
                }
            )
        }
        
        //If available then bind and wrap up its tabs too
        return AnyView(AnyView(content)
            .coordinated(by: coordinator, tabs: tabs)
            .onAppear {
                self.viewModel.didAppear()
            }
            .onDisappear {
                self.viewModel.didDisappear()
            }
        )
    }
}

public extension MwxBody {
    
    func bind<VM: AnyViewModel>(to viewModel: VM) -> some View {
        self.modifier(MwxBodyModifier(viewModel: viewModel))
    }
}

public extension MwxNavigationBody {
    
    func bind<VM: AnyViewModel>(to viewModel: VM) -> some View {
        self.modifier(MwxBodyModifier(viewModel: viewModel))
    }
}

public extension MwxTabBody {
    
    func bind<VM: AnyViewModel>(to viewModel: VM) -> some View {
        self.modifier(MwxTabBodyModifier(viewModel: viewModel))
    }
}
