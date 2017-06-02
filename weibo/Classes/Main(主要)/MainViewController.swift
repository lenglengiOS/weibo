//
//  MainViewController.swift
//  weibo
//
//  Created by 冷洪林 on 2017/6/2.
//  Copyright © 2017年 冷洪林. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    // 懒加载
    lazy var centerBtn: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpComposeBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpTabBarItems()
    }
}

extension MainViewController {
    func setUpComposeBtn() {
        tabBar.addSubview(centerBtn)
        centerBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: .normal)
        centerBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: .highlighted)
        centerBtn.setImage(UIImage(named: "tabbar_compose_icon_add"), for: .normal)
        centerBtn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        centerBtn.sizeToFit()
        centerBtn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height * 0.5)
    }
    func setUpTabBarItems() {
        // 禁止中间的tabBarItem的交互
        for i in 0..<tabBar.items!.count {
            if i == 2 {
                tabBar.items![i].isEnabled = false
            }
        }
    }
    
}
