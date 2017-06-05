//
//  MessageViewController.swift
//  weibo
//
//  Created by 冷洪林 on 2017/6/2.
//  Copyright © 2017年 冷洪林. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView.setUpVisitorViewInfo(iconName: "visitordiscover_image_message", title: "登录后,别人评论你的微博,给你发消息,都会在这里收到通知")
    }

    
}
