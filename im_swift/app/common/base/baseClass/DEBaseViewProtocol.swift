//
//  DEBaseViewProtocol.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/28.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import Foundation

protocol DEBaseViewProtocol : NSObjectProtocol {
    func initWithViewModel(viewModel: DEBaseViewModelProtocol)
    
    func de_bindViewModel()
    func de_setupViews()
    func de_addReturnKeyBoard()
}

