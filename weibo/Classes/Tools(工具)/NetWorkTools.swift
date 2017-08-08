//
//  NetWorkTools.swift
//  05-AFNetworking的封装
//
//  Created by 冷洪林 on 2017/6/23.
//  Copyright © 2017年 冷洪林. All rights reserved.
//

import AFNetworking

// 定义枚举类型
enum methodType {
    case GET
    case POST
}

class NetWorkTools: AFHTTPSessionManager {
    static let shareInstance : NetWorkTools = {
        let tools = NetWorkTools();
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        return tools
    }()
}

// MARK:- 请求的封装
extension NetWorkTools {
    func request(method : methodType, urlString : String, parameters : [String : Any], finished : @escaping (_ result : Any?, _ error : Error?) -> ()) {
        
        // 成功的回调
        let successCallback = {
            (task : URLSessionDataTask, result : Any) in
            finished(result, nil)
        }
        
        // 失败的回调
        let failureCallback = {
            (task : URLSessionDataTask?, error : Error) in
            finished(nil, error)
        }
        
        // 执行网络请求
        if method == .GET {
           get(urlString, parameters: parameters, progress: nil, success: successCallback, failure: failureCallback)
        }else{
            post(urlString, parameters: parameters, progress: nil, success: successCallback, failure: failureCallback)
        }
    }
}

// MARK:- 获取accessToken
extension NetWorkTools {
    
    func loadAccessToken(code: String, finish : @escaping (_ result: [String : AnyObject]? , _ error: NSError?) -> ()) {
        let urlString = "https://api.weibo.com/oauth2/access_token"
        let parameters = ["client_id" : appKey, "client_secret" : appSecret, "grant_type" : "authorization_code", "code" : code, "redirect_uri" : redirect_uri]
        request(method: .POST, urlString: urlString, parameters: parameters) { (result, error) in
            finish(result as! [String : AnyObject]?, error as! NSError?)
        }
    }
}











