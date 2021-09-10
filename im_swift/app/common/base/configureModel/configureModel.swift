//
//  configureModel.swift
//  coinandcoin
//
//  Created by yinghu on 2020/5/25.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit
import HandyJSON

class configureModel: HandyJSON {
    
    var mini_contract : Bool = false
    var otc_contract : Bool = false
    var deposit : Bool = false
    var withdraw : Bool = false
    var language_ts : Double = -1
    var language_url : String?
    
    required init() {}
}
