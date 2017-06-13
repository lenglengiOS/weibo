//
//  HomeViewController.swift
//  weibo
//
//  Created by 冷洪林 on 2017/6/2.
//  Copyright © 2017年 冷洪林. All rights reserved.
//

import UIKit
import PopoverSwift

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
        view.backgroundColor = UIColor.purple
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
        

        // In view controller
        let image = UIImage(named: "collection_hightlight")
        let item0 = PopoverItem(title: "发起群聊", image: image) { debugPrint($0.title) }
        let item1 = PopoverItem(title: "添加胖友", image: image) { debugPrint($0.title) }
        let item2 = PopoverItem(title: "扫一扫", image: image) { debugPrint($0.title) }
        let item3 = PopoverItem(title: "收付款", image: image) { debugPrint($0.title) }
        let items = [item0, item1, item2, item3]
        
        let controller = PopoverController(items: items, fromView: view, direction: .down, reverseHorizontalCoordinates: true, style: .normal)
        popover(controller)
      
    }
}


































