//
//  DownLoader.swift
//  coinandcoin
//
//  Created by yinghu on 2020/5/23.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

private let kCachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
private let kTempPath = NSTemporaryDirectory()

class DownLoader: NSObject  {

    fileprivate var downLoadedPath : String?
    fileprivate var downLoadingPath : String?
    fileprivate var outputStream : OutputStream?
    fileprivate var tmpSize : CLongLong = 0
    fileprivate var totalSize : CLongLong = 0
    
    
    fileprivate lazy var session : URLSession  = {
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        return session
        
    }()
    
    func downLoader(url : URL) {
        
        let fileName = url.lastPathComponent

        guard url.lastPathComponent != nil else {
            print("url有问题")
            return
        }
        
        self.downLoadingPath = kTempPath  + fileName
        self.downLoadedPath = Bundle.main.path(forResource: "delocalizable", ofType: "bundle")
        
        print(self.downLoadingPath ?? "")
        
        //如果没有下载完成 就看是否有临时文件
        if !FileTool.fileExists(filePath: self.downLoadingPath!) {
            //不存在的话 直接开始下载
            self.downLoadWithURL(url as URL, 0)
            
            return;
        }
        
        
        //已经下载了的 先计算 下载的大小,然后继续下载
        tmpSize = FileTool.fileSize(self.downLoadingPath!)
        self.downLoadWithURL(url as URL, 0)
        
    }
    
    
    // MARK:- 开始请求资源
    func downLoadWithURL(_ url : URL, _ offset : CLongLong) {
        
        var request = NSURLRequest(url: url, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 0) as URLRequest
        
        
       let dataTask = self.session.dataTask(with: request)
        
        dataTask.resume()
    }
    
    
}


extension DownLoader : URLSessionDataDelegate {
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Swift.Void){
        
        
        // 继续接受数据
        // 确定开始下载数据
        self.outputStream = OutputStream(toFileAtPath: self.downLoadingPath!, append: true)
        
        self.outputStream?.open()
        completionHandler(URLSession.ResponseDisposition.allow);
        
        
        
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data){
        
        var buffer = [UInt8](repeating: 0, count: data.count)
        data.copyBytes(to: &buffer, count: data.count)
        
        self.outputStream?.write(buffer, maxLength: data.count)

    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?){
        
//        let path = Bundle.main.path(forResource: "delocalizable", ofType: "bundle")
//        print("bundle:" + path!)
//        SSZipArchive.unzipFile(atPath: self.downLoadingPath!, toDestination: kTempPath)
//        let bundlePath = kTempPath + "delocalizable.bundle"
//        
//        FileTool.removeFile(self.downLoadedPath!)
//        FileTool.moveFile(bundlePath, self.downLoadedPath!)
//
//        
//        if (error == nil) {
//            
//            // 不一定是成功
//            // 数据是肯定可以请求完毕
//            // 判断, 本地缓存 == 文件总大小 {filename: filesize: md5:xxx}
//            // 如果等于 => 验证, 是否文件完整(file md5 )
//           
//        }else {
//            print("有问题")
//        }
//      
//        self.outputStream?.close()
//        
    }
  
}
