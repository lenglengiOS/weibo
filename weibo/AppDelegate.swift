//
//  AppDelegate.swift
//  weibo
//
//  Created by 冷洪林 on 2017/6/2.
//  Copyright © 2017年 冷洪林. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // 创建window
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        
        // 设置全局颜色
        UITabBar.appearance().tintColor = UIColor.orange
        
        return true
    }
}

