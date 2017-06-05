//
//  UIBarButtonItem.swift
//  weibo
//
//  Created by 冷洪林 on 2017/6/5.
//  Copyright © 2017年 冷洪林. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(imageName: String) {
        self.init()
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        btn.sizeToFit()
        customView = btn
    }
}
