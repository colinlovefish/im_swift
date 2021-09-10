//
//  DETextView.swift
//  coinandcoin
//
//  Created by yinghu on 2020/7/4.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

class DETextView: UIView {
    let TF_HEIGHT : CGFloat = 60.0
    
    var tf : HoshiTextField!
    var errorLabel : UILabel!
   override init(frame: CGRect) {
       super.init(frame: frame)
        drawUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawUI() {
        self.backgroundColor = darkBlueColor()
        let tf = HoshiTextField(frame: CGRect.init(x: CGFloat(30.0), y: 0, width: SCREEN_WIDTH - 60, height: TF_HEIGHT))
        let etext = ""
        tf.placeholderColor = textWhiteColor()
        tf.textColor = contentTextWhiteColor()
        tf.returnKeyType = .done
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        tf.font = UIFont.boldSystemFont(ofSize: 22)
        tf.placeholder = etext
        tf.borderActiveColor = TEXT_BLUE!
        tf.borderInactiveColor = textWhiteColor()
        
        
        
        self.addSubview(tf)
    }
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
