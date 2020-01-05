//
//  Services.swift
//  MvvmCombine
//
//  Created by Mohamed Salem on 28.11.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import MVVMCombine

class Services: MwxServices {
    
    override func registerServices() {
        
        // MARK: Network Services
        
        Mwx.register(HttpService.init)
            .as(HttpProtocol.self).lifeCycle(.weakSingle)
        
        // MARK: Data Services
        
        Mwx.register(DataUrlService.init)
            .as(DataUrlProtocol.self).lifeCycle(.weakSingle)
        Mwx.register(DataService.init)
            .as(DataProtocol.self).lifeCycle(.weakSingle)
        
        // MARK: Business Services
        
        Mwx.register(UnicornService.init)
            .as(UnicornProtocol.self).lifeCycle(.weakSingle)
    }
}
