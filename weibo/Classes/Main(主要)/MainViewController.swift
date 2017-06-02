//
//  MainViewController.swift
//  weibo
//
//  Created by 冷洪林 on 2017/6/2.
//  Copyright © 2017年 冷洪林. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.创建子控制器
        addChildViewController(childVc: HomeViewController(), imageName: "tabbar_home", title: "首页")
        addChildViewController(childVc: MessageViewController(), imageName: "tabbar_message_center", title: "消息")
        addChildViewController(childVc: DiscoverViewController(), imageName: "tabbar_discover", title: "发现")
        addChildViewController(childVc: ProfileViewController(), imageName: "tabbar_profile", title: "我的")

    }
    
    private func addChildViewController(childVc: UIViewController, imageName:String, title:String) {
        
        childVc.title = title
        childVc.tabBarItem.image = UIImage(named: imageName)
        childVc.tabBarItem.selectedImage = UIImage(named: imageName+"_highlighted")
        let childNav = UINavigationController(rootViewController: childVc)
        addChildViewController(childNav)
    }

}
