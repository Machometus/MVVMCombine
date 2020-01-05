//
//  FormStyle.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 29.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: Form Behaviour

extension Form {
    
    func defaultFormStyle() -> some View {
        
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        return self
    }
}
