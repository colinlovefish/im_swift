//
//  DEAlertTitleLabel.swift
//  coinandcoin
//
//  Created by yinghu on 2020/8/24.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

class DEAlertTitleLabel: UILabel {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupUI()  {
        self.textColor = contentTextWhiteColor()
        self.textAlignment = .center
        self.lineBreakMode = .byWordWrapping
        self.font = UIFont.boldSystemFont(ofSize: 18)
        self.numberOfLines = 0
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
