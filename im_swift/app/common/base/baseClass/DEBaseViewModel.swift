//
//  DEBaseViewModel.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/10.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit


class DEBaseViewModel: NSObject,DEBaseViewModelProtocol {
    func initWithMode(model: [Any]) {
        self.de_initialize()
    }
    
    func de_initialize() {
        
    }
    
    
    
    override init() {
        super.init()
        self.de_init()
    }
    
    func de_init() {
        
    }
}
