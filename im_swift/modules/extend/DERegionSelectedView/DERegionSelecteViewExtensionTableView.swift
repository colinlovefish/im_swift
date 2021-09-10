//
//  DERegionSelecteViewExtensionTableView.swift
//  coinandcoin
//
//  Created by yinghu on 2020/7/13.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

extension DERegionSelectView : UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSouce.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch type {
        case .s_tomezone, .s_language, .s_spotTrading, .s_klineIndicator_channel,.s_vision_mode, .s_klineIndicator_chart:
            let regionItem = self.dataSouce[indexPath.row]
            let dict = regionItem as! Dictionary<String, Any>
            let cell = tableView.dequeueReusableCell(withIdentifier: zoneIdentifier, for: indexPath) as! DETimezoneSelectCell
            cell.descLabel.text = dict["label"] as? String
            let isDefault = (dict["isDefault"] as? Bool ?? false)
            cell.descLabel.textColor = isDefault ? TEXT_BLUE : textWhiteColor()
           
            return cell
            
        case .s_rate:
            let cell = tableView.dequeueReusableCell(withIdentifier: zoneIdentifier, for: indexPath) as! DETimezoneSelectCell
            if indexPath.row < self.dataSouce.count {
                let rateItem = self.dataSouce[indexPath.row] as! DECurrencyRateItem
                cell.descLabel.text = rateItem.currency_name
                cell.descLabel.textColor = rateItem.isDefault ? TEXT_BLUE : textWhiteColor()
                
            }
            return cell
            
        case .s_coin:
            let cell = tableView.dequeueReusableCell(withIdentifier: zoneIdentifier, for: indexPath) as! DETimezoneSelectCell
            if indexPath.row < self.dataSouce.count {
                let item = self.dataSouce[indexPath.row] as! DECoinItem
                cell.descLabel.text = item.name
                cell.descLabel.textColor = item.isDefault ? TEXT_BLUE : textWhiteColor()
               
            }
            return cell
            
        case .s_timeInterval_mini,.s_timeInterval_otc://K线时间切换
            let cell = tableView.dequeueReusableCell(withIdentifier: zoneIdentifier, for: indexPath) as! DETimezoneSelectCell
            if indexPath.row < self.dataSouce.count {
                let regionItem = self.dataSouce[indexPath.row]
                let dict = regionItem as? Dictionary<String, Any> ?? [:]
                let text = dict["bucket"] as? String ?? ""
                cell.descLabel.text = text
                let isDefault = (dict["isDefault"] as? Bool ?? false)
                cell.descLabel.textColor = isDefault ? TEXT_BLUE : textWhiteColor()
                
            }
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: listIdentifier, for: indexPath) as! DERegionListCell
            let regionItem = self.dataSouce[indexPath.row]
            let dict = regionItem as? Dictionary<String, Any> ?? [:]
            let text = dict["n"] ?? ""
            let svgName = dict["id"] as? String ?? ""
            cell.regionLabel.text = text as? String
            cell.flagImageView.image = UIImage.init(named: svgName)
            
            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(CELL_HEIGHT)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.type == .s_rate {
            let item = self.dataSouce[indexPath.row]
            delegate?.currencySelected(item: item as! DECurrencyRateItem ,index: indexPath.row)
        } else if self.type == .s_coin {
            let item = self.dataSouce[indexPath.row]
            delegate?.currencyCoinSelected(item: item as! DECoinItem, index: indexPath.row)
        } else {
            let dict = self.dataSouce[indexPath.row] as! Dictionary<String, Any>
            let tempList = NSArray.init(array: self.dataSouce)
            self.dataSouce.removeAllObjects()
            for temp in tempList {
                var tempDict = temp as? Dictionary<String, Any> ?? [:]
                tempDict["isDefault"] = false
                if dict["bucket"] != nil {
                    if (dict["bucket"] as? String ?? "") == (tempDict["bucket"] as? String ?? "" ) {
                        tempDict["isDefault"] = true
                    }
                } else if dict["value"] != nil {
                    if (dict["value"] as? String ?? "") == (tempDict["value"] as? String ?? "") {
                        tempDict["isDefault"] = true
                    }
                }

                self.dataSouce.add(tempDict)
            }
            self.tableView.reloadData()
            
            delegate?.regionSelect(param: dict as NSDictionary, index: indexPath.row)
        }
        self.hide()
    }
}
