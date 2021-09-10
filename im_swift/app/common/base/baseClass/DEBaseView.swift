//
//  DEBaseView.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/7.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import ReusableKit
import SnapKit


class DEBaseView: UIView,DEBaseViewProtocol {
    func de_addReturnKeyBoard() {
        
    }
    
    
  
    var name : String!
    override init(frame: CGRect) {
       super.init(frame: frame)
        self.de_setupViews()
        self.de_bindViewModel()
    }
 
    
    func initWithViewModel(viewModel: DEBaseViewModelProtocol) {
        self.de_setupViews()
        self.de_bindViewModel()
    }
    
//    init(viewModel:DEBaseViewModel) {
//        super.init()
//        self.viewModel = viewModel
//    }
//

    
//    convenience init() {
//        self.init(viewModel:DEBaseViewModel())
//    }
    

    
    
    func de_setupViews() {
        
    }
    
    func de_bindViewModel() {
        
    }
    
    func initWithViewModel() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
