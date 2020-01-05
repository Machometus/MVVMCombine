//
//  ImageStyle.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 29.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

// MARK: Image Behaviour

extension Image {
    
    func listIconStyle() -> some View {
        self.resizable()
            .frame(width: 80, height: 80)
    }
    
    func disclosureStyle() -> some View {
        self.resizable()
            .frame(width: 28, height: 28)
    }
    
    func pickerIconStyle() -> some View {
        self.resizable()
            .frame(width: 25, height: 25)
    }
    
    func loadingStyle() -> some View {
        self.resizable()
            .frame(width: 160, height: 160)
    }
    
    func contactImageStyle() -> some View {
        self.resizable()
            .frame(width: 200,
                   height: 200)
            .cornerRadius(100)
            .clipped()
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .stroke(Color.mango,
                            lineWidth: 6)
        )
    }
    
    func contactIconStyle() -> some View {
        self.renderingMode(.original)
            .resizable()
            .frame(width: 72, height: 72)
    }
}
