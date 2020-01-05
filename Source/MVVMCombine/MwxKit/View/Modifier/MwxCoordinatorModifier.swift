//
//  MwxCoordinatorModifier.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 13.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

/// A link modifier that you apply to a view or another view modifier
/// coordinated by a link coordinator producing a navigation link for
/// this view.
public struct MwxLinkModifier<VM: AnyViewModel>: ViewModifier {
    
    /// The link coordinator for this view.
    ///
    /// When you create a coordinator, Swift infers this
    /// type from the generic `VM` type property.
    @ObservedObject public var coordinator: MwxCoordinator<VM>
    
    /// Creates a navigation link for the modified view.
    /// - Parameters:
    ///     - content: A closure returning the content of the view.
    /// - Returns: The view coordinated by a link coordinator with
    /// a navigation link.
    public func body(content: Content) -> some View {
        ZStack {
            NavigationLink(destination: coordinator.view.onDisappear {
                self.coordinator.deactivate()
                self.coordinator.onDisappear?()
            }, isActive: $coordinator.activator) {
                EmptyView()
            }
            .frame(width: 0, height: 0)
            .hidden()
            content
        }
    }
}

/// A link modifier that you apply to a view or another view modifier
/// coordinated by a sheet coordinator producing a sheet view for
/// this view.
public struct MwxSheetModifier<VM: AnyViewModel>: ViewModifier {
    
    /// The sheet coordinator for this view.
    ///
    /// When you create a coordinator, Swift infers this
    /// type from the generic `VM` type property.
    @ObservedObject public var coordinator: MwxCoordinator<VM>
    
    /// Creates a sheet view for the modified view.
    /// - Parameters:
    ///     - content: A closure returning the content of the view.
    /// - Returns: The view coordinated by a sheet coordinator with
    /// a sheet view.
    public func body(content: Content) -> some View {
        content.sheet(isPresented: $coordinator.activator,
                      onDismiss: {
                        self.coordinator.deactivate()
                        self.coordinator.onDisappear?()
        },
                      content: {
                        self.coordinator.view
        })
    }
}

/// A link modifier that you apply to a view or another view modifier
/// coordinated by a tab coordinator producing a tab view with tab
/// items for an input title and image.
public struct MwxTabModifier<VM: AnyViewModel>: ViewModifier {
    
    // MARK: Coordinator Hierarchy
    
    /// The tab coordinator for this view.
    ///
    /// When you create a coordinator, Swift infers this
    /// type from the generic `VM` type property.
    @ObservedObject public var coordinator: MwxCoordinator<VM>
    
    /// The tab coordinators managed by the managing coordinator
    /// of this view model.
    public var tabs: [AnyCoordinator]
    
    // MARK: Tab Factory
    
    /// Creates a tab view with tab items for the modified view.
    /// - Parameters:
    ///     - content: A closure returning the content of the view.
    /// - Returns: The view coordinated by a tab coordinator with
    /// a tab view and tab items.
    public func body(content: Content) -> some View {
        
        AnyView(
            TabView(selection: $coordinator.selection) {
                ForEach(0..<tabs.count) { index in
                    self.tab(index: index, coordinator: self.tabs[index])
                }
            }
            .accentColor(Color(UITabBar.appearance().tintColor)) // Accent colors is set from appearance tint color
            .edgesIgnoringSafeArea(.top)
        )
    }
    
    /// Creates a tab item for a tab coordinator tagged by its index
    /// and initialized with input title and image.
    /// - Parameters:
    ///     - index: A `Int` of the index and tag of tab item
    ///     - coordinator: A `AnyCoordinator` of the
    ///     coodinator for this tab item.
    /// - Returns: The tab item for a tab coordinator of a tab view.
    public func tab(index: Int, coordinator: AnyCoordinator) -> some View {
        
        // The input title and image sent with this coordinator
        guard let input = coordinator.input,
            let title = input.title as? String,
            let image = input.image as? String else {
                return AnyView(coordinator.view)
        }
        
        return AnyView(coordinator.view
            .tabItem {
                Image(image)
                Text(title)
        }
        .tag(index))
    }
}

/// A set of view methods to handle coordination requests for views
/// by mapping each coordinator presentation type to its appropriate
/// view modifier handler if available
public extension View {
    
    // MARK: Coordination Request Handler
    
    /// Call this function to handle coordination requests for views
    /// by mapping each coordinator presentation type to its appropriate
    /// view modifier handler if available.
    /// - Parameters:
    ///     - coordinator: A `MwxCoordinator` indicates the
    ///     coordinator for this view.
    /// - Returns: The modified view for this coordination request.
    func coordinated<VM: AnyViewModel>(by coordinator: MwxCoordinator<VM>?) -> some View {
        
        guard let coordinator = coordinator else {
            return self.noModifier()
        }
        
        if coordinator.presentation == .link {
            return self.linkModifier(coordinator)
        }
        else if coordinator.presentation == .sheet {
            return self.sheetModifier(coordinator)
        }
        else {
            return self.noModifier()
        }
    }
    
    /// Call this function to handle coordination requests for tab views
    /// by mapping each coordinator presentation type to its appropriate
    /// view modifier handler if available.
    /// - Parameters:
    ///     - coordinator: A `MwxCoordinator` indicates the
    ///     coordinator for this view.
    ///     - tabs: A `AnyCoordinator` array indicates the tab
    ///     coordinators for this tab view.
    /// - Returns: The modified tab view for this coordination request.
    func coordinated<VM: AnyViewModel>(by coordinator: MwxCoordinator<VM>?, tabs: [AnyCoordinator]) -> some View {
        
        guard let coordinator = coordinator else {
            return self.noModifier()
        }
        
        return self.tabModifier(coordinator, tabs: tabs)
    }
    
    // MARK: Coordinators Mapper
    
    /// Call this function to apply a link modifier to a view or another view
    /// modifier coordinated by a link coordinator producing a navigation link
    /// for this view.
    /// - Parameters:
    ///     - coordinator: A `MwxCoordinator` indicates the
    ///     coordinator for this view.
    /// - Returns: The modified view for this coordination request.
    func linkModifier<VM: AnyViewModel>(_ coordinator: MwxCoordinator<VM>) -> AnyView {
        return AnyView(self.modifier(MwxLinkModifier(coordinator: coordinator)))
    }
    
    /// Call this function to apply a sheet modifier to a view or another view
    /// modifier coordinated by a sheet coordinator producing a sheet view
    /// for this view.
    /// - Parameters:
    ///     - coordinator: A `MwxCoordinator` indicates the
    ///     coordinator for this view.
    /// - Returns: The modified view for this coordination request.
    func sheetModifier<VM: AnyViewModel>(_ coordinator: MwxCoordinator<VM>) -> AnyView {
        return AnyView(self.modifier(MwxSheetModifier(coordinator: coordinator)))
    }
    
    /// Call this function to apply a sheet modifier to a view or another view
    /// modifier coordinated by a tab coordinator producing a tab view with tab
    /// items for an input title and image.
    /// - Parameters:
    ///     - coordinator: A `MwxCoordinator` indicates the
    ///     coordinator for this view.
    ///     - tabs: A `AnyCoordinator` array indicates the tab
    ///     coordinators for this tab view.
    /// - Returns: The modified view for this coordination request.
    func tabModifier<VM: AnyViewModel>(_ coordinator: MwxCoordinator<VM>, tabs: [AnyCoordinator]) -> AnyView {
        return AnyView(self.modifier(MwxTabModifier(coordinator: coordinator, tabs: tabs)))
    }
    
    /// Call this function to apply a no modifier to a view or another view
    /// producing a type-erased view for this view.
    /// - Returns: The type-erased view for this coordination request.
    func noModifier() -> AnyView {
        return AnyView(self)
    }
}
