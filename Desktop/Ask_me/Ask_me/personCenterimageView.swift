//
//  personCenterimageView.swift
//  Ask me
//
//  Created by Apple on 16/7/7.
//  Copyright © 2016年 NJU. All rights reserved.
//

import Foundation
import UIKit

class personCenterimageView: UIView {
    var headerButton = UIButton()
    //头像
    var headImage = UIImage(named: "headerImage") {
        didSet {
            let image = ImageOperationCenter.HeaderImageOperation(headImage!, borderColor: UIColor.whiteColor(), borderWidth: 1.0)
            headerButton.setImage(image, forState: .Normal)
            headerButton.setImage(image, forState: .Highlighted)
            headerButton.contentMode = .ScaleAspectFit
        }
    }

    private var settingBtn = UIButton()
    
    var selectSexBtn = UIButton()
    
    //点击头像按钮
    var clickHeadImage: ( () -> () )?
    
    //点击设置按钮
    var clickSettingBtn: ( () -> () )?
    
    //点击设置性别
    var clickSelectSex: ( () -> () )?
    var nameLabel = UILabel()
    
    var signiture = "唯有美食与爱不可辜负" {
        didSet {
            signLabel.text = signiture
            signLabel.sizeToFit()
        }
    }
    var signLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clearColor()
        buildUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //build UI
    func buildUI() {
        //头像
        headerButton = UIButton.init(frame: CGRectMake(SCREEN_WIDTH/2 - 30, 50, 60, 60))
        let image = ImageOperationCenter.HeaderImageOperation(headImage!, borderColor: UIColor.whiteColor(), borderWidth: 2.0)
        headerButton.setImage(image, forState: .Normal)
        headerButton.setImage(image, forState: .Highlighted)
        headerButton.imageView?.layer.cornerRadius = 30.0
        headerButton.layer.masksToBounds = true
        headerButton.clipsToBounds = true
        headerButton.addTarget(self, action: "changeMyHeaderImage", forControlEvents: UIControlEvents.TouchUpInside)
        addSubview(headerButton)
        
        //用户名
        nameLabel = UILabel.init(frame: CGRectMake(0, CGRectGetMaxY(headerButton.frame) + 13, SCREEN_WIDTH, 15))
        nameLabel.font = UIFont(name: RegularFont,size: 15.0)
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.text = "yvonne"
        nameLabel.textAlignment  = .Center
        addSubview(nameLabel)
        
        //签名
        signLabel.text = signiture
        signLabel.textColor = UIColor.whiteColor()
        signLabel.font = UIFont(name: LightFont,size: 13.0)
        signLabel.sizeToFit()
        signLabel.frame = CGRectMake(SCREEN_WIDTH/2 - signLabel.frame.width/2, CGRectGetMaxY(nameLabel.frame) + 13, signLabel.frame.width, signLabel.frame.height)
        addSubview(signLabel)
        
        //设置按钮
        settingBtn = UIButton.init(frame: CGRectMake(SCREEN_WIDTH - 20 - 24, 30, 24, 24))
        settingBtn.setImage(UIImage(named: "iconfont-setting"), forState: .Normal)
        settingBtn.addTarget(self, action: "clickSettingBotton", forControlEvents: .TouchUpInside)
        addSubview(settingBtn)
        
        //选择性别
        selectSexBtn.frame = CGRectMake(20, 30, 24, 24)
        if UserSex.containsString("汉子") {
            selectSexBtn.setImage(UIImage(named: "iconfont-man"), forState: .Normal)
        } else {
            selectSexBtn.setImage(UIImage(named: "iconfont-woman"), forState: .Normal)
        }
        selectSexBtn.addTarget(self, action: "clickSelectSexBtn", forControlEvents: .TouchUpInside)
        addSubview(selectSexBtn)
    }
    
    func changeMyHeaderImage() {
        if clickHeadImage != nil {
            print("更换头像")
            clickHeadImage!()
        }
    }
    func clickSettingBotton() {
        if clickSettingBtn != nil {
            clickSettingBtn!()
        }
    }
    func clickSelectSexBtn() {
        if clickSelectSex != nil {
            clickSelectSex!()
        }
    }
}