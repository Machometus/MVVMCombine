//
//  MwxBody.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 01.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

/// A type-erased `View`.
///
/// An `MwxBody` allows changing the type of view used in
/// a given view hierarchy. Whenever the type of view used with
/// an `MwxBody` changes, the old hierarchy is destroyed and
/// a new hierarchy is created for the new type use to wrap up
/// a coordinated view.
public struct MwxBody<Content: View>: View {
    
    /// Represents a value with a view modifier applied to it.
    ///
    /// When you create a custom body, Swift infers this
    /// type from the generic `Content` type property.
    public let content: Content

    // MARK: Initialization
    
    /// Creates an instance of this view.
    /// **Required.**
    /// - Parameters:
    ///     - content: A closure returning the content of the view.
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    // MARK: Body Implementation
    
    /// Declares the content and behavior of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public var body: some View {
        content
    }
}

/// A type-erased `View`.
///
/// An `MwxNavigationBody` allows changing the type of view
/// used in a given view hierarchy. Whenever the type of view used
/// with an `MwxNavigationBody` changes, the old hierarchy is
/// destroyed and a new hierarchy is created for the new type use
/// to wrap up a coordinated navigation view.
public struct MwxNavigationBody<Content: View>: View {
    
    /// Represents a value with a view modifier applied to it.
    ///
    /// When you create a custom body, Swift infers this
    /// type from the generic `Content` type property.
    public let content: Content

    // MARK: Initialization
    
    /// Creates an instance of this view.
    /// **Required.**
    /// - Parameters:
    ///     - content: A closure returning the content of the view.
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    // MARK: Body Implementation
    
    /// Declares the content and behavior of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public var body: some View {
        NavigationView {
            content
        }
    }
}

/// A type-erased `View`.
///
/// An `MwxTabBody` allows changing the type of view used in
/// a given view hierarchy. Whenever the type of view used with an
/// `MwxTabBody` changes, the old hierarchy is destroyed and
/// a new hierarchy is created for the new type use to wrap up a
/// tab view coordinated view.
public struct MwxTabBody: View {
    
    // MARK: Initialization
    
    /// Creates an instance of this view.
    /// **Required.**
    public init() {
    }
    
    // MARK: Body Implementation
    
    /// Declares the content and behavior of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public var body: some View {
        MwxBody {
            EmptyView()
        }
    }
}

/// A set of body extensions for view styling
public extension MwxBody {
    
    // MARK: Body Styling
    
    /// Applies a modifier style to a body view.
    /// - Parameters:
    ///     - style: A `ViewModifier` of the applied body style.
    /// - Returns: The styled body view.
    func bodyStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}
