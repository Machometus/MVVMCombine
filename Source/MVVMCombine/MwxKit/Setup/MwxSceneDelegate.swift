//
//  MwxSceneDelegate.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 28.11.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import UIKit
import SwiftUI

/// The core methods you use to respond to life-cycle events occurring within a scene.
open class MwxSceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: Window
    
    /// The main window associated with the scene.
    open var window: UIWindow?

    // MARK: Lifecycle State Transitioning
    
    /// Tells the delegate about the addition of a scene to the app.
    /// - Parameters:
    ///     - scene: The scene object being connected to your app.
    ///     - session: The session object containing details about the scene's configuration.
    ///     - options: Additional options to use when configuring the scene. Use the information in this object to handle actions that caused the creation of the scene. For example, use it to respond to a quick action selected by the user.
    open func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Use a UIHostingController as window root view controller
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    /// Tells the delegate that UIKit removed a scene from your app.
    /// - Parameters:
    ///     - scene: The scene that UIKit disconnected from your app.
    open func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    /// Tells the delegate that the scene became active and is now responding to user events.
    /// - Parameters:
    ///     - scene: The scene that became active and is now responding to user events.
    open func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    /// Tells the delegate that the scene is about to resign the active state and stop responding to user events.
    /// - Parameters:
    ///     - scene: The scene that is about to stop responding to user events.
    open func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    /// Tells the delegate that the scene is about to begin running in the foreground and become visible to the user.
    /// - Parameters:
    ///     - scene: The scene that is about to enter the foreground.
    open func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    /// Tells the delegate that the scene is running in the background and is no longer onscreen.
    /// - Parameters:
    ///     - scene: The scene that entered the background.
    open func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

