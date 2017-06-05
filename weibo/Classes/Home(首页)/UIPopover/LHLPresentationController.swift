//
//  LHLPresentationController.swift
//  weibo
//
//  Created by 冷洪林 on 2017/6/5.
//  Copyright © 2017年 冷洪林. All rights reserved.
//

import UIKit

class LHLPresentationController: UIPresentationController {
    
    // MARK:-懒加载属性
    lazy var coverView: UIView = UIView()
    
    // MARK:-系统回调函数
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        // 1.设置弹出View的属性
        presentedView?.frame = CGRect(x: 100, y: 55, width: 180, height: 250)
        // 2.添加蒙版
        setUpCoverView()
    }
}

// MARK:-设置UI相关界面
extension LHLPresentationController {
    func setUpCoverView() {
        // 1.添加蒙版
        containerView?.insertSubview(coverView, at: 0)
        
        // 2.设置蒙版属性
        coverView.frame = containerView!.bounds
        coverView.backgroundColor = UIColor(white: 0.8, alpha: 0.2)
        
        // 3.添加手势
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapCoverViewDidClick))
        coverView.addGestureRecognizer(tapGesture)
        
    }
}

// MARK:-事件监听
extension LHLPresentationController {
    func tapCoverViewDidClick() {
        presentedViewController.dismiss(animated: true, completion: nil)

    }
}


































