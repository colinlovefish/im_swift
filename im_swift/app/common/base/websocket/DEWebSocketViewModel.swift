//
//  DEWebSocketViewModel.swift
//  coinandcoin
//
//  Created by yinghu on 2020/5/15.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit
import RxSwift
import SocketIO

@objc protocol websocketViewModelDelegate : NSObjectProtocol {
    
}

protocol websocketInterface {
   func socketConfigure()
}


class DEWebSocketViewModel: DEBaseViewModel, websocketInterface {
    static let shareInstance = DEWebSocketViewModel()
    var miniSubject = PublishSubject<Any>()
    lazy var e = Echo(options: ["host":"ws://www.coinandcoin.release/socket.io/?EIO=3&transport=websocket","Auth-Type": "api", "Language": "en","auth": ["headers": ["Authorization": ("Bearer " + (UserDefaults.standard.object(forKey: APPTOKEN) as? String ?? ""))]]])
    
    lazy var demoE = Echo(options: ["host":"ws://demo.coinandcoin.release/socket.io/?EIO=3&transport=websocket","Auth-Type": "api", "Language": "en","auth": ["headers": ["Authorization": ("Bearer " + (UserDefaults.standard.object(forKey: APPTOKEN) as? String ?? ""))]]])
    
    func socketConfigure() {
        let token = UserDefaults.standard.object(forKey: APPTOKEN) as? String ?? ""
        let header = "Bearer " + token
        e = Echo(options: ["host":"ws://www.coinandcoin.release/socket.io/?EIO=3&transport=websocket","Auth-Type": "api", "Language": "en","auth": ["headers": ["Authorization": header]]])
    }
    
    
    func socketConnect() {
        _ = self.e.channel(channel: "market.price.mini.btc_usdt").listen(event: ".update", callback: { data, ack in
            self.miniSubject.onNext(data[1])
        })
    }
    
    
    func disconnect() {
        self.e.disconnect()
    }
    
    func privateChannelUnsubcribes(channel : String) {
        self.e.privateChannel(channel: channel).stopListenling(event: ".contract.mini.update")
        self.e.privateChannel(channel: channel).stopListenling(event: ".contract.mini.create")
        self.e.privateChannel(channel: channel).stopListenling(event: ".contract.otc.create")
        self.e.privateChannel(channel: channel).stopListenling(event: ".contract.otc.update")
        self.e.privateChannel(channel: channel).stopListenling(event: ".user.otc.update")
        self.e.privateChannel(channel: channel).stopListenling(event: ".coin.exchange.order.create")
        self.e.privateChannel(channel: channel).stopListenling(event: ".coin.exchange.order.update")
        self.e.privateChannel(channel: channel).stopListenling(event: ".spot.order.update")
        
    }
    
    /***mini订单订阅 - 私有*****/
    var orderStartSocketSubject = PublishSubject<Any>()
    var orderEndSocketSubject = PublishSubject<Any>()
    var exchangeOrderUpdate = PublishSubject<Any>()
    var exchangeOrderCreate = PublishSubject<Any>()
    var otcStartSocketSubject = PublishSubject<Any>()
    var otcEndSocketSubject = PublishSubject<Any>()

    var isRegisterPrivate : Bool = false
    //现货交易信息变化--监听
    var spotSubject = PublishSubject<Any>()
    
    func unSubcribeMiniDemo(channel: String) {
        self.demoE.privateChannel(channel: channel).stopListenling(event: ".contract.mini.update")
        self.demoE.privateChannel(channel: channel).stopListenling(event: ".contract.mini.create")
        self.demoE.privateChannel(channel: channel).stopListenling(event: ".contract.otc.create")
        self.demoE.privateChannel(channel: channel).stopListenling(event: ".contract.otc.update")
        self.demoE.privateChannel(channel: channel).stopListenling(event: ".user.otc.update")
        self.demoE.privateChannel(channel: channel).stopListenling(event: ".coin.exchange.order.create")
        self.demoE.privateChannel(channel: channel).stopListenling(event: ".coin.exchange.order.update")
        self.demoE.privateChannel(channel: channel).stopListenling(event: ".spot.order.update")
    }
    
    func miniOrderDemoChannelSubscribe(channel: String) {
        unSubcribeMiniDemo(channel: channel)
        self.demoE.privateChannel(channel: channel).subscribe()
        demoE.connected { data, ack in
            
            
            _ = self.demoE.privateChannel(channel: channel).listen(event: ".contract.mini.update") { data, ack in
                self.orderEndSocketSubject.onNext(data[1])
            }
            
            _ = self.demoE.privateChannel(channel: channel).listen(event:  ".contract.mini.create") { data, ack in
                self.orderStartSocketSubject.onNext(data[1])
            }
            
            
            _ = self.demoE.privateChannel(channel: channel).listen(event:  ".contract.otc.create") { data, ack in
                self.otcStartSocketSubject.onNext(data[1])
            }
            
            _ = self.demoE.privateChannel(channel: channel).listen(event:  ".contract.otc.update") { data, ack in
                self.otcEndSocketSubject.onNext(data[1])
            }
            
            _ = self.demoE.privateChannel(channel: channel).listen(event: ".spot.order.update", callback: { data, ack in
                self.spotSubject.onNext(data[1])
            })
            
            _ = self.demoE.privateChannel(channel: channel).listen(event: ".coin.exchange.order.update", callback: { data, ack in
                self.exchangeOrderUpdate.onNext(data[1])
            })
            
            _ = self.demoE.privateChannel(channel: channel).listen(event: ".coin.exchange.order.create", callback: { data, ack in
                self.exchangeOrderCreate.onNext(data[1])
            })
            
            _ = self.demoE.privateChannel(channel: channel).listen(event: ".user.otc.update", callback: { data, ack in
                let dict = data[1] as? Dictionary<String, Any> ?? [:]
                if dict.count > 0 {
                    let sdata = dict["data"] as? Dictionary<String ,Any> ?? [:]
                    if sdata.count > 0 {
                        //sdata 内部包含 balance, orders, end_ids 三项信息
                        let order = sdata["orders"] as? Array<Any> ?? []
                        self.userOtcSubject.onNext(order)
                    }
                }
            })
            
            _ = self.demoE.privateChannel(channel: channel).listen(event: ".user.otc.update", callback: { data, ack in
                self.userInfoSocketSubject.onNext(data[1])
            })
        }
    }
    
    func miniOrderChanelSubcribe(channel: String) {
        //先取消订阅，再重新订阅
        privateChannelUnsubcribes(channel : channel)
        
        self.e.privateChannel(channel: channel).subscribe()

        _ = self.e.privateChannel(channel: channel).listen(event: ".contract.mini.update") { data, ack in
            self.orderEndSocketSubject.onNext(data[1])
        }
        
        _ = self.e.privateChannel(channel: channel).listen(event:  ".contract.mini.create") { data, ack in
            self.orderStartSocketSubject.onNext(data[1])
        }
        
        
        _ = self.e.privateChannel(channel: channel).listen(event:  ".contract.otc.create") { data, ack in
            self.otcStartSocketSubject.onNext(data[1])
        }
        
        _ = self.e.privateChannel(channel: channel).listen(event:  ".contract.otc.update") { data, ack in
            self.otcEndSocketSubject.onNext(data[1])
        }
        
        _ = self.e.privateChannel(channel: channel).listen(event: ".spot.order.update", callback: { data, ack in
            self.spotSubject.onNext(data[1])
        })
        
        _ = self.e.privateChannel(channel: channel).listen(event: ".coin.exchange.order.update", callback: { data, ack in
            self.exchangeOrderUpdate.onNext(data[1])
        })
        
        _ = self.e.privateChannel(channel: channel).listen(event: ".coin.exchange.order.create", callback: { data, ack in
            self.exchangeOrderCreate.onNext(data[1])
        })
        
        _ = self.e.privateChannel(channel: channel).listen(event: ".user.otc.update", callback: { data, ack in
            let dict = data[1] as? Dictionary<String, Any> ?? [:]
            if dict.count > 0 {
                let sdata = dict["data"] as? Dictionary<String ,Any> ?? [:]
                if sdata.count > 0 {
                    //sdata 内部包含 balance, orders, end_ids 三项信息
                    let order = sdata["orders"] as? Array<Any> ?? []
                    self.userOtcSubject.onNext(order)
                }
            }
        })
        
        _ = self.e.privateChannel(channel: channel).listen(event: ".user.otc.update", callback: { data, ack in
            self.userInfoSocketSubject.onNext(data[1])
        })
    }
    
    
    
//    func exchangeOrderPrivate(channel: String) {
//
//        self.e.privateChannel(channel: channel).subscribe()
//    }
    
    /***用户信息订阅***/
    var userInfoSocketSubject = PublishSubject<Any>()
    /***OTC私有合约信息，返回当前永续合约订单价格信息***/
    var userOtcSubject = PublishSubject<Any>()
    
   
    
    
    
    //    channel切换
    func changeChannel(original: String, current: String, isOTC : Bool = false) {
        if original != current {
            self.channelUnsubcribes(channel: original)
            if isOTC {
                self.otcChannelSubcribes(channel: current)
            }else {
                self.channelSubcribes(channel: current)
            }
        }
    }
    
    func channelUnsubcribes(channel: String) {
        self.e.channel(channel: channel).stopListenling(event: ".update")
    }
    
    

    
    //    mini合约订阅
    func channelSubcribes(channel: String) {
        self.e.channel(channel: channel).subscribe()
        _ = self.e.listen(channel: channel, event: ".update") { data, ack in
            self.miniSubject.onNext(data[1])
        }
    }
    //    OTC 合约 socket连接
    var otcSocketSubject = PublishSubject<Any>()
    func otcSocketConnect() {
        self.e.channel(channel: "market.price.otc.btc_usdt").subscribe()
        _ = self.e.channel(channel: "market.price.otc.btc_usdt").listen(event: ".update", callback: { data, ack in
            self.otcSocketSubject.onNext(data[1])
        })
    }
    
    //    OTC 合约订阅
    func otcChannelSubcribes(channel: String) {
        self.e.channel(channel: channel).subscribe()
        _ = self.e.listen(channel: channel, event: ".update", callback: { data,ack in
            self.otcSocketSubject.onNext(data[1])
        })
    }
    
    var btcSubject = PublishSubject<Any>()
    var etcSubject = PublishSubject<Any>()
    var ltcSubject = PublishSubject<Any>()
    
    func socketHomepageConnect(symbolData: DESymbolData) {
        e.connected(){ data, ack in
            self.homeChannel(symbolData: symbolData)
        }
    }
    
    var pendingSubject = PublishSubject<Any>()//订阅市场参与者数据
    func pendingStaticsChannel(channel: String) {
        let cha = "contract.pending.order.statistics." + channel
        
        e.connected(){ data, ack in
            self.e.channel(channel: cha).subscribe()
            _ = self.e.channel(channel: cha).listen(event: ".update", callback: { data, ack in
                self.pendingSubject.onNext(data[1])
            })
        }
    }
    
    //k线数据 mini
    var klineSubject = PublishSubject<Any>()
    func klineSocket(channel: String) {
        let cha = "kline." + channel
        
        self.e.channel(channel: cha).subscribe()
        _ = self.e.channel(channel: cha).listen(event: ".kline.update", callback: { data, ack in
            let dict = data[1] as? Dictionary<String, Any> ?? [:]
            let da = dict["data"] ?? [:]
            self.klineSubject.onNext(da)
        })
    }
    
    //订阅K线上订单变化  - mini
    var tradeOrderComSubject = PublishSubject<Any>()
    var tradeOrderCreateSubject = PublishSubject<Any>()
    func miniTradeOrderSocket() {
        let channel = "contract.mini.order.note"
        self.e.channel(channel: channel).subscribe()
        //订单结束
        _ = self.e.channel(channel: channel).listen(event: ".order.completed", callback: { data, ack in
            self.tradeOrderComSubject.onNext(data[1])
        })
        
        // 订单创建
        _ = self.e.channel(channel: channel).listen(event: ".order.created", callback: { data, ack in
            self.tradeOrderCreateSubject.onNext(data[1])
        })
        
    }
    
    func unSubscribeTradeOrder() {
        let channel = "contract.mini.order.note"
        _ = self.e.channel(channel: channel).stopListenling(event: ".order.created")
        _ = self.e.channel(channel: channel).stopListenling(event: ".order.completed")
    }
    
    func unSubscribeKlineSocket(channel : String) {
        let cha = "kline." + channel
        _ = self.e.channel(channel: cha).stopListenling(event: ".kline.update")
    }
    
    func unSubscribePendingStaticsChannel(channel: String) {
        let cha = "contract.pending.order.statistics." + channel
        _ = self.e.channel(channel: cha).stopListenling(event: ".update")
    }
    
     //订阅K线上订单变化  - OTC
    var otcTradeComSubject = PublishSubject<Any>()
    var otcTradeCreateSubject = PublishSubject<Any>()
    func otcTradeOrderSocket() {
        let channel = "contract.otc.order.note"
        self.e.channel(channel: channel).subscribe()
        _ = self.e.channel(channel: channel).listen(event: ".order.completed", callback: { data, ack in
            self.otcTradeComSubject.onNext(data[1])
        })
        
        _ = self.e.channel(channel: channel).listen(event: ".order.created", callback: { data, ack in
            self.otcTradeCreateSubject.onNext(data[1])
        })
    }    
    //取消订阅K线上订单变化  - OTC
    func unSubscribeOtcTradeOrder() {
        let channel = "contract.otc.order.note"
        _ = self.e.channel(channel: channel).stopListenling(event: ".order.created")
        _ = self.e.channel(channel: channel).stopListenling(event: ".order.completed")
    }
    
   //k线数据 OTC
   var otcKlineSubject = PublishSubject<Any>()
   func otcKlineSocket(channel: String) {
       let cha = "kline.otc." + channel
       self.e.channel(channel: cha).subscribe()
       _ = self.e.channel(channel: cha).listen(event: ".kline.otc.update", callback: { data, ack in
           let dict = data[1] as? Dictionary<String, Any> ?? [:]
           let da = dict["data"] ?? [:]
           self.otcKlineSubject.onNext(da)
       })
   }
    
    
    func unSubscribeOtcKlineSocket(channel : String) {
        let cha = "kline.otc." + channel
        _ = self.e.channel(channel: cha).stopListenling(event: ".kline.otc.update")
    }
 
    
    func listenChannel(channel: String, event: String) {
        _ = self.e.channel(channel: channel).listen(event: event) { data, ack in
            
        }
    }
    
    
    func homeChannelStopListen(symbolData: DESymbolData) {
        let list : Array = symbolData.data
        
        list.forEach { (item) in
            let cha = "market.price.mini." + (item.symbol ?? "")
            self.e.channel(channel: cha).stopListenling(event: ".update")
        }
    }
    
    func homeChannel(symbolData: DESymbolData) {
        let list : Array = symbolData.data
        
        for item in list {
            let cha = "market.price.mini." + (item.symbol ?? "")
            self.e.channel(channel: cha).subscribe()
            _ = self.e.channel(channel: cha).listen(event: ".update", callback: { data, ack in
                if item.symbol == "btc_usdt" {
                    self.btcSubject.onNext(data[1])
                    UserDefaults.standard.set(false, forKey: SOCKETCONNECTERROR_KEY)
                }else if item.symbol == "eth_usdt" {
                    self.etcSubject.onNext(data[1])
                }else {
                    self.ltcSubject.onNext(data[1])
                }
            })
            
            _ = self.e.channel(channel: cha).listen(event: ".error", callback: { data, ack in
                
            })
            
            _ = self.e.channel(channel: cha).listen(event: ".disconnect", callback: { data, ack in
                
            })
        }
    }
    
}
