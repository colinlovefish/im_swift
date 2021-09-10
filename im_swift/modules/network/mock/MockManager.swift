//
//  MockManager.swift
//  coinandcoin
//
//  Created by yinghu on 2020/5/22.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit
import OHHTTPStubs
//import DownLoader


class MockManager: NSObject  {
    static let shareInstance = MockManager()
    weak var textStub: HTTPStubsDescriptor?
    var responseData : Data!
    var session : URLSession?
    func mockRequest(url: String, file: String) {

        let urlString = "http://127.0.0.1:8080/delocalizable.bundle"
        var req = URLRequest(url: URL(string: urlString)!)
        req.httpMethod = "GET"
        session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        // 创建下载任务
        let downloadTask = session?.dataTask(with: req)
        // 开始下载
        downloadTask?.resume()
    }
    
    
    
}

extension MockManager : URLSessionDataDelegate {
    // 接收到服务器响应的时候调用该方法 completionHandler .allow 继续接收数据
     func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
         print("开始响应...............")
         completionHandler(.allow)
     }
     
     //接收到数据 可能调用多次
     func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
         print("接收到数据...............")
         if self.responseData == nil {
             self.responseData = Data.init()
         }
         // 因为多次返回数据，这里把data合并
         self.responseData?.append(data)
         // 已经接收到的数据大小
         let currentLength = Float(self.responseData?.count ?? 0)
         // 这里有个问题 有些写的不规范的 header里面没有length 那就无法计算进度
         let totalLength = Float(dataTask.response?.expectedContentLength ?? -1)
         var progress = currentLength / totalLength
         if totalLength<0 {
             progress = 0.0
         }
         print("current: \(currentLength) , total:\(totalLength), progress:\(progress)")
         // 刷新进度条
         weak var downloadSelf = self
         DispatchQueue.main.async {
//             downloadSelf?.refreshUI(progress: progress, error: nil)
         }
     }
     //下载结束 error有值表示失败
     func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
         print("下载完成")
         weak var downloadSelf = self
         DispatchQueue.main.async {
//             downloadSelf?.refreshUI(progress: 1.0, error: error)
//            self.outputStream = OutputStream(toFileAtPath: self.downLoadingPath!, append: true)
//            
//            self.outputStream?.open()
             // 下载完成要释放资源
            downloadSelf?.session?.invalidateAndCancel()
             downloadSelf?.session = nil
             downloadSelf?.responseData  = nil
         }
     }
}
