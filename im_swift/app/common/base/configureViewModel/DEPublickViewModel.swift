//
//  DEPublickViewModel.swift
//  coinandcoin
//
//  Created by yinghu on 2020/5/25.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit
import RxSwift

/**
 *用于处理APP公共事务
 */

@objc protocol publickViewModelDelegate : NSObjectProtocol {
    
}

protocol publickViewModelInterface {
    /*获取全局公共配置 */
    func configureFeatureRequest()
}

class DEPublickViewModel: DEBaseViewModel, publickViewModelInterface {
    var configureSubjct = PublishSubject<Any>()
    func configureFeatureRequest() {
        NetWorkRequest(.configureFeatures, completion: { (response) -> (Void) in
            
            guard let model = configureModel.deserialize(from: response) else { return }
            self.configureSubjct.onNext(model)
            
        }, failed: { (error) -> (Void) in
            
        }) { () -> (Void) in }
    }
}
