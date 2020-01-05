//
//  AnyViewItem.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 01.01.20.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

/// You conform to the `AnyViewItem` protocol to define the
/// model that is used by your view to bind to properties and logic
/// needed and to handle its lifecycle.
public protocol AnyViewItem: ObservableObject, Identifiable {
    
}
