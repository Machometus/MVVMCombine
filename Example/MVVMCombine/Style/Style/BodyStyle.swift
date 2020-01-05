//
//  BodyStyle.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 28.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI
import MVVMCombine

// MARK: View Modifiers

struct CreamBodyStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        ZStack {
            Color.cream
                .edgesIgnoringSafeArea(.all)
            content
        }
    }
}

struct CantalopeBodyStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        ZStack {
            Color.cantalope
                .edgesIgnoringSafeArea(.all)
            content
        }
    }
}

// MARK: Body Behaviour

extension MwxBody {
    func creamBodyStyle() -> some View {
        bodyStyle(CreamBodyStyle())
    }
    
    func cantalopeBodyStyle() -> some View {
        bodyStyle(CantalopeBodyStyle())
    }
}
