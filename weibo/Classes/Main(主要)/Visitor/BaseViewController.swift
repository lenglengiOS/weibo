//
//  BaseViewController.swift
//  weibo
//
//  Created by 冷洪林 on 2017/6/5.
//  Copyright © 2017年 冷洪林. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {
    
    lazy var visitorView : VisitorView = VisitorView.VisitorView()
    let isLogin: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationItems()
    }
    
    override func loadView() {
        isLogin ? super.loadView() : setUpVisitorView()
    }

}

// MARK:- 设置UI界面
extension BaseViewController {
    /// 设置访客视图
    func setUpVisitorView() {
        visitorView.backgroundColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.00)
        view = visitorView
        
        // 监听访客视图中"登录","注册"按钮的点击
        visitorView.registerBtn.addTarget(self, action: #selector(registerBtnClick), for: .touchUpInside)
        visitorView.loginBtn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
    }
    
    /// 设置导航栏左右的Item
    func setUpNavigationItems(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(registerBtnClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(loginBtnClick))
    }
}

// MARK:- 事件监听
extension BaseViewController {
    /// 注册
    func registerBtnClick(){
        print(666)
    }
    
    /// 登录
    func loginBtnClick(){
        print(888)
    }
}

















