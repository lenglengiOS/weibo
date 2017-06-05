//
//  HomeViewController.swift
//  weibo
//
//  Created by 冷洪林 on 2017/6/2.
//  Copyright © 2017年 冷洪林. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    //MARK:-懒加载属性
    lazy var titleView : TitleButton = TitleButton()
    
    
    //MARK:-系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.没有登录时设置的内容
        visitorView.addRotationAnmi()
        if !isLogin {
            return
        }
        
        // 2.设置登录时的内容
        setUpNavigationBar()
        
    }
}

//MARK:-设置UI界面
extension HomeViewController {
    func setUpNavigationBar() {
        // 1.设置左侧的item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
        // 2.设置右侧的item
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
        // 3.设置titleView
        titleView.setTitle("洪冷冷", for: .normal)
        titleView.addTarget(self, action: #selector(titleViewBtnClick(sender:)), for: .touchUpInside)
        navigationItem.titleView = titleView
        
        
    }
}

//MARK:-时间监听的函数
extension HomeViewController {
    func titleViewBtnClick(sender: UIButton) {
        // 1.改变按钮的状态
        sender.isSelected = !sender.isSelected
        // 2.创建弹出的控制器
        let popoverVC = PopoverViewController()
        popoverVC.modalPresentationStyle = .custom
        // 3.设置转场代理
        popoverVC.transitioningDelegate = self
        // 3.modal出popover控制器
        present(popoverVC, animated: true, completion: nil)
    }
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return LHLPresentationController(presentedViewController: presented, presenting: presenting)
    }
}


































