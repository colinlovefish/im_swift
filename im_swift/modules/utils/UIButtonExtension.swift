//
//  UIButtonExtension.swift
//  coinandcoin
//
//  Created by yinghu on 2020/4/18.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit


public extension UIButton {

/** 部分圆角
 * - corners: 需要实现为圆角的角，可传入多个
 * - radii: 圆角半径
 */
    func corner(byRoundingCorners corners: UIRectCorner, radii: CGFloat ,frame: CGRect) {
        let maskPath = UIBezierPath(roundedRect: frame , byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    
    
    
  
    

}

