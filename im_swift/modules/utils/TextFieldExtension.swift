//
//  TextField_extension.swift
//  coinandcoin
//
//  Created by yinghu on 22/6/20.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

public extension UITextField {
    
    func attrbutePlaceHolder(placeHoder : String ,textColor: UIColor)  {
        let mut = NSMutableAttributedString.init(string: placeHoder)
        mut.addAttributes([NSAttributedString.Key.foregroundColor : textColor],
                          range: NSMakeRange(0, placeHoder.count))
        self.attributedPlaceholder = mut
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
