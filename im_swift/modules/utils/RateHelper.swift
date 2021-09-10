//
//  RateHelper.swift
//  coinandcoin
//
//  Created by yinghu on 29/5/20.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

class RateHelper: NSObject {
    class  func btcFeeLimit(min: Double, max: Double, fee:Double) -> Double {
        let currentprice = UserDefaults.standard.double(forKey: MINI_CURRENT_PRICE_KEY)
        if min == max { return fee }
        if max == 0 { return fee }
        
        if fee < min / currentprice {
            return min / currentprice
        } else if fee > max {
            return max / currentprice
        } else {
            return fee
        }
    }
    
  
    
    //费率计算
    class func feeLimit(min: Double, max: Double, fee: Double) -> Double {
        if min == max { return fee }
        if max == 0 { return fee }
        if fee < min {
            return min
        }else if fee > max{
            return max
        }
        return fee
        
    }
    
    
    //计算杠杆率
   class func getLeveragePriceInfo(item : DEOrderItem) -> Double {
       let info = Double(item.start_price ?? 0) / Double(item.start_margin_value ?? 1) / Double(item.hand_count ?? 1) / (Double(item.hand_coin ?? 1) / (1e+10)) * 100.0
        return info
    }
}
