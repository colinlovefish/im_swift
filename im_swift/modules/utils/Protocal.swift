//
//  protocal.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/18.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import Foundation
import UIKit

enum LoginRsult {
    case ok(message: String)
    case empty
    case failed(message: String)
}

extension LoginRsult {
    var isValid: Bool {
        switch self {
        case .ok:
            return true
        default:
            return false
        }
    }
}

extension LoginRsult {
    var textColor: UIColor {
        switch self {
        case .ok:
            return UIColor.white
        case .empty:
            return UIColor.black
        default:
            return UIColor.red
        }
    }
}
extension LoginRsult {
    var description : String {
        switch  self {
        case let .ok(message):
            return message
        case .empty:
            return""
        case let .failed(message):
            return message
        }
        
    }
}

