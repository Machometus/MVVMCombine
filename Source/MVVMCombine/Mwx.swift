//
//  Mwx.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 28.11.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

/// The main interface for exposing and wrapping up the framework
/// with set of functions for type register and resolve
public class Mwx {
    
    // MARK: Type Register
    
    /// Call this static function to register a type in the current component
    /// context store using SwiftDI injection engine.
    /// - Parameters:
    ///     - initialize: A `() -> T` indicates the initialization
    ///     closure of type inferred as `T`.
    /// - Returns: The component context of the registered type.
    public static func register<T>(_ initialize: @escaping () -> T) -> DIComponentContext<T> {
        return SwiftDI.register(initialize)
    }
    
    // MARK: Type Resolve
    
    /// Call this static function to resolve a type from the current component
    /// context store using SwiftDI injection engine.
    /// - Parameters:
    ///     - type: A `T.Type` indicates the type being resolved
    /// - Returns: An instance of the type resolved from component store.
    public static func resolve<T>(_ type: T.Type) -> T {
        return SwiftDI.resolve(type)
    }
}
