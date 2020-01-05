//
//  SceneDelegate.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 27/06/2019.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import UIKit
import SwiftUI
import MVVMCombine

class SceneDelegate: MwxSceneDelegate {
    
    override func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        super.scene(scene, willConnectTo: session, options: connectionOptions)
        
        RootViewModel.root()
    }
}
