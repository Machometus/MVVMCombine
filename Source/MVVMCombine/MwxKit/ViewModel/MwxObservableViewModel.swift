//
//  MwxObservableViewModel.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 11.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import Foundation

/// A piece of observable view model.
///
/// You define the model that is used by your view to
/// bind to properties and logic needed and to handle
/// its lifecycle.
public typealias MwxObservableViewModel<V: MwxView> = MwxViewModel<V> & ObservableObject
