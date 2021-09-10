//
//  Hex.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/6.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit
extension UIColor {
    public convenience init?(hex: String ) {
        self.init(hex: hex, alpha: 1.0)
    }

    /// 通过RGB整数值构造
    ///
    /// - Parameters:
    ///   - r: 颜色R值
    ///   - g: 颜色G值
    ///   - b: 颜色B值
    ///   - alpha: 颜色alpha值
    public convenience init?(r : CGFloat, g : CGFloat, b : CGFloat, alpha : CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    public convenience init?(hex: String , alpha:CGFloat) {
        let r, g, b: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    self.init(red: r, green: g, blue: b, alpha: alpha)
                    return
                }
            }
        }

        return nil
    }
}
