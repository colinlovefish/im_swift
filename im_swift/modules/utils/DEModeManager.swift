//
//  DEModeManager.swift
//  coinandcoin
//
//  Created by yinghu on 2020/8/10.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

enum modeStatus {
    case modeStatusDark
    case modeStatusLight
    case modeStatusUnspecified
}

class DEModeManager: NSObject {
    
    static let shareInstance = DEModeManager()
    func getAppMode() -> modeStatus {
        if #available(iOS 13.0, *) {
            let currentMode = UITraitCollection.current.userInterfaceStyle
            if currentMode == .dark {
                return .modeStatusDark
            } else if currentMode == .light {
                return .modeStatusLight
            } else {
                return .modeStatusUnspecified
            }
            
        } else {
            // Fallback on earlier versions
            return .modeStatusUnspecified
        }
    }

}
