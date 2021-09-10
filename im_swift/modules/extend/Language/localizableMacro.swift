//
//  localizableMacro.swift
//  coinandcoin
//
//  Created by yinghu on 2020/3/24.
//  Copyright © 2020 deepcoin. All rights reserved.
//

import UIKit

//设置
let FEATURE_SETTINGS_TITLE = "feature_settings_title"
//语言
let FEATURE_SETTINGS_LANGUAGE_LABEL = "feature_settings_language_label"
//时区
let FEATURE_SETTINGS_TIMEZONE_LABEL = "feature_settings_timezone_label"


let FEATURE_SETTINGS_CONTRACT_CONFIRM_LABEL =  "feature_settings_contractConfirm_label"
let FEATURE_SETTINGS_RATEUS_LABEL = "feature_settings_rateUs_label"

let FEATURE_SETTINGS_UPDATE_CHECK_LABEL = "feature_settings_updateCheck_label"

let FEATURE_SETTINGS_ABOUTUS_LABEL = "feature_settings_aboutUs_label"

let FEATURE_SETTINGS_LOGOUT_BUTTON = "feature_settings_logout_button"

let FEATURE_HOME_MENU_HELP_CAPTION = "feature_home_menu_help_caption"
let FEATURE_HOME_MENU_SERVICE_CAPTION = "feature_home_menu_service_caption"

//消息中心
let FEATURE_MESSAGES_TITLE = "feature_messages_title"
//notice
let FEATURE_MESSAGES_NOTICE = "feature_messages_tabs_notification"

//个人中心

//出金
let FEATURE_HOME_MENU_DEPOSIT = "feature_home_menu_deposit_caption"
//入金
let FEATURE_HOME_MENU_WITHDRAW = "feature_home_menu_withdraw_caption"
//订单
let FEATURE_HOME_RECORED = "feature_user_menu_coin_order_list_menuCaption"
let FEATURE_MENU_ORDER_HISTORY = "feature_user_menu_contract_list_menuCaption"
//支付
let FEATURE_MENU_PAYMENT = "feature_user_menu_payment_title"
let FEATURE_MENU_ACCOUNTFLOW = "feature_user_menu_account_bill_caption"
let FEATURE_MENU_HELP = "feature_user_menu_help_title"
let FEATURE_MENU_INVITEFREND = "feature_user_menu_promote_caption"
let FEATURE_PASSWORD_CONFIRM = "feature_session_form_field_password_confirm_is_different"
//登录



//region
let FEATURE_SESSION_REGIONLABEL = "feature_session_form_field_region_label"
let FEATURE_SESSION_REGIONLABEL_PLACEHODER = "feature_session_form_field_region_placeholder"
//phone
let FEATURE_SESSION_FIELD_PHONE = "feature_session_form_field_phone_label"
let FEATURE_SESSION_FIELD_PHONE_PLACEHODER = "feature_session_form_field_phone_placeholder"
//captcha
let FEATURE_SESSION_FIELD_CAPTCHA = "feature_session_form_field_captcha_label"
let FEATURE_SESSION_FIELD_CAPTCHA_PLACEHODER = "feature_session_form_field_captcha_placeholder"
//email
let FEATURE_SESSION_EMAIL = "feature_session_form_field_email_label"
let FEATURE_SESSION_EMAIL_PLACEHODER = "feature_session_form_field_email_placeholder"
//captcha click refresh
let FEATURE_SESSION_CAPTCHA_REFRESH = "feature_session_form_field_captcha_button_refresh"
//password
let FEATURE_SESSION_PASSWORD = "feature_session_form_field_password_label"
let FEATURE_SESSION_PASSWORD_PLACEHODER = "feature_session_form_field_password_placeholder"

//name
let FEATURE_SESSION_NAME = "feature_session_form_field_name_label"
let FEATURE_SESSION_NAME_PLACEHODER = "feature_session_form_field_name_placeholder"

//email validation
let FEATURE_SESSION_EMAIL_VALIDATION = "feature_session_form_field_email_validation_label"
let FEATURE_SESSION_EMAIL_VALIDATION_PLACEHODER = "feature_session_form_field_email_validation_placeholder"
//get email
let FEATURE_SESSION_EMAIL_VALIDATIONREFRESH = "feature_session_form_field_email_validation_button_refresh" 
//sms code
let FEATURE_SESSION_SMS_VALIDATIONLABEL = "feature_session_form_field_sms_validation_label"
let FEATURE_SESSION_SMS_VALIDATIONLABEL_PLACEHODER = "feature_session_form_field_sms_validation_placeholder"
//get code
let FEATURE_SESSION_GET_SMS_CODE = "feature_session_form_field_sms_validation_button_refresh" 
//confirm password
let FEATURE_SESSION_CONFIRM_PASSWORD = "feature_session_form_field_password_confirm_label"
let FEATURE_SESSION_CONFIRM_PASSWORD_PLACEHODER = "feature_session_form_field_password_confirm_placeholder"
let FEATURE_SESSION_CONFIRM_PASSWORD_DIFFERENT = "feature_session_form_field_password_confirm_is_different"
//referrer code
let FEATURE_SESSION_REFERRERLABEL = "feature_session_form_field_referrer_label"
let FEATURE_SESSION_REFERRERLABEL_PLACEHODER = "feature_session_form_field_referrer_placeholder"
//term
let FEATURE_SESSION_TERMS_PREFIX = "feature_session_form_field_terms_prefix"
let FEATURE_SESSION_TERMS_NAME = "feature_session_form_field_terms_name"
let FEATURE_SESSION_TERMS_SUFFIX = "feature_session_form_field_terms_suffix"
let FEATURE_SESSION_TERMS_LINK = "feature_session_form_field_terms_link"
let FEATURE_SESSION_TERMS_TMP = "feature_session_form_field_terms__tmp"

//bottom button switch
let FEATURE_SESSION_BOTTOM_EMAIL = "feature_session_form_switch_use_email_label" 
let FEATURE_SESSION_BOTTOM_PHONE = "feature_session_form_switch_use_phone_label" 
let FEATURE_SESSION_BOTTOM_LOGIN = "feature_session_form_operation_login_button" 
let FEATURE_SESSION_BOTTOM_SIGNUP = "feature_session_form_operation_sign_up_button"
let FEATURE_SESSION_BOTTOM_RESETPASSWORD = "feature_session_form_operation_reset_password_button" 
let FEATURE_SESSION_BOTTOM_LOGOUT = "feature_session_form_operation_logoff_button"
//profile
let FEATURE_USER_PROFILE_TITLE = "feature_user_profile_title"
let FEATURE_USER_PROFILE_LOGIN = "feature_home_operation_login_button"
let FEATURE_APP_SLOGAN = "public_app_description"
//KYC
let FEATURE_USER_MENU_VERIFY_TITLE = "feature_user_menu_verify_title" 
let FEATURE_KYC_PERMISSIONS_TITLE = "feature_kyc_permissions_title" 
let FEATURE_KYC_PERMISSIONS_BUTTON = "feature_kyc_permissions_button" 
let FEATURE_KYC_PROGRESS_STEP1 = "feature_kyc_progress_step1"
let FEATURE_KYC_PROGRESS_STEP2 = "feature_kyc_progress_step2"
let FEATURE_KYC_PROGRESS_STEP3 = "feature_kyc_progress_step3"
//KYC help
let FEATURE_KYC_HELPER_STEP1_ITEM1 = "feature_kyc_helper_step1_item1" 
let FEATURE_KYC_HELPER_STEP1_ITEM2 = "feature_kyc_helper_step1_item2"
let FEATURE_KYC_HELPER_STEP1_ITEM3 = "feature_kyc_helper_step1_item3"
let FEATURE_KYC_FIELD_HANDHOLD_TIP = "feature_kyc_field_handHeld_tip"
let FEATURE_KYC_HELPER_STEP2_ITEM1 = "feature_kyc_helper_step2_item1"
let FEATURE_KYC_HELPER_STEP2_ITEM2 = "feature_kyc_helper_step2_item2"
let FEATURE_KYC_FIELD_HANDHELD_LABEL = "feature_kyc_field_handHeld_label"
let FEATURE_KYC_CHECK = "feature_kyc_check"
let FEATURE_KYC_HELPER_STEP1_DESCRIPTION = "feature_kyc_helper_step1_description" 
let FEATURE_KYC_HELPER_STEP1_PREPARE = "feature_kyc_helper_step1_prepare"
let FEATURE_KYC_HELPER_STEP2_DESCRIPTION = "feature_kyc_helper_step2_description" 
let FEATURE_KYC_HELPER_STEP2_PREPARE = "feature_kyc_helper_step2_prepare" 
let FEATURE_KYC_HELPER_STEP3_DESCRIPTION = "feature_kyc_helper_step3_description" 
let FEATURE_KYC_HELPER_STEP3_PREPARE = "feature_kyc_helper_step3_prepare"
let FEATURE_KYC_FIELD_LIVING_TIP = "feature_kyc_field_livingProof_tip"
let FEATURE_KYC_HELPER_STEP3_ITEM1 = "feature_kyc_helper_step3_item1"
let FEATURE_KYC_STATE_EMPTY = "feature_kyc_state_empty"
let FEATURE_KYC_STATE_PENDING = "feature_kyc_state_pending"
let FEATURE_KYC_STATE_PASSED = "feature_kyc_state_passed"
let FEATURE_KYC_STATE_REFUSE = "feature_kyc_state_refuse"
let FEATURE_KYC_FIELD_REGION_LABEL = "feature_kyc_field_region_label" 
let FEATURE_KYC_FIELD_REGION_PLACEHOLDER = "feature_kyc_field_region_placeholder" 
let FEATURE_KYC_FIELD_FIRSTNAME_LABEL = "feature_kyc_field_firstName_label" 
let FEATURE_KYC_FIELD_FIRSTNAME_PLACEHOLDER = "feature_kyc_field_firstName_placeholder" 
let FEATURE_KYC_FIELD_LASTNAME_LABEL = "feature_kyc_field_lastName_label"
let FEATURE_KYC_FIELD_LASTNAME_PLACEHOLDER = "feature_kyc_field_lastName_placeholder"
let FEATURE_KYC_FIELD_PASSPORTNUMBER_LABEL = "feature_kyc_field_passportNumber_label" 
let FEATURE_KYC_FIELD_PASSPORTNUMBER_PLACEHOLDER = "feature_kyc_field_passportNumber_placeholder" 
let FEATURE_KYC_FIELD_PASSPORTDATE_LABEL = "feature_kyc_field_passportDate_label"
let FEATURE_KYC_FIELD_PASSPORTDATE_PLACEHOLDER = "feature_kyc_field_passportDate_placeholder"
let FEATURE_KYC_FIELD_PASSPORTPAGE_LABEL = "feature_kyc_field_passportPage_label" 
let FEATURE_KYC_FIELD_PASSPORTPAGE_PLACEHOLDER = "feature_kyc_field_passportPage_placeholder" 
let FEATURE_KYC_OPERATION_SUBMIT = "feature_kyc_operation_submit"
let FEATURE_KYC_FIELD_LIVINGPROOF_LABEL = "feature_kyc_field_livingProof_label" 
let FEATURE_KYC_FIELD_LIVINGREGION_LABEL = "feature_kyc_field_livingRegion_label" 
let FEATURE_KYC_FIELD_ADDRESS_LABEL = "feature_kyc_field_address_label"
let FEATURE_KYC_FIELD_CITY_LABEL = "feature_kyc_field_city_label"
let FEATURE_KYC_FIELD_ADDRESS_PLACEHOLDER = "feature_kyc_field_address_placeholder"
let FEATURE_KYC_FIELD_CITY_PLACEHOLDER = "feature_kyc_field_city_placeholder" 
//mini contract
let FEATURE_CONTRACT_PRICE_MAX = "feature_contract_price_max"
let FEATURE_CONTRACT_PRICE_MIN = "feature_contract_price_min"
let FEATURE_CONTRACT_CHART_LINE30S = "feature_contract_market_chart_line30S"
let FEATURE_CONTRACT_CHART_MORE = "feature_contract_market_chart_more"
let FEATURE_CONTRACT_MARKET_OPEN_TITLE = "feature_contract_market_open_title"
let FEATURE_CONTRACT_MARKET_OPEN_SUNDAY = "feature_contract_market_open_day_sunday"
let FEATURE_CONTRACT_MARKET_OPEN_MONDAY = "feature_contract_market_open_day_monday"
let FEATURE_CONTRACT_MARKET_OPEN_TUESDAY = "feature_contract_market_open_day_tuesday"
let FEATURE_CONTRACT_MARKET_OPEN_WEDNESDAY = "feature_contract_market_open_day_wednesday"
let FEATURE_CONTRACT_MARKET_OPEN_THURSDAY = "feature_contract_market_open_day_thursday"
let FEATURE_CONTRACT_MARKET_OPEN_FRIDAY = "feature_contract_market_open_day_friday"
let FEATURE_CONTRACT_MARKET_OPEN_SATURDAY = "feature_contract_market_open_day_saturday"
let FEATURE_CONTRACT_ORDER_BRIEF_COMMON_RATIO = "feature_contract_order_brief_common_ratio"
let FEATURE_CONTRACT_ORDER_BRIEF_COMMON_AMOUNT = "feature_contract_order_brief_common_amount"
let FEATURE_CONTRACT_ORDER_BRIEF_COMMON_INTERVAL = "feature_contract_order_brief_time_interval"
let FEATURE_CONTRACT_ORDER_BRIEF_POINT = "feature_contract_order_brief_point_point"
let FEATURE_CONTRACT_ORDER_BRIEF_COMMON_HANDVALUE = "feature_contract_order_form_common_handValue"
let FEATURE_CONTRACT_ORDER_BRIEF_COMMON_COUNT = "feature_contract_order_form_common_count" 
let FEATURE_CONTRACT_ORDE_FROM_TIME = "feature_contract_order_form_time_time"
let FEATURE_CONTRACT_ORDE_FROM_BUYRAISE = "feature_contract_order_form_common_buyRaise"
let FEATURE_CONTRACT_ORDE_FROM_BUYFALL = "feature_contract_order_form_common_buyFall"
let FEATURE_CONTRACT_ORDER_FROM_CURRENT_PRICE = "feature_contract_order_form_common_currentPrice"
let FEATURE_CONTRACT_ORDER_BRIEF_OTC_AMOUNT = "feature_contract_order_brief_otc_amount"
let FEATURE_CONTRACT_ORDER_BRIEF_OTC_VALUE = "feature_contract_order_brief_otc_value"
let FEATURE_CONTRACT_ORDER_BRIEF_OTC_LEVERAGE = "feature_contract_order_form_otc_leverage"
let FEATURE_CONTRACT_ORDER_FIELD_OTC_STARTMARGIN = "feature_contract_order_field_otc_startMargin"
let FEATURE_CONTRACT_ORDER_FORM_EARNING = "feature_contract_order_form_common_earnings"
let FEATURE_CONTRACT_ORDER_FORM_CONFIRM_AMOUNT = "feature_contract_order_form_common_confirmAmount"
let FEATURE_CONTRACT_ORDER_OPERATION_SUBMIT = "feature_contract_order_operation_submit"
let FEATURE_CONTRACT_ORDER_FORM_BUYRAISE = "feature_contract_order_form_otc_buyRaise"
let FEATURE_CONTRACT_ORDER_FORM_BUYFALL = "feature_contract_order_form_otc_buyFall"
let FEATURE_CONTRACT_ORDER_FORM_POINT = "feature_contract_order_form_point_point"
let FEATURE_HOME_RANK_TITLE = "feature_home_title_rankList"
let FEATURE_HOME_SYMBOL_PRICE = "feature_home_title_symbolPrice"
let FEATURE_CONTRACT_ORDER_FORM_OTC_HANDVALUE = "feature_contract_order_form_otc_handValue"
//永续订单执行中
let FEATURE_CONTRACT_ORDER_PAGE_TABS_PENDING = "feature_contract_order_page_tabs_pending"
//永续订单历史
let FEATURE_CONTRACT_ORDER_PAGE_TABS_COMPLETE = "feature_contract_order_page_tabs_complete"
//永续订单历史页面标题
let FEATURE_CONTRACT_ORDER_DETAIL_TITLE = "feature_contract_order_detail_title"
//永续订单历史页面 startprice
let FEATURE_CONTRACT_ORDER_FIELD_COMMON_STARTPRICE = "feature_contract_order_field_common_startPrice"
//永续订单历史页面 endprice
let FEATURE_CONTRACT_ORDER_FIELD_COMMON_ENDPRICE = "feature_contract_order_field_common_endPrice"
//下单方向
let FEATURE_CONTRACT_ORDER_FIELD_COMMON_DIRECTION = "feature_contract_order_field_common_direction"
//每手价值
let FEATURE_CONTRACT_ORDER_FIELD_OTC_MARGIN = "feature_contract_order_field_otc_margin"
//收益率
let FEATURE_CONTRACT_ORDER_FIELD_OTC_INCOME = "feature_contract_order_field_otc_income"
//开仓手续费
let FEATURE_CONTRACT_ORDER_FIELD_OTC_STARTFEE = "feature_contract_order_field_otc_startFee"
//平仓手续费
let FEATURE_CONTRACT_ORDER_FIELD_OTC_ENDFEE = "feature_contract_order_field_otc_endFee"
//隔夜手续费
let FEATURE_CONTRACT_ORDER_FIELD_OTC_OVERNIGHTFEE = "feature_contract_order_field_otc_overnightFee"
//隔夜间隔
let FEATURE_CONTRACT_ORDER_FIELD_OTC_OVERNIGHTMARGIN = "feature_contract_order_field_otc_overnightMargin"
//开仓时间
let FEATURE_CONTRACT_ORDER_FIELD_OTC_CREATEAT = "feature_contract_order_field_common_createdAt"
//平仓时间
let FEATURE_CONTRACT_ORDER_FIELD_OTC_ENDTIME = "feature_contract_order_field_common_endTime"
 //订单号
 let FEATURE_CONTRACT_ORDER_FIELD_OTC_ORDERNUMBER = "feature_contract_order_field_common_orderNumber" 
//时间订单
let FEATURE_CONTRACT_ORDER_TYPE_TIEM = "feature_contract_order_type_time"
//点位订单
let FEATURE_CONTRACT_ORDER_TYPE_POINT = "feature_contract_order_type_point"
//永续订单
let FEATURE_CONTRACT_ORDER_TYPE_OTC = "feature_contract_order_type_otc"
//订单虚拟账户
let FEATURE_CONTRACT_NETWORK_TITLE_DEMO = "feature_contract_network_title_demo"
let FEATURE_CONTRACT_NETWORK_TITLE_DEMOIN = "feature_contract_network_enter_demo"
let FEATURE_CONTRACT_NETWORK_TITLE_PRO = "feature_contract_network_title_production"
let FEATURE_CONTRACT_NETWORK_TITLE_PRODUCTIONSHORT = "feature_contract_network_title_productionShort"
//demo
let FEATURE_CONTRACT_NETWORK_TITLE_DEMOSHORT = "feature_contract_network_title_demoShort"
let FEATURE_CONTRACT_NETWORK_ENTER_PRODUCTION = "feature_contract_network_enter_production"
let FEATURE_CONTRACT_NETWORK_ALERT_DEMO_TITLE = "feature_contract_network_alert_demo_title"
let FEATURE_CONTRACT_NETWORK_ALERT_DEMO_CONTENT = "feature_contract_network_alert_demo_content" 
let FEATURE_CONTRACT_NETWORK_ALERT_PRODUCTION_CONTENT = "feature_contract_network_alert_production_content"
let FEATURE_CONTRACT_NETWORK_ALERT_DEMO_PRODUCTION_TITLE = "feature_contract_network_alert_production_title"
let FEATURE_CONTRACT_ORDER_FIELD_OTC_CAPTION_SETTING = "feature_contract_order_field_otc_caption_setting" 
let FEATURE_USER_ASSETS_BALANCE = "feature_user_assets_balance"
let FEATURE_USER_ASSETS_FROZENBALANCE = "feature_user_assets_frozenBalance"
let FEATURE_USER_ASSETS_CONTRACTEQUITY = "feature_user_assets_contractEquity"
// 出入金
let FEATURE_C2C_TABS_DEPOSIT_CAPTION = "feature_c2c_tabs_deposit_caption"
let FEATURE_C2C_TABS_WITHDRAW_CAPTION = "feature_c2c_tabs_withdraw_caption" 
let FEATURE_C2C_TABS_ORDERS_CAPTION = "feature_c2c_tabs_orders_caption" 
let FEATURE_C2C_TITLE = "feature_c2c_title"
//订单关闭弹框
let FEATURE_CONTRACT_ORDER_NOTICE_COMPLETE = "feature_contract_order_notice_complete" 
let FEATURE_CONTRACT_ORDER_OPERATION_MANUALCOMPLETE = "feature_contract_order_operation_manualComplete" 
//止盈
let FEATURE_CONTRACT_ORDER_OPERATION_STOPPROFIT_CAPTION = "feature_contract_order_operation_stopProfit_caption" 
let FEATURE_CONTRACT_ORDER_OPERATION_STOPPROFIT_LABEL = "feature_contract_order_operation_stopProfit_label" 
//没有设置
let FEATURE_CONTRACT_ORDER_OPERATION_STOPPROFIT_EMPTY = "feature_contract_order_operation_stopProfit_empty"
//设置成功-止盈
let FEATURE_CONTRACT_ORDER_OPERATION_STOPPROFIT_DONE = "feature_contract_order_operation_stopProfit_done"
//设置成功-止损
let FEATURE_CONTRACT_ORDER_OPERATION_STOPLOSS_DONE = "feature_contract_order_operation_stopLoss_done" 
let FEATURE_CONTRACT_ORDER_OPERATION_STOPLOSS_LABEL = "feature_contract_order_operation_stopLoss_label" 
//存储
let FEATURE_CONTRACT_ORDER_OPERATION_SAVE = "feature_contract_order_operation_save" 
//止损 占位
let FEATURE_CONTRACT_ORDER_OPERATION_STOPLOSS_PLACEHOLDER = "feature_contract_order_operation_stopLoss_placeholder"
//止盈 占位
let FEATURE_CONTRACT_ORDER_OPERATION_STOPPROFIT_PLACEHOLDER = "feature_contract_order_operation_stopProfit_placeholder"
//止损
let FEATURE_CONTRACT_ORDER_OPERATION_STOPLOSS_CAPTION = "feature_contract_order_operation_stopLoss_caption" 
//夜盘
let FEATURE_CONTRACT_ORDER_OPERATION_OVERNIGHT_CAPTION = "feature_contract_order_operation_overnight_caption"
//夜盘-未设置
let FEATURE_CONTRACT_ORDER_OPERATION_OVERNIGHT_EMPTY = "feature_contract_order_operation_overnight_empty"  
//夜盘-已设置
let FEATURE_CONTRACT_ORDER_OPERATION_OVERNIGHT_SET = "feature_contract_order_operation_overnight_set"
//the order duration
let FEATURE_CONTRACT_ORDER_FIELD_MINI_DURATION = "feature_contract_order_field_common_direction"
//profit--income
let FEATURE_CONTRACT_ORDER_FIELD_MINI_INCOME = "feature_contract_order_field_mini_income"
let FEATURE_CONTRACT_ORDER_FIELD_OTC_MARGIN_RATE = "feature_contract_order_field_otc_margin_rate"
//入金
let FEATURE_C2C_FORM_FIELD_CURRENCY_LABEL = "feature_c2c_form_field_currency_label" 
//let FEATURE_C2C_FORM_FIELD_AMOUNT_LABEL = "feature_c2c_form_field_amount_label"
let FEATURE_C2C_FORM_MERCHANT_RATE_LABEL = "feature_c2c_form_merchant_rate_label" 
let FEATURE_C2C_FORM_MERCHANT_LIMIT_LABEL = "feature_c2c_form_merchant_limit_label" 
let FEATURE_C2C_FORM_MERCHANT_FEE_LABEL = "feature_c2c_form_merchant_fee_label" 
let FEATURE_C2C_ORDER_OPERATION_PAYLINK = "feature_c2c_order_operation_payLink" 
let FEATURE_C2C_FORM_FIELD_SUBMIT_DEPOSIT = "feature_c2c_form_field_submit_deposit"
let FEATURE_C2C_FORM_FIELD_SUBMIT_WITHDRAW = "feature_c2c_form_field_submit_withdraw"
let FEATURE_C2C_MERCHANTLIST_FEATURE_BANK = "feature_c2c_merchantList_feature_bank"
let FEATURE_C2C_MERCHANTLIST_FEATURE_MERCHANT = "feature_c2c_merchantList_feature_merchant"
let FEATURE_C2C_MERCHANTLIST_FEATURE_THIRDPARTY = "feature_c2c_merchantList_feature_thirdParty"
let FEATURE_C2C_MERCHANTLIST_FEATURE_SSL = "feature_c2c_merchantList_feature_ssl"
let FEATURE_C2C_MERCHANTLIST_FEATURE_MAS = "feature_c2c_merchantList_feature_mas"
let FEATURE_C2C_MERCHANTLIST_FEATURE_WALLET = "feature_c2c_merchantList_feature_wallet"
let FEATURE_C2C_FORM_FIELD_ACTUAL = "feature_c2c_form_field_actual"
let FEATURE_C2C_ORDER_OPERATION_PAYED = "feature_c2c_order_operation_payed"
let FEATURE_C2C_ORDER_FIELD_CAUTION = "feature_c2c_order_field_caution"
let FEATURE_C2C_ORDER_FIELD_DEPOSIT_ADDRESS = "feature_c2c_order_field_deposit_address"
let FEATURE_C2C_ORDER_FIELD_DEPOSIT_AMOUNT = "feature_c2c_order_field_deposit_amount"
let FEATURE_C2C_ORDER_FIELD_DEPOSIT_ACCOUNT = "feature_c2c_order_field_deposit_account"
let FEATURE_C2C_ORDER_FIELD_DEPOSIT_REMARK = "feature_c2c_order_field_deposit_remark"
let FEATURE_C2C_ORDER_FIELD_ESTIMATE = "feature_c2c_form_field_estimate"
let FEATURE_C2C_ORDER_FIELD_ACTUAL = "feature_c2c_order_field_actual"
let FEATURE_C2C_ORDER_FIELD_RATE = "feature_c2c_order_field_rate"
let FEATURE_C2C_ORDER_FIELD_FEE = "feature_c2c_order_field_fee"
let FEATURE_C2C_ORDER_FIELD_ORDERNUMBER = "feature_c2c_order_field_orderNumber"
let FEATURE_C2C_ORDER_FIELD_CREATEDAT = "feature_c2c_order_field_createdAt"
let FEATURE_C2C_ORDER_FIELD_ACTUALHINT = "feature_c2c_order_field_actualHint"
let FEATURE_C2C_ORDER_STATUS_BRIEF_DEPOSIT = "feature_c2c_order_status_brief_deposit"
let FEATURE_C2C_ORDER_STATUS_BRIEF_WITHDRAW = "feature_c2c_order_status_brief_withdraw"
let FEATURE_C2C_ORDER_STATUS_DETIAL_BLOCKDEPOSIT = "feature_c2c_order_status_detail_blockDeposit"
let FEATURE_C2C_ORDER_STATUS_DETIAL_BLOCKWITHDRAW = "feature_c2c_order_status_detail_blockWithdraw"
let FEATURE_C2C_ORDER_OPERATION_COPY_ADDRESS = "feature_c2c_order_operation_copy_address"
let SERVICE_DEVICE_COPY_DONE = "service_device_copy_done"
let FEATURE_C2C_ORDER_STATUS_DETAIL_WITHDRAW = "feature_c2c_order_status_detail_withdraw"
let FEATURE_C2C_ORDER_OPERAATION_SUBMIT = "feature_c2c_order_operation_submit"
let FEATURE_C2C_ORDER_OPERATION_CONFIRM = "feature_c2c_order_operation_confirm"
let FEATURE_C2C_ORDER_OPERATION_LOCK = "feature_c2c_order_operation_lock"
let FEATURE_C2C_ORDER_OPERATION_CANCEL = "feature_c2c_order_operation_cancel"
let FEATURE_C2C_ORDER_OPEATAION_PAYLINK = "feature_c2c_order_operation_payLink"
let FEATURE_C2C_ORDER_FIELD_DEPOSIT_ACCOUNTNAME = "feature_c2c_order_field_deposit_accountName"
let FEATURE_C2C_ORDER_FIELD_DEPOSIT_BANKNAME = "feature_c2c_order_field_deposit_bankName"
let FEATURE_C2C_ORDER_FIELD_DEPOSIT_BANKADDRESS = "feature_c2c_order_field_deposit_bankAddress"
let FEATURE_C2C_ORDER_FIELD_DEPOSIT_BANKCODE = "feature_c2c_order_field_deposit_bankCode"
let FEATURE_C2C_ORDER_FIELD_DEPOSIT_SWIFTCODE = "feature_c2c_order_field_deposit_swiftCode"
let FEATURE_C2C_ORDER_FIELD_WITHDRAW_ADDACCOUNT = "feature_c2c_order_field_withdraw_addAccount"
let FEATURE_C2C_ORDER_FIELD_WITHDRAW_ADDRESS = "feature_c2c_order_field_withdraw_address"
let FEATURE_C2C_ORDER_FIELD_WITHDRAW_COUNT = "feature_c2c_order_field_withdraw_count"
let FEATURE_C2C_ORDER_FIELD_WITHDRAW_ACCOUNT = "feature_c2c_order_field_withdraw_account"
let FEATURE_C2C_PAYMENT_TITLE = "feature_c2c_payment_title"
let FEATURE_C2C_PAYMENT_OPERATION_SAVE_BUTTON = "feature_c2c_payment_operation_save_button"
let FEATURE_C2C_PAYMENT_STATUS_BINDED = "feature_c2c_payment_status_binded"
let FEATURE_C2C_PAYMENT_STATUS_UNBINDED = "feature_c2c_payment_status_unbind" 
let FEATURE_USER_MENU_PAYMENT_TITLE = "feature_user_menu_payment_title"
let FEATURE_USER_MENU_CONTRACT_LIST_MENUCAPTION = "feature_user_menu_contract_list_menuCaption"
let FEATURE_USER_INVITE_COPY_LINK = "feature_user_invite_copy_link"
let FEATURE_USER_INVITE_COPY_CODE = "feature_user_invite_copy_code"
let FEATURE_PROFILE_ADVISOR_TITLE = "feature_profile_advisor_title"
let FEATURE_PROFILE_ADVISOR_TITLE_SHORT = "feature_profile_advisor_title_short"
let FEATURE_PROFILE_USER_OP_FOLLOW_CAPTION = "feature_profile_user_op_follow_caption"
let FEATURE_PROFILE_USER_FOLLOWERS = "feature_profile_user_followers"
let FEATURE_PROFILE_USER_LIKES = "feature_profile_user_likes"
let FEATURE_ARTICLE_POST_EXPAND = "feature_article_post_expand"
let FEATURE_ARTICLE_POST_COLLAPSE = "feature_article_post_collapse"
let FEATURE_SESSION_FORM_FIELD_TERMS_TMP = "feature_session_form_field_terms__tmp"
let FEATURE_PROFILE_USER_OP_UNFOLLOW_CAPTION = "feature_profile_user_op_unfollow_caption"
let FEATURE_ARTICLE_CATEGORY_RECOMMEND = "feature_article_category_recommend"
let FEATURE_ARTICLE_CATEGORY_FOLLOWING = "feature_article_category_following"
let FEATURE_CONTRACT_MARKET_COUNTDOWN_CLOSE_IN_PREFIX = "feature_contract_market_countdown_close_in_prefix"
let FEATURE_CONTRACT_MARKET_COUNTDOWN_CLOSE_IN_SUFFIX = "feature_contract_market_countdown_close_in_suffix"
let FEATURE_CONTRACT_MARKET_COUNTDOWN_CLOSED_LABEL = "feature_contract_market_countdown_closed_label"
let FEATURE_CONTRACT_MARKET_COUNTDOWN_OPEN_IN_PREFIX = "feature_contract_market_countdown_open_in_prefix"
let FEATURE_CONTRACT_MARKET_COUNTDOWN_OPEN_IN_SUFFIX = "feature_contract_market_countdown_open_in_suffix"
let FEATURE_CONTRACT_MARKET_OPEN_TIPS = "feature_contract_market_open_day_tips"
let FEATURE_USER_ADVISOR_CARD_TITLE = "feature_user_advisor_card_title"
let FEATURE_USER_ADVISOR_INFO_TITLE = "feature_user_advisor_info_title"
let FEATURE_USER_ADVISOR_INFO_CONTENT = "feature_user_advisor_info_content"
let EXTENSIONS_MESSAGE_BOX_OK = "ui_extensions_message_box_ok"
let FEATURE_HOME_MENU_HELP_LINK = "feature_home_menu_help_link"
let FEATURE_C2C_FORM_FIELD_SUBMIT_KYC_MESSAGE = "feature_c2c_form_field_submit_kyc_message"
let FEATURE_C2C_FORM_FIELD_SUBMIT_KYC_BUTTON = "feature_c2c_form_field_submit_kyc_button"
let FEATURE_PROFILE_USER_OP_UNFOLLOW_CONFIRM = "feature_profile_user_op_unfollow_confirm"
let FEATURE_KYC_FIELD_HANDELD_PLACEHOLDER = "feature_kyc_field_handHeld_placeholder"
let FEATURE_CONTRACT_MARKET_OPEN_DAY_RANGE = "feature_contract_market_open_day_range"
let FEATURE_CONTRACT_MARKET_OPEN_DAY_NEXT_DAY = "feature_contract_market_open_day_next_day"
let FEATURE_CONTRACT_ORDER_BRIEF_OTC_LEVERAGE_TIP = "feature_contract_order_brief_otc_leverage_tip"
let FEATURE_USER_PROFILE_EDIT = "feature_user_profile_edit"
let FEATURE_USER_PROFILE_OPERATION_EDIT = "feature_user_profile_operation_edit"
let FEATURE_USER_PROFILE_OPERATION_EDIT_EMPTY = "feature_user_profile_operation_edit_empty"
let FEATURE_USER_PROFILE_FIELD_AVATAR = "feature_user_profile_field_avatar"
let FEATURE_USER_PROFILE_OPERATION_SUBMIT = "feature_user_profile_operation_submit"
let FEATURE_USER_PROFILE_FIELD_NAME = "feature_user_profile_field_name"
let FEATURE_USER_PROFILE_FIELD_EMAIL = "feature_user_profile_field_email"
let FEATURE_USER_PROFILE_FIELD_PHONE = "feature_user_profile_field_phone"
let FEATURE_USER_PROFILE_FIELD_UID = "feature_user_profile_field_uid"
let FEATURE_USER_PROFILE_FIELD_KYC = "feature_user_profile_field_kyc"
let FEATURE_ARTICLE_COMMENTS_LINK = "feature_article_comments_link"
let FEATURE_ARTICLE_COMMENTS_LIST = "feature_article_comments_list"
let FEATURE_ARTICLE_COMMENT_REPLY_ARTICLE = "feature_article_comment_reply_article"
let FEATURE_ARTICLE_COMMENT_REPLY_SUBMIT = "feature_article_comment_reply_submit"
let FEATURE_ARTICLE_POST_CONTENT_REPLY_PREFIX = "feature_article_post_content_reply_prefix"
let FEATURE_ARTICLE_COMMENTS_EMPTY = "feature_article_comments_empty"
let FEATURE_ARTICLE_COMMENTS_REPLY = "feature_article_comment_reply_comment"
let FEATURE_C2C_ORDER_OPERATION_COPY_ACCOUNT = "feature_c2c_order_operation_copy_account"
let UI_EXTENSIONS_MESSAGE_BOX_CANCEL = "ui_extensions_message_box_cancel"
let FEATURE_TURORIAL_LIST_DESCRIPTION = "feature_tutorial_list_description"
// GO
let FEATURE_TUTORIAL_LIST_START = "feature_tutorial_list_start"
// 新手任务 tips
let FEATURE_TUTORIAL_TIPS_PLACE = "feature_tutorial_tips_place"
// try later
let FEATURE_TUTORIAL_OPERATION_IGNORE = "feature_tutorial_operation_ignore"
//新手任务 success
let FEATURE_TURORIAL_TIPS_COMPLETE_TEXT = "feature_tutorial_tips_complete_text"
//task mission
let FEATURE_USER_MENU_TASK_TITLE = "feature_user_menu_task_title"
let FEATURE_TUTORIAL_TASK_KYC1_STEP_FILL_INFO_TIP = "feature_tutorial_task_kyc1_step_fill_info_tip"
let FEATURE_TUTORIAL_TASK_KYC1_STEP_WAIT_FOR_VALIDATION_TIP = "feature_tutorial_task_kyc1_step_wait_for_validation_tip"
let FEATURE_TUTORIAL_TASK_KYC1_STEP_KYC_PATG_TIP = "feature_tutorial_task_kyc1_step_kyc_page_tip"
let FEATURE_TUTORIAL_TASK_DEPOSIT_STEP_HOME_SCREEN_TIP = "feature_tutorial_task_deposit_step_home_screen_tip"
let FEATURE_TUTORIAL_TASK_DEPOSIT_STEP_OPEN_DEPOSIT_TIP = "feature_tutorial_task_deposit_step_open_deposit_tip"
let FEATURE_TURORIAL_TASK_DEPOSIT_STEP_PLACE_AN_ORDER_TIP = "feature_tutorial_task_deposit_step_place_an_order_tip"
let FEATURE_TUTORIAL_TASK_DEPOSIT_STEP_PAY_IT_COPY_ACCOUNT = "feature_tutorial_task_deposit_step_pay_it_copy_account"
let FEATURE_TUTORIAL_TASK_DEMO_STEP_SWITCH_DEMO_TIP = "feature_tutorial_task_demo_step_switch_demo_tip"
let FEATURE_TUTORIAL_TASK_DEPOSIT_STEP_WAIT_FOR_CONFIRM_TIP = "feature_tutorial_task_deposit_step_wait_for_confirm_tip"
let FEATURE_TUTORIAL_OPERATION_DONE = "feature_tutorial_operation_done"
let FEATURE_TUTORIAL_TASK_DEMO_STEP_PLACE_AN_ORDER_SHORT = "feature_tutorial_task_demo_step_place_an_order_short"
let FEATURE_TUTORIAL_TASK_DEMO_STEP_PLACE_AN_ORDER_LONG = "feature_tutorial_task_demo_step_place_an_order_long"
let FEATURE_SPOT_CONVETT_LINK = "feature_spot_convert_link"
let FEATURE_SPOT_TRADE_TITLE = "feature_spot_trade_title"
let FEATURE_SPOT_CONVERT_SPEND = "feature_spot_convert_spend"
let FEATURE_SPOT_CONVERT_RECEIVE = "feature_spot_convert_receive"
let FEATURE_SPOT_CONVERT_RATE = "feature_spot_convert_rate"
let FEATURE_SPOT_CONVERT_FEE = "feature_spot_convert_fee"
let FEATURE_SPOT_CONVERT_OPERATION_SUBMIT = "feature_spot_convert_operation_submit"
let FEATURE_SPOT_ORDERS_ITEM_FIELD_SPEND = "feature_spot_orders_item_field_spend"
let FEATURE_SPOT_ORDERS_ITEM_FIELD_FEE = "feature_spot_orders_item_field_fee"
let FEATURE_SPOT_ORDERS_ITEM_FIELD_RECEIVE = "feature_spot_orders_item_field_receive"
let FEATURE_SPOT_CONVERT_RESULT_DONE_STATUS = "feature_spot_convert_result_done_status"
let FEATURE_SPOT_CONVERT_RESULT_DONE_TIP = "feature_spot_convert_result_done_tip"
let FEATURE_SPOT_CONVERT_BALANCE = "feature_spot_convert_balance"
let FEATURE_CONTRACT_STATISTICS_TITLE = "feature_contract_statistics_title"
let FEATURE_CONTRACT_STATISTICS_TODAY_VOLUME_LABEL = "feature_contract_statistics_today_volume_label"
let FEATURE_CONTRACT_STATISTICS_TODAY_COUNT_LABEL = "feature_contract_statistics_today_count_label"
let FEATURE_CONTRACT_STATISTICS_TODAY_TITLE = "feature_contract_statistics_today_title"
let FEATURE_CONTRACT_STATISTIC_TODAY_HELP = "feature_contract_statistics_today_help"
let FEATURE_CONTRACT_STATISTIC_PENDING_VOLUME_LABEL = "feature_contract_statistics_pending_volume_label"
let FEATURE_CONTRACT_STATISTICS_PENDING_COUNT_LABEL = "feature_contract_statistics_pending_count_label"
let FEATURE_C2C_FORM_FIELD_AMOUNT_WITHDRAW = "feature_c2c_form_field_amount_withdraw"
let FEATURE_C2C_FORM_FIELD_AMOUNT_DEPOSIT = "feature_c2c_form_field_amount_deposit"
let FEATURE_C2C_FORM_FIELD_SUBMIT_CONFIRM = "feature_c2c_form_field_submit_confirm"
let FEATURE_SPOT_WALLET_ENABLE_BUTTOON = "feature_spot_wallet_enable_button"
let FEATURE_SPOT_WALLET_ENABLE_CONFIRM = "feature_spot_wallet_enable_confirm"
let FEATURE_SPOT_WALLET_DISABLE_BUTTON = "feature_spot_wallet_disable_button"
let FEATURE_SPOT_WALLET_DISABLE_CONFIRM = "feature_spot_wallet_disable_confirm"
let UI_INPUT_PLACEHOLDER_AMOUNT = "ui_input_placeholder_amount"
let FEATURE_TUTORIAL_TASK_KYC1_STEP_OPEN_EDIT_PAGE_TIP = "feature_tutorial_task_kyc1_step_open_edit_page_tip"
let FEATURE_SPOT_ORDERS_ITEM_FIELD_ORDER_NUMBER = "feature_spot_orders_item_field_order_number"
let FEATURE_ARTICLE_COMMENT_DELETE_LABEL = "feature_article_comment_delete_label"

//DeFi

let FEATURE_DEFI_PROJECT_LIST_OPERATION_VIEW = "feature_defi_project_list_operation_view"

let FEATURE_DEFI_LIST_TITLE = "feature_defi_list_title"
//"Easiest Way To Stake Crypto (Up To 100% Interest)"
let FEATURE_DEFI_LIST_SUBTITLE = "feature_defi_list_subtitle"

let FEATURE_DEFI_PROJECT_LIST_OPERATION_CLOSED = "feature_defi_project_list_operation_closed"

let FEATURE_DEFI_PROJECT_EARNINGS_APY = "feature_defi_project_earnings_apy"
    
let FEATURE_DEFI_PROJECT_EARNINGS_FEE = "feature_defi_project_earnings_fee"

let FEATURE_DEFI_PROJECT_EARNGINGS_VALUE = "feature_defi_project_earnings_value"
    
let FEATURE_DEFI_PROJECT_EARNINGS_TIME = "feature_defi_project_earnings_time"
 
let FEATURE_DEFI_PROJECT_FIELD_TOTAL_STAKE = "feature_defi_project_field_total_stake"
 
let FEATURE_DEFI_PROJECT_FIELD_TOTAL_EARNINGS = "feature_defi_project_field_total_earnings"
 
let FEATURE_DEFI_PROJECT_FIELD_EARNINGS_LIST = "feature_defi_project_field_earnings_list"
    
let FEATURE_DEFI_PROJECT_FIELD_YESTERDAY_S_EARNINGS = "feature_defi_project_field_yesterday_s_earnings"
    
let FEATURE_DEFI_PROJECT_FIELD_END_IN = "feature_defi_project_field_end_in"

let FEATURE_DEFI_PROJECT_FIELD_END_AT = "feature_defi_project_field_end_at"

let FEATURE_DEFI_PROJECT_FIELD_BEGIN_IN = "feature_defi_project_field_begin_in"
 
let FEATURE_DEFI_PROJECT_FIELD_BEGIN_AT = "feature_defi_project_field_begin_at"

let FEATURE_DEFI_PROJECT_FIELD_PERIOD = "feature_defi_project_field_period"

let FEATURE_DEFI_PROJECT_FIELD_PHASE = "feature_defi_project_field_phase"


let FEATURE_DEFI_PROJECT_FIELD_MIN_STAKE = "feature_defi_project_field_min_stake"

let FEATURE_DEFI_PROJECT_FIELD_YESTERDAY_APY = "feature_defi_project_field_yesterday_apy"

let FEATURE_DEFI_PROJECT_FORM_SUBMIT = "feature_defi_project_form_submit"

//"Staking Amount"
let FEATURE_DEFI_PROJECT_FORM_STAKE = "feature_defi_project_form_stake"
//    "Minimum Amount \(value) \(unit)"
let FEATURE_DEFI_PROJECT_FORM_MIN_STAKE = "feature_defi_project_form_min_stake"
//"https://help.coinandcoin.io/en/articles/4459037-coin-coin-defi-staking-participation-agreement"
let FEATURE_DEFI_PROJECT_FORM_TERMS_LINK = "feature_defi_project_form_terms_link"
//"Coin&Coin DeFi Staking Participation Agreement"
let FEATURE_DEFI_PROJECT_FORM_TERMS_NAME = "feature_defi_project_form_terms_name"
//"I have read and accepted "
let FEATURE_DEFI_PROJECT_FORM_TERMS_PREFIX = "feature_defi_project_form_terms_prefix"

let FEATURE_DEFI_PROJECT_FORM_TERMS_SUFFIX = "feature_defi_project_form_terms_suffix"
//"Confirm to stake \(value) \(unit) founds?"
let FEATURE_DEFI_PROJECT_FORM_CONFIRM_TITLE = "feature_defi_project_form_confirm_title"
//"Process"
let FEATURE_DEFI_PROJECT_PROCESS_TITLE = "feature_defi_project_process_title"
//"Principle and interest to the account"
let FEATURE_DEFI_PROJECT_PROCESS_TIME_END = "feature_defi_project_process_time_end"
//"Product Close"
let FEATURE_DEFI_PROJECT_PROCESS_TIME_STOP = "feature_defi_project_process_time_stop"
//"Start Staking"
let FEATURE_DEFI_PROJECT_PROCESS_TIME_START = "feature_defi_project_process_time_start"

let FEATURE_DEFI_PROJECT_PROCESS_TIME_BEGIN = "feature_defi_project_process_time_begin"
//"Redemption"
let FEATURE_DEFI_PROJECT_PROCESS_PERIOD_FROSTLESS = "feature_defi_project_process_period_frostless"
//"Staking Period: Stake the digital asset, the interest starts the next day"
let FEATURE_DEFI_PROJECT_PROCESS_PERIOD_ATTENDING = "feature_defi_project_process_period_attending"


//Buy In One Click
let FEATURE_DEFI_LIST_EASY_TITLE = "feature_defi_list_easy_title"
//Higher Yield
let FEATURE_DEFI_LIST_HIGH_YIELD_TITLE = "feature_defi_list_high_yield_title"
//No GAS Fee
let FEATURE_DEFI_LIST_FREE_GAS_TITLE = "feature_defi_list_free_gas_title"

let UIEXTENSIONS_ORDER_HISTORY_DESCRIPTION = "ui_extensions_order_history_description"
//Unopened
let FEATURE_DEFI_PROJECT_FIELD_UNOPEN = "feature_defi_project_field_unopen"
//Finished
let FEATURE_DEFI_PROJECT_FIELD_FINISHED = "feature_defi_project_field_finished"
//"APR"
let FEATURE_DEFI_PROJECT_FIELD_APR = "feature_defi_project_field_apr"
//"Estimated APR"
let FEATURE_DEFI_PROJECT_FIELD_ESTIMATED_APR = "feature_defi_project_field_estimated_apr"


