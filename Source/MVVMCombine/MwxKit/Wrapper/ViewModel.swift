//
//  ViewModel.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 30.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import Foundation

/// A property wrapper that subscribes to a `ObservableObject`
/// automatically invalidating the view when it changes.
/// define the `MwxObservableViewModel` view model property
/// that is used by your view to bind to properties and logic needed
/// and to handle its lifecycle.
public typealias ViewModel = EnvironmentObservedInject
