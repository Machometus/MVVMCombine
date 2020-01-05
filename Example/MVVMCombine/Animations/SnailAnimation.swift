//
//  SnailAnimation.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 30.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI

enum SnailAnimationPower {
    case light
    case heavy
}

struct SnailAnimationModifier: ViewModifier {
    
    // MARK: States
    
    @State var scale: CGFloat = 1
    @State var rotation: Double = 0
    
    // MARK: Properties
    
    var scaleFactor: CGFloat
    var rotationFactor: Double
    var power: SnailAnimationPower
    var forever: Bool
    
    // MARK: Body
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                var animation = Animation
                    .interpolatingSpring(power: self.power)
                
                if self.forever {
                    animation = animation.repeatForever()
                }
                
                return withAnimation(animation) {
                    self.scale = self.scaleFactor
                    self.rotation = self.rotationFactor
                }
        }
    }
}

// MARK: Animation Behaviour

extension Animation {
    
    static func interpolatingSpring(power: SnailAnimationPower) -> Animation {
        
        switch power {
        case .light:
            return Animation.interpolatingSpring(mass: 0.8,
                                                 stiffness: 70.0,
                                                 damping: 8,
                                                 initialVelocity: 0)
        case .heavy:
            return Animation.interpolatingSpring(mass: 2.0,
                                                 stiffness: 150.0,
                                                 damping: 5,
                                                 initialVelocity: 0)
        }
    }
}

// MARK: View Behaviour

extension View {
    
    func snailAnimation(scale: CGFloat,
                        rotation: Double,
                        power: SnailAnimationPower,
                        forever: Bool) -> some View {
        self.modifier(SnailAnimationModifier(scaleFactor: scale,
                                             rotationFactor: rotation,
                                             power: power,
                                             forever: forever))
    }
}
