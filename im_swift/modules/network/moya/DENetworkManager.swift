//
//  DENetworkManager.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/17.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import Foundation
import Moya
import Alamofire
//import SwiftyJSON
import JGProgressHUD

// timeout
private var requestTimeOut:Double = 30

// scuccess
typealias successCallback = ((String) -> (Void))

//failer
typealias failedCallback = ((String) -> (Void))

//network wrong
typealias errorCallback = (() -> (Void))

private let myEndpointClosure = {(target: API) -> Endpoint in
    var url = target.baseURL.absoluteString + target.path
//    let isDemo = UserDefaults.standard.bool(forKey: DEMO_STATUS_KEY)
//    let isDebug = UserDefaults.standard.bool(forKey: DEBUGMODEL_KEY)
    
//    if isDebug == true {
//        url = target.debugURL.absoluteString + target.path
//        if isDemo == true {
//            url = target.debugDemoURL.absoluteString + target.path
//        }
//    }else {
//        if isDemo == true {
//            url = target.demoURL.absoluteString + target.path
//        }
//    }
    
    var task = target.task
    var endpoint = Endpoint(
        url: url,
        sampleResponseClosure: { .networkResponse(200, target.sampleData) },
        method: target.method,
        task: task,
        httpHeaderFields: target.headers
    )
    
    requestTimeOut = 30
    
    switch target {
    case .captcha:
        return endpoint
    default:
        requestTimeOut = 10
        return endpoint
    }
}


//network setting
private let requestClosure = {(endpoint:Endpoint,done:MoyaProvider.RequestResultClosure) in
    do {
        var request = try endpoint.urlRequest()
        request.timeoutInterval = requestTimeOut
        if let requestData = request.httpBody {
            print("\(request.url!)"+"\n"+"\(request.httpMethod ?? "")"+"paramter:"+"\(String(data:request.httpBody!,encoding: String.Encoding.utf8) ?? "")")
        }else {
            print("\(request.url!)"+"\(String(describing: request.httpMethod))")
        }
        done(.success(request))
    } catch {
        done(.failure(MoyaError.underlying(error, nil)))
    }
}

//network plugin

private let networkPlugin = NetworkActivityPlugin.init { (changeType, targetType) in
    print("networkPlugin \(changeType)")
    
    switch(changeType) {
    case .began:
        print("network request starting")
    case .ended:
        print("network request ending")
    }
}


let Provider = MoyaProvider<API>(endpointClosure: myEndpointClosure, requestClosure: requestClosure, plugins: [networkPlugin], trackInflights: false)

// 最常用的网络请求，只需知道正确的结果无需其他操作时候用这个 (可以给调用的NetWorkReques方法的写参数默认值达到一样的效果,这里为解释方便做抽出来二次封装)
///
/// - Parameters:
///   - target: 网络请求
///   - completion: 请求成功的回调
func NetWorkRequest(_ target: API, completion: @escaping successCallback){
    NetWorkRequest(target, completion: completion)
}



/// 需要知道成功或者失败的网络请求， 要知道code码为其他情况时候用这个 (可以给调用的NetWorkRequest方法的参数默认值达到一样的效果,这里为解释方便做抽出来二次封装)
///
/// - Parameters:
///   - target: 网络请求
///   - completion: 成功的回调
///   - failed: 请求失败的回调
func NetWorkRequest(_ target: API, completion: @escaping successCallback , failed:failedCallback?) {
    NetWorkRequest(target, completion: completion, failed: failed, errorResult: nil)
}


///  需要知道成功、失败、错误情况回调的网络请求   像结束下拉刷新各种情况都要判断
///
/// - Parameters:
///   - target: 网络请求
///   - completion: 成功
///   - failed: 失败
///   - error: 错误
@discardableResult //当我们需要主动取消网络请求的时候可以用返回值Cancellable, 一般不用的话做忽略处理
func NetWorkRequest(_ target: API, completion: @escaping successCallback , failed:failedCallback?, errorResult:errorCallback?) -> Cancellable? {
    if !isNetworkConnect{
        return nil
    }
    return Provider.request(target) { (result) in
        //隐藏hud
        switch result {
        case let .success(response):
            do {
                
                let jsonData = try JSON(data: response.data)
                let jsonString = String(data: response.data, encoding: String.Encoding.utf8)!
                let temp = jsonString.convertToDictionary()
                let mut = NSMutableDictionary.init(dictionary: temp ?? [:])
                mut.addEntries(from: ["statusCode":response.statusCode])
                let data = try JSONSerialization.data(withJSONObject: mut, options: JSONSerialization.WritingOptions.prettyPrinted)
    
                completion(String(data: (temp != nil ? data : response.data), encoding: String.Encoding.utf8)!)
               
                if  response.statusCode == 404 || response.statusCode == 400 || response.statusCode == 422{
                    if (jsonData[RESULT_MESSAGE].stringValue).count > 0 {
                        let alert = DEAlertView()
                              alert.showMessage(message: (jsonData[RESULT_MESSAGE].stringValue))
                    }
                } else if response.statusCode == 401 {
                    
                    UserDefaults.standard.removeObject(forKey: APPTOKEN)
                    UserDefaults.standard.set(false, forKey: ISLOGINKEY)
                    UserDefaults.standard.set(false, forKey: DEMO_STATUS_KEY)
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: LOGOUTSUCCESSFUL), object: nil)

                }
                
            } catch {

                
            }
        case let .failure(error):
            //网络连接失败，提示用户
            errorResult?()
            DEIndicatorSingleton.shareInstance.dismiss()
        }
    }
}


/// 基于Alamofire,网络是否连接，，这个方法不建议放到这个类中,可以放在全局的工具类中判断网络链接情况
/// 用get方法是因为这样才会在获取isNetworkConnect时实时判断网络链接请求，如有更好的方法可以fork
var isNetworkConnect: Bool {
    get{
        let network = NetworkReachabilityManager()
        return network?.isReachable ?? true //无返回就默认网络已连接
    }
}
