//
//  configure.swift
//  Ask me
//
//  Created by Apple on 16/6/6.
//  Copyright © 2016年 NJU. All rights reserved.
//

import Foundation

import UIKit



//屏幕尺寸声明
public let NavigationH:CGFloat = 64
public let SCREEN_WIDTH:CGFloat = UIScreen.mainScreen().bounds.size.width
public let SCREEN_HEIGHT:CGFloat = UIScreen.mainScreen().bounds.size.height
public let MainBounds: CGRect = UIScreen.mainScreen().bounds

//app中使用的字体
public let ThinFont:String = "PingFangSC-Thin"
public let LightFont:String = "PingFangSC-Light"
public let RegularFont:String = "PingFangSC-Regular"

//文字颜色，背景颜色
public let CustomBarTintColor:UIColor = UIColor.init(red: 136/255.0,green: 180/255.0,blue: 189/255.0,alpha: 1.0)
public let MainTitleColor:UIColor = UIColor.init(red: 109/255.0, green: 109/255.0, blue: 109/255.0, alpha: 1.0)
public let SubTitleColor:UIColor = UIColor.init(red: 153/255.0, green: 153/255.0, blue: 153/255.0, alpha: 1.0)
public let LightLineColor:UIColor = UIColor.init(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1.0)
public let GrayLineColor:UIColor = UIColor.init(red: 216/255.0, green: 216/255.0, blue: 216/255.0, alpha: 1.0)
public let TitleGrayColor:UIColor = UIColor.init(red: 167/255.0, green: 167/255.0, blue: 167/255.0, alpha: 1.0)
public let PlaceHolderColor:UIColor = UIColor.init(red: 182/255.0, green: 182/255.0, blue: 182/255.0, alpha: 1.0)
//view灰色背景
public let ViewGrayBackGroundColor:UIColor = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
//文字半黑色
public let HalfBlackTitleColor:UIColor = UIColor.init(red: 149/255.0, green: 149/255.0, blue:149/255.0, alpha: 1.0)

//用户性别
public var UserSex: String = "汉子"

public let MyIntroduce: String = "你好，这是一个由yvonneye和blackzhou一同开发的简易APP~"

public let GitHubURL: String = "https://github.com/yvonneye/Ask_me"

public let UserFriendName = ["yvonne","肉卷","宁姐","梅梅","大碗","小黑","车神"]

public let UserFriendWord = ["我","室友1","室友2","室友3","隔壁女神","好兄弟","好兄弟"]