//
//  TabBarStyle.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 28.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import MVVMCombine

// MARK: Tab Body Behaviour

extension MwxTabBody {
    
    func mangoTabBarStyle() -> MwxTabBody {
        
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().tintColor = .cream
        UITabBar.appearance().barTintColor = .mango
        UITabBar.appearance().backgroundColor = .mango
        UITabBar.appearance().unselectedItemTintColor = .starfish
        
        return self
    }
}
