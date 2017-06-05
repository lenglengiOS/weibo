//
//  VisitorView.swift
//  weibo
//
//  Created by 冷洪林 on 2017/6/5.
//  Copyright © 2017年 冷洪林. All rights reserved.
//

import UIKit

class VisitorView: UIView {
    // MARK:-提供快速通过xib创建的类方法
    class func VisitorView() -> VisitorView{
        return Bundle.main.loadNibNamed("VisitorView", owner: nil, options: nil)?.last as! VisitorView
    }
    
    // MARK:-控件的属性
    @IBOutlet weak var rotationView: UIImageView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    // MARK:-自定义函数
    func setUpVisitorViewInfo(iconName: String, title: String) {
        rotationView.isHidden = true
        iconView.image = UIImage(named: iconName)
        tipLabel.text = title
    }
    
    func addRotationAnmi() {
        // 1.创建动画
        let rotationAnmi = CABasicAnimation(keyPath: "transform.rotation.z")
        
        // 2.设置动画属性
        rotationAnmi.fromValue = 0
        rotationAnmi.toValue = M_PI * 2
        rotationAnmi.repeatCount = MAXFLOAT
        rotationAnmi.duration = 8
        rotationAnmi.isRemovedOnCompletion = false
    
        // 3.将动画添加到layer中
        rotationView.layer.add(rotationAnmi, forKey: nil)
    }
}
