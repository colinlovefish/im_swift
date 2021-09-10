//
//  DEAlertConfirmButton.swift
//  coinandcoin
//
//  Created by yinghu on 2020/8/24.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

class DEAlertConfirmButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI()  {
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        self.setTitleColor(TEXT_BLUE, for: .normal)
        self.setTitle(LanguageHelper.localizedString(key: EXTENSIONS_MESSAGE_BOX_OK), for: .normal)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
