//
//  AnyServices.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 29.11.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import Foundation

/// You conform to the `AnyServices` protocol to register all
/// services your application uses by defining their classes and
/// corresponding conforming protocols and lifecycle for each service.
public protocol AnyServices {
    
    // MARK: Initialization
    
    /// Creates an instance of this services definer.
    /// **Required.**
    init()
    
    // MARK: Registration
    
    /// Define services and corresponding conforming protocols
    /// and lifecycle for each service.
    func registerServices()
}
