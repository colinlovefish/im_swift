//
//  DEHelper.swift
//  coinandcoin
//
//  Created by yinghu on 2020/10/14.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

class DEHelper: NSObject {
    
    static var shared: DEHelper = {
        let instance = DEHelper()
        
        return instance
    }()
    
    func isLogin() -> Bool {
        let isLogin = UserDefaults.standard.bool(forKey: ISLOGINKEY)
        return isLogin
    }

}
