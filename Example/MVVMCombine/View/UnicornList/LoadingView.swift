//
//  LoadingView.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 29.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI
import MVVMCombine

struct LoadingView: View {
    
    // MARK: States
    
    @State var scale: CGFloat = 1
    @State var rotation: Double = 0
    
    // MARK: Body
    
    var body: some View {
        Image("loading")
            .loadingStyle()
            .snailAnimation(scale: 1.2,
                            rotation: 360,
                            power: .light,
                            forever: true)
    }
}

// MARK: View Modifiers

struct LoadingModifier: ViewModifier {
    
    @Binding var isLoading: Bool
    
    func body(content: Content) -> some View {
        
        ZStack {
            content
            
            if isLoading {
                LoadingView()
            }
        }
    }
}

// MARK: Behaviour

extension View {
    
    func loading(_ isLoading: Binding<Bool>) -> some View {
        self.modifier(LoadingModifier(isLoading: isLoading))
    }
}

// MARK: Preview

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
