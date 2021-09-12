//
//  CTChatsController.swift
//  im_swift
//
//  Created by yinghu on 2021/9/10.
//

import UIKit

class CTChatsController: DEBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label=UILabel();
        label.text="chat"
        self.view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(self.view)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
