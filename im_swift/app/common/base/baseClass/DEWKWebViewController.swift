//
//  DEWKWebViewController.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/6.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit
import WebKit

class DEWKWebViewController: DEBaseController {
   
    var url : String = ""
    var webView : WKWebView?
    var titleString : String = ""
//    lazy  var progressView = UIProgressView.init(frame: CGRect.init(x: 0, y: 1, width: SCREEN_WIDTH, height: 1))
   

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        creatProgressView()
        
        webView?.addObserver(self, forKeyPath: "loading", options: NSKeyValueObservingOptions.new, context: nil)
        webView?.addObserver(self, forKeyPath: "title", options: NSKeyValueObservingOptions.new, context: nil)
        webView?.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    deinit {
        webView?.removeObserver(self, forKeyPath: "loading")
        webView?.removeObserver(self, forKeyPath: "title")
        webView?.removeObserver(self, forKeyPath: "estimatedProgress")
        self.webView?.uiDelegate = nil
        self.webView?.navigationDelegate = nil
    }
    
    
    
    
    func creatProgressView() {

        
        
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "title" {
            self.title = self.webView?.title ?? ""
        }else if keyPath == "estimatedProgress"{
           
        }
    }

    func reloadWebView(url:String) {
        self.url = url
        self.webView?.load(URLRequest.init(url: URL.init(string: self.url)!))
    }
    
    func getUserInfo() {

          
      }
      
      
      func JSCallBack(jscode: String) {
          webView?.evaluateJavaScript(jscode, completionHandler: { (res, error) in
              print("\(String(describing: error))")
          })
      }
      
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension DEWKWebViewController : WKScriptMessageHandler,WKNavigationDelegate,WKUIDelegate {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        //调用方法名
//        var methods : String = ""
//        if message.body is String {
//            let str = message.body as! String
//            if str.notEmpty() {
//                methods = message.name + ":"
//            }else {
//                methods = message.name
//            }
//
//        }
        let methods = message.name
        
        if methods == "getUserInfo" {
            self.getUserInfo()
        }
//        let selector = NSSelectorFromString(methods)
//        if self.responds(to: selector) {
//            self.perform(selector, with: message.body)
//        }else {
//            print("未执行方法\(methods)")
//        }
    }
    
    func setupWebView() {
        
        let config = WKWebViewConfiguration()
        config.preferences = WKPreferences()
        config.preferences.minimumFontSize = 10
        //是否支持javascript
        config.preferences.javaScriptEnabled = true
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        //通过JS与webView内容交互
        config.userContentController = WKUserContentController()
        //重新刷新页面
        config.userContentController.add(self, name: "navigator")
        config.userContentController.add(self, name: "getUserInfo")
         webView = WKWebView.init(frame: self.view.bounds, configuration: config)
        if url.count == 0 {
            url = "https://help.coinandcoin.io/en/"
        }
    
        let request = URLRequest(url: URL.init(string: url)!)
        webView?.load(request as URLRequest)
        webView?.isOpaque = true
        webView?.isUserInteractionEnabled = true
        webView?.navigationDelegate = self
        webView?.uiDelegate = self
        self.view.addSubview(webView!)
        
    }
    
    
  
    
    
    func setWebViewUIInfo() {
        
    }
    
    
    /******WKNavigationDelegate****/
    
   
    
    //webview开始加载时候调用
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    //webview开始返回内容时候调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    
    //webview页面加载完成
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.title = webView.title
        
    }
    
    //页面加载失败
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
    
    //support   window.open()
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame?.isMainFrame == false {
            self.webView?.load(navigationAction.request)
        }
        if navigationAction.targetFrame == nil {
            self.webView?.load(navigationAction.request)
        }
        
        return nil
    }
    
    // alert 警告框
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction.init(title: "OK", style: .default) { (UIAlertAction) in
            completionHandler()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
                
    }
    
    //confirm 确认框
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alert = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction.init(title: "OK", style: .default) { (UIAlertAction) in
            completionHandler(true)
        }
        let cancel = UIAlertAction.init(title: "Cancel", style: .cancel) { (UIAlertAction) in
            completionHandler(false)
        }
        
        alert.addAction(confirm)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //textfield 输入框
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        let alert = UIAlertController.init(title: nil, message: prompt, preferredStyle: .alert)
        alert.addTextField { (textfield) in
            textfield.textColor = UIColor.black
            textfield.placeholder = defaultText
        }
        
        alert.addAction(UIAlertAction.init(title: "Confirm", style: .default, handler: { (action) in
            completionHandler(alert.textFields?.last?.text)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    

    
   
}
