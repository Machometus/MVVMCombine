//
//  AnyOutput.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 15.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import Foundation

/// You conform to the `AnyOutput` protocol to define
/// the output factory that generates inputs passed to
/// presented view models for initialiation.
public protocol AnyOutput {
    
    // MARK: Factory
    
    /// Call this function to dynamically generates inputs
    /// passed to presented view models for initialiation.
    /// - Parameters:
    ///     - pairs: A `KeyValuePairs` for the
    ///     key and value of the input data chunk.
    /// - Returns: The generated input data store.
    func dynamicallyCall(withKeywordArguments pairs: KeyValuePairs<String, Any>) -> MwxInput
}
