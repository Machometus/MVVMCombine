//
//  MwxOutput.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 15.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import Foundation

/// A piece of output factory.
///
/// You define the output factory that generates
/// inputs passed to presented view models for
/// initialiation.
@dynamicCallable
public struct MwxOutput: AnyOutput {
    
    // MARK: Factory
    
    /// Call this function to dynamically generates inputs
    /// passed to presented view models for initialiation.
    /// - Parameters:
    ///     - pairs: A `KeyValuePairs` for the
    ///     key and value of the input data chunk.
    /// - Returns: The generated input data store.
    @discardableResult
    public func dynamicallyCall(withKeywordArguments pairs: KeyValuePairs<String, Any>) -> MwxInput {

        var dictionary = [String : Any]()

        for pair in pairs {
            dictionary[pair.key] = pair.value
        }
        
        var input = MwxInput()
        input.dictionary = dictionary
        
        return input
    }
}
