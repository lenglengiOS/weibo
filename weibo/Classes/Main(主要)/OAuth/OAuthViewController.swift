//
//  OAuthViewController.swift
//  weibo
//
//  Created by 冷洪林 on 2017/6/23.
//  Copyright © 2017年 冷洪林. All rights reserved.
//

import UIKit
import SVProgressHUD

class OAuthViewController: UIViewController {
    // MARK:- 属性
    @IBOutlet weak var webView: UIWebView!
    
    // MARK:- 系统回调
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // 设置导航栏内容
        setUpNavigationBar()
        
        // 加载网页
        setUpLoadPage()
        
        SVProgressHUD.show(withStatus: "加载中...")
    }
}

// MARK:- 设置UI相关界面
extension OAuthViewController {
    // 设置导航栏
    func setUpNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(closeOAuthPage))
        navigationItem.title = "登录授权"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "填充", style: .plain, target: self, action: #selector(fillRightItem))
    }
    
    func setUpLoadPage() {
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(appKey)&redirect_uri=\(redirect_uri)"
        guard let url = URL(string: urlString) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        webView.loadRequest(urlRequest)
    }
}

// MARK:- 事件监听函数
extension OAuthViewController {
    func closeOAuthPage() {
        dismiss(animated: true, completion: nil)
        SVProgressHUD.dismiss()
    }
    func fillRightItem(){
        let jsCode = "document.getElementById('userId').value='18708363472@qq.com';document.getElementById('passwd').value='lenghonglin520'"
        webView.stringByEvaluatingJavaScript(from: jsCode)
    }
}

// MARK:- webView的代理方法
extension OAuthViewController : UIWebViewDelegate {
    // 加载网页完成
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    
    // 加载网页失败
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        SVProgressHUD.showError(withStatus: "加载失败！")
    }
    
    // 页面准备加载网页
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        // 获取code
        guard let url = request.url else {
            return true
        }
        let urlString = url.absoluteString
        
        guard urlString.contains("code=") else {
            return true
        }
        let firstCode = urlString.components(separatedBy: "code=").last!
        guard firstCode.contains("&from=") else {
            return true
        }
        let code = firstCode.components(separatedBy: "&from=").first!
        
        print("获取的code: \(code)")
        // 请求accessToken
        loadAccessToken(code: code)
        
        return true
    }
}

// MARK-:- 请求数据
extension OAuthViewController {
    func loadAccessToken(code : String) {
        NetWorkTools.shareInstance.loadAccessToken(code: code) { (result, error) -> () in
            if error != nil {
                print("------error------\(error!)")
                return
            }
            print("------result------\(result!)")
        }
    }
}








