//
//  RootView.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 19.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import SwiftUI
import MVVMCombine

struct RootView: MwxView {
    
    // MARK: View Model
    
    @ViewModel var vm: RootViewModel
    
    // MARK: Body
    
    var body: some View {
        MwxTabBody()
        .mangoTabBarStyle()
        .bind(to: vm)
    }
}

// MARK: Preview

#if DEBUG
struct RootView_Previews : PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
#endif
