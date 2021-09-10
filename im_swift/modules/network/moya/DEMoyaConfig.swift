//
//  DEMoyaConfig.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/17.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import Foundation

#if DEBUG
//let BASE_URL = "http://cac.stanzhou.lan/api/v1/"
let BASE_URL = "http://www.coinandcoin.release/api/v1/"
let DEMO_URL = "http://demo.coinandcoin.release/api/v1/"
let BASE_URL_V2 = "http://www.coinandcoin.release/api/v2/"
let INTECOM_KEY = "ios_sdk-9832084d2fe09e68ff872939a93dd64fd4ecc5a7"
let INTECOM_ID = "i5qbs1t5"


#else


//let BASE_URL = "http://www.coinandcoin.release/api/v1/"
//let DEMO_URL = "http://demo.coinandcoin.release/api/v1/"
//let BASE_URL_V2 = "http://www.coinandcoin.release/api/v2/"

let BASE_URL = "https://www.coinandcoin.io/api/v1/"
let DEMO_URL = "https://demo.coinandcoin.io/api/v1/"
let BASE_URL_V2 = "https://www.coinandcoin.io/api/v2/"
let INTECOM_KEY = "ios_sdk-f5995aa4b9dd7d85d2397ad9558823f7841fea5a"
let INTECOM_ID = "o0dgt99j"

#endif


let PEODUCTION_BASE_URL = "https://www.coinandcoin.io/api/v1/"
let PEODUCTION_DEMO_URL = "https://demo.coinandcoin.io/api/v1/"
let PEODUCTION_BASE_URL_V2 = "https://www.coinandcoin.io/api/v2/"

let OFFLINE_BASE_URL = "http://www.coinandcoin.release/api/v1/"
let OFFLINE_DEMO_URL = "http://demo.coinandcoin.release/api/v1/"
let OFFLINE_BASE_URL_V2 = "http://www.coinandcoin.release/api/v2/"

let RESULT_CODE = "flag"

let RESULT_MESSAGE = "message"
