//
//  MwxInput.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 02.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import Foundation

/// A piece of view model input.
///
/// You define the input generated and passed to
/// each presented view model for initialiation.
@dynamicMemberLookup
public struct MwxInput: AnyInput {
    
    // MARK: Store
    
    /// The dictionary that stores all input chunks of data
    /// that could be dynamically looked up.
    public var dictionary: [String : Any]?
    
    // MARK: Dynamic Lookup
    
    /// Call this subscript to dynamically lookup chunks of
    /// data stored in input dictionary.
    /// - Parameters:
    ///     - string: A `String` for the key to get
    ///     value of the input data chunk.
    /// - Returns: The value for input data check.
    public subscript(dynamicMember string: String) -> Any? {
        return dictionary?[string]
    }
}
