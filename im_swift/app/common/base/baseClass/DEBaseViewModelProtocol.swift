//
//  DEBaseViewModelProtocol.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/28.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import Foundation

protocol DEBaseViewModelProtocol : NSObjectProtocol {
    func initWithMode(model:[Any])
    
    func de_initialize()
}
