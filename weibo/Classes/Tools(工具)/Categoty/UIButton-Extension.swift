//
//  Extension-UIButton.swift
//  weibo
//
//  Created by 冷洪林 on 2017/6/3.
//  Copyright © 2017年 冷洪林. All rights reserved.
//

import UIKit

extension UIButton {
    // MARK:-类方法创建Button
    class func createButton(imageName: String, bgImageName: String) -> UIButton {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        btn.setBackgroundImage(UIImage(named: bgImageName), for: .normal)
        btn.setBackgroundImage(UIImage(named: bgImageName + "_highlighted"), for: .highlighted)
        btn.sizeToFit()
        
        return btn
    }
    
    // MARK:-便利构造函数方法创建Button
    convenience init(imageName: String, bgImageName: String) {
        self.init()
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        setBackgroundImage(UIImage(named: bgImageName), for: .normal)
        setBackgroundImage(UIImage(named: bgImageName + "_highlighted"), for: .highlighted)
        sizeToFit()
    }
    
}
