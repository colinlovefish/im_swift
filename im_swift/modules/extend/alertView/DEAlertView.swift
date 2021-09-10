//
//  DEAlertView.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/13.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

protocol DEAlertViewDelegate : NSObjectProtocol {
    func alertViewButtonClick()
}


class DEAlertView: DEBaseView {
    
    let OFFSET_HEIGHT : CGFloat = 70
    
    let max_height = (kScreenHeight - CGFloat(NAVIGATION_HEGIH) - CGFloat(TABBAR_HEIGHT) - 300)
    var text : NSString?
    var textLabel : UILabel!
    var descLabel : UILabel!
    var alertView : UIView!
    var titleLabel : UILabel!
    var line : UIView?
    lazy var alertColor : UIColor = lightBlueColor()
    lazy var confirmBtn = DEAlertConfirmButton.init(type: .custom)
    lazy var closeBtn = DEAlertCloseButton.init(type: .custom)
    lazy var shawdowView = UIView()
    weak var delegate : DEAlertViewDelegate?
    
    override func de_setupViews() {
        self.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        setupUI()
        
    }
    
    @objc func confirmAction() {
        self.hide()
        delegate?.alertViewButtonClick()
    }
    
    @objc func showMessage( message:String?) {
        descLabel.isHidden = true
        titleLabel.isHidden = true
        confirmBtn.isHidden = true
        closeBtn.isHidden = true
        line?.isHidden = true
        var alert_h : CGFloat = 20
        textLabel.text = message
        textLabel.textAlignment = .center
        alert_h += countTextCount(text: message ?? "")  + 10
        
        
        if alert_h < 80 {
            alert_h = 80
        } else if alert_h >  max_height{
            alert_h = max_height
        }
        
        
        alertView.snp.remakeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(36)
            make.right.equalTo(self).offset(-36)
            make.height.equalTo(alert_h)
        }
        
        textLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(alertView).offset(30)
            make.right.equalTo(alertView).offset(-30)
            make.centerY.equalTo(alertView)
        }
        
        UIView.animate(withDuration: ANIMATION_POP_INTERVAL, delay: ANIMATION_POP_DELAY, options: .curveEaseIn, animations: {
            UIApplication.shared.keyWindow?.addSubview(self)
        },  completion: { (true) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.hide()
            }
        })
        
      
    }
    
    @objc func show( title: String?, desc:String?,text:String?, buttonTitle: String?) {
        var alert_h : CGFloat = 20
        if (title?.count ?? 0) > 0 {
            titleLabel.text = title
            textLabel.text = text
            descLabel.text = desc
            
            alert_h += countTextCount(text: title ?? "")
            alert_h += countTextCount(text: desc ?? "")
            alert_h += countTextCount(text: text ?? "")
           
            alert_h += OFFSET_HEIGHT
        }else if (desc?.count ?? 0) > 0 {
            descLabel.text = desc
            descLabel.numberOfLines = 0
            descLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(alertView).offset(30)
                make.right.equalTo(alertView).offset(-30)
                make.centerY.equalTo(alertView).offset(-25)
            }
            
            alert_h += countTextCount(text: desc ?? "") + OFFSET_HEIGHT
        }else {
            textLabel.numberOfLines = 0
            textLabel.text = text
            textLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(alertView).offset(30)
                make.right.equalTo(alertView).offset(-30)
                make.top.equalTo(titleLabel.snp_bottomMargin).offset(5)
            }
            alert_h += countTextCount(text: text ?? "") + OFFSET_HEIGHT
            
        }
        
        if alert_h < 150 {
            alert_h = 150
        } else if alert_h >  max_height{
            alert_h = max_height
        }
        closeBtn.isHidden = true
        if buttonTitle != nil {
            confirmBtn.setTitle(buttonTitle, for: .normal)
        }
        
        alertView.snp.remakeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(36)
            make.right.equalTo(self).offset(-36)
            make.height.equalTo(alert_h)
        }
        
        confirmBtn.snp.remakeConstraints { (make) in
            make.left.bottom.right.equalTo(alertView)
            make.height.equalTo(50)
        }
        
        UIView.animate(withDuration: 0.3) {
            UIApplication.shared.keyWindow?.addSubview(self)
        }
    }
    
    
    @objc func showInfo( title: String?, desc:String?,text:String?,closeTitle: String?, buttonTitle: String?) {
        var alert_h : CGFloat = 20
        if (title?.count ?? 0) > 0 {
            titleLabel.text = title
            textLabel.text = text
            descLabel.text = desc
            
            alert_h += countTextCount(text: title ?? "")
            alert_h += countTextCount(text: text ?? "")
            alert_h += countTextCount(text: desc ?? "")
            alert_h += OFFSET_HEIGHT
            
        }else if (desc?.count ?? 0) > 0 {
            descLabel.text = desc
            descLabel.numberOfLines = 0
            alert_h += countTextCount(text: desc ?? "") + OFFSET_HEIGHT
            descLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(alertView).offset(30)
                make.right.equalTo(alertView).offset(-30)
                make.centerY.equalTo(alertView).offset(-25)
            }
            
        }else {
            textLabel.numberOfLines = 0
            textLabel.text = text
            alert_h += countTextCount(text: text ?? "") + OFFSET_HEIGHT
            textLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(alertView).offset(30)
                make.right.equalTo(alertView).offset(-30)
                make.top.equalTo(titleLabel.snp_bottomMargin).offset(5)
            }
        }
        
        if alert_h < 150 {
            alert_h = 150
        } else if alert_h >  max_height{
            alert_h = max_height
        }
        
        if buttonTitle != nil {
            confirmBtn.isHidden = false
            confirmBtn.setTitle(buttonTitle, for: .normal)
            confirmBtn.snp.remakeConstraints { (make) in
                make.left.bottom.right.equalTo(alertView)
                make.height.equalTo(50)
            }
        } else {
            confirmBtn.isHidden = true
        }
        
        if closeTitle != nil {
            closeBtn.isHidden = false
            closeBtn.setTitle(closeTitle, for: .normal)
            closeBtn.snp.remakeConstraints { (make) in
                make.left.bottom.right.equalTo(alertView)
                make.height.equalTo(50)
            }
        } else {
            closeBtn.isHidden = true
            
        }
        
        alertView.snp.remakeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(36)
            make.right.equalTo(self).offset(-36)
            make.height.equalTo(alert_h)
        }
        
        
        UIView.animate(withDuration: 0.3) {
            UIApplication.shared.keyWindow?.addSubview(self)
        }
    }
    
    @objc func hide() {
        UIView.animate(withDuration: 0.3) {
            self.removeFromSuperview()
        }
    }
    
    func changeAlertColor(color:UIColor) {
        self.alertColor = color
        self.alertView.backgroundColor = color
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}



extension DEAlertView {
    
    func countTextCount(text: String) -> CGFloat {
        if text.count == 0{
            return 0
        }
        return (text.textSize(font: UIFont.systemFont(ofSize: 16), maxSize: CGSize.init(width: SCREEN_WIDTH - 140, height: 800)).height) + 10
    }
    
    
    func setupUI() {
        let bgView = UIView.init(frame: self.bounds)
        bgView.backgroundColor = UIColor.init(hex: "#000000", alpha: 0.3)
        self.addSubview(bgView)
        
        alertView = DEAlertContenView()
        alertView.backgroundColor = alertColor
        self.addSubview(alertView)
        alertView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(36)
            make.right.equalTo(self).offset(-36)
            make.height.equalTo(alertView.snp.width).multipliedBy(0.6)
        }
        
        closeBtn.backgroundColor = self.alertColor
        closeBtn.addTarget(self, action: #selector(hide), for: .touchUpInside)
        alertView.addSubview(closeBtn)
        closeBtn.snp.makeConstraints { (make) in
            make.bottom.left.equalTo(alertView)
            make.width.equalTo(alertView).multipliedBy(0.5)
            make.height.equalTo(50)
        }
        
        let v_line = UIView()
        v_line.backgroundColor = lineWhiteColor()
        closeBtn.addSubview(v_line)
        v_line.snp.makeConstraints { (make) in
            make.top.bottom.right.equalTo(closeBtn)
            make.width.equalTo(0.5)
        }
        
        
        confirmBtn.backgroundColor = self.alertColor
        confirmBtn.addTarget(self, action: #selector(confirmAction), for: .touchUpInside)
        alertView.addSubview(confirmBtn)
        confirmBtn.snp.makeConstraints { (make) in
            make.left.equalTo(closeBtn.snp.right)
            make.bottom.right.equalTo(alertView)
            make.height.equalTo(50)
        }
        
        line = UIView()
        line!.backgroundColor = lineWhiteColor()
        alertView.addSubview(line!)
        line!.snp.makeConstraints { (make) in
            make.left.right.equalTo(alertView)
            make.bottom.equalTo(confirmBtn.snp.top)
            make.height.equalTo(0.5)
        }
        
        titleLabel = DEAlertTitleLabel()
        
        alertView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(alertView).offset(30)
            make.right.equalTo(alertView).offset(-30)
            make.top.equalTo(alertView).offset(25)
        }
        
        textLabel = DEAlertTextLabel()
        alertView.addSubview(textLabel)
        textLabel.snp.makeConstraints { (make) in
            make.left.equalTo(alertView).offset(30)
            make.right.equalTo(alertView).offset(-30)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        
        descLabel = DEAlertDescLabel()
        
        alertView.addSubview(descLabel)
        descLabel.snp.makeConstraints { (make) in
            make.left.equalTo(textLabel)
            make.right.equalTo(textLabel)
            make.top.equalTo(textLabel.snp.bottom).offset(2)
        }
        
    }
}
