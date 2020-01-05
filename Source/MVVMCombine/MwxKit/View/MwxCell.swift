//
//  MwxCell.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 01.01.20.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

/// A piece of user interface.
///
/// You create custom cells by declaring types that conform to the
/// `MwxCell` protocol.
/// Implement the required `body` property to provide the content
/// and behavior for your custom view.
/// Implement the required `vi` property to provide the view item.
public protocol MwxCell: View {
    
    // MARK: Associatedtypes
    
    /// The type of view item for this view.
    ///
    /// When you create a custom view, Swift infers this type from
    /// your implementation of the required `vi` property.
    associatedtype VI
    
    // MARK: View Item
    
    /// Declares the view item of this view.
    var item: VI { get set }
}
