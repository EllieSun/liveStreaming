//
//  GlobalConstansts.swift
//  BaseComponent
//
//  Created by zhang qiang on 2018/11/21.
//  Copyright © 2018年 张强. All rights reserved.
//

import Foundation
import UIKit
//import DeviceKit

///  屏幕宽度
public let ScreenWidth : CGFloat = {
    return UIScreen.main.bounds.width
}()

/// 屏幕高度
public let ScreenHeight : CGFloat = {
    return UIScreen.main.bounds.height
}()

/// 当前机型是否是iPhoneX
public let IphoneXSeries : Bool = {
    return Device.realDevice(from: Device.current).isOneOf(Device.allXSeriesDevices)
}()

public let IphoneXorXR : Bool = {
    return Device.realDevice(from: Device.current) == Device.iPhoneX
    || Device.realDevice(from: Device.current) == Device.iPhoneXR
}()

/// 当前机型是否是iPhone
public let IphoneDevice : Bool = {
    return Device.realDevice(from: Device.current).isOneOf(Device.allPhones)
}()

/// 当前机型是否是iPad
public let IPadDevice : Bool = {
    return Device.realDevice(from: Device.current).isOneOf(Device.allPads)
}()

/// 屏幕顶部额外高度， iPhoneX 是24 其他为0
public let ScreenTopExtraOffset : CGFloat = {
    return IphoneXSeries ? 24.0 : 0.0
}()

/// 屏幕第部额外高度， iPhoneX 是34 其他为0
public let ScreenBottomExtraOffset : CGFloat = {
    return IphoneXSeries ? 34.0 : 0.0
}()


/// 导航栏高度
public let NavigationBarHeight : CGFloat = 44.0


/// 状态栏高度
public let StatusBarHeight : CGFloat = {
    return IphoneXSeries ? 44.0 : 20.0
}()


/// tab bar 高度
public let TabBarHeight : CGFloat = {
    return IphoneXSeries ? 83.0 : 49.0
}()

/// 屏幕比
public let ScreenScale : CGFloat = {
    return ScreenWidth / 375.0
}()

/////  app 主要子视图距离屏幕边距
//public let MainSubviewHorMargin = 20.0
//
///// app 主要页面背景颜色
//public let MainPageBackgroundColor = UIColor.init(hex: 0xFFFFFF)
//
//
///// app 子视图主要背景颜色
//public let MainSubviewBackgroundColor = UIColor.white
//
//
///// app 主要半透明背景颜色
//public let MainTranslucentBackgroundColor = UIColor.init(hex: 0x000000, andAlpha: 0.6)
//
///// app 黄色主色
//public let MainYellowColor : UIColor = {
//    return UIColor.init(hex: 0xff8a00)
//}()
//
///// app 主要分割线颜色
//public let MainSeparatorLineColor : UIColor = {
//    return UIColor.init(hex: 0xdfdfdf)
//}()
//
//
/// app 主要 不可用状态下 文字和按钮颜色
public let DDCMainFontColor : UIColor = {
    return DDCColor.colorWithHex(RGB: 0x1a1a1a)
}()
//
//
//public let Main0x333333Color: UIColor = UIColor(hex: 0x333333)
//
//
public let App_Version: String = Bundle.main.infoDictionary!["CFBundleShortVersionString"]! as! String


public let appStoreURL: String = "https://itunes.apple.com/cn/app/daydaycook-%E6%97%A5%E6%97%A5%E7%85%AE/id1060973985?mt=8"

/// 是否启用阿里云压缩参数
public let openAliResizeOption: Bool = false
/// 云图片压缩 缩放系数
public let imageResizeScale: CGFloat = UIScreen.main.scale
/// 云图 若开启压缩, 默认压缩质量
public let imageQuality: Int = 80

/// 第三方key

private let iPhoneUmengShareAppKeyRelease = "5634d3bbe0f55ad04e000182"
private let iPhoneUmengShareAppKeyTest = "5d2fd039570df3d8550005e0"

private let iPadUmengShareAppKeyRelease = "576144ff67e58e831f0006a5"
private let iPadUmengShareAppKeyTest = "5d2fd0cb570df3daac000604"


public var umengShareAppKey: String {
    get {
        #if DEBUG
        return IphoneDevice ? iPhoneUmengShareAppKeyTest : iPadUmengShareAppKeyTest
        #endif
        return IphoneDevice ? iPhoneUmengShareAppKeyRelease : iPadUmengShareAppKeyRelease
    }
}

public let redirectURL = "http://www.daydaycook.com.cn"

/// 新浪
public let sinaAppKey = "1529453946"
public let sinaAppSecret = "3105e0e6880a6e501c7566c2b1ab448d"

/// 微信
public let  wechatAppKey = "wxbb546ca79af92e3c"
public let  wechatAppSecret = "47a21adcffc2dd7ec593860955f8fb82"

/// 小程序
public let  wechatMiniProgramId = "gh_9dec58218ad1"
public let  wechatMiniProgramId_2 = "gh_cb1492baa1e1" // 拼桌菜

/// QQ
public let  qqAppKey = "1104874083"
public let  qqAppSecret = "HGlpPjOdk8XW7yxm"

// public let  fbAppId = "1752048405074492"

/// AppID
public let  appId = "1060973985"
