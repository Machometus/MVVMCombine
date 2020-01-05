//
//  ListStyle.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 29.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: List Behaviour

extension List {
    
    func defaultListStyle() -> some View {
        
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        return self
    }
}
