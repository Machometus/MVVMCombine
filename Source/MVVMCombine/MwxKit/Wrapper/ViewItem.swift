//
//  ViewItem.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 01.01.20.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

/// A property wrapper that subscribes to a `ObservableObject`
/// automatically invalidating the view when it changes.
/// define the `MwxViewItem` view item property
/// that is used by your view to bind to properties and logic needed
/// and to handle its lifecycle.
public typealias ViewItem = ObservedObject
