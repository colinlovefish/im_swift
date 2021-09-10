//
//  DEIndicatorSingleton.swift
//  coinandcoin
//
//  Created by yinghu on 2020/5/11.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class DEIndicatorSingleton: NSObject {
    static let shareInstance = DEIndicatorSingleton()
    lazy var indicatorView = NVActivityIndicatorView(frame: CGRect.init(x: (SCREEN_WIDTH - 40) / 2 , y: (SCREEN_HEIGHT - 40) / 2, width: 40, height: 40),
                                                     type: .lineScaleParty , color: contentTextWhiteColor())
    func show(type: NVActivityIndicatorType) {
        self.indicatorView.type = type
        self.indicatorView.color = contentTextWhiteColor()
        UIApplication.shared.keyWindow?.addSubview(self.indicatorView)
        self.indicatorView.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 20) {
            self.indicatorView.stopAnimating()
        }
    }
    
    func showPartyLine() {
        self.show(type: .lineScaleParty)
    }
    
    func showBollRotateChase() {
        self.show(type: .ballRotateChase)
    }
    
     func dismiss() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.indicatorView.stopAnimating()
        }
    }

}
