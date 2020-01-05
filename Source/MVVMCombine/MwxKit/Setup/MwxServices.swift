//
//  MwxServices.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 28.11.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import Foundation

/// A piece of services definer.
///
/// You register all services your application uses by defining their
/// classes and corresponding conforming protocols and lifecycle
/// for each service.
open class MwxServices: AnyServices {
    
    // MARK: Initialization
    
    /// Creates an instance of this services definer.
    public required init() {
    }
    
    // MARK: Registration
    
    /// Define services and corresponding conforming protocols
    /// and lifecycle for each service.
    open func registerServices() {
    }
}
