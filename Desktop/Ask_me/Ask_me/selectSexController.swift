//
//  selectSexController.swift
//  Ask me
//
//  Created by Apple on 16/7/7.
//  Copyright © 2016年 NJU. All rights reserved.
//

import Foundation
import UIKit

class selectSexController: BaseViewController {
    
    private var tipLabel = UILabel()
    
    private var manButton = UIButton()
    private var womanButton = UIButton()
    
    private var completeBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        self.title = "个性化"
        
        buildUI()
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserSex.containsString("汉子") {
            manButton.selected = true
            womanButton.selected = false
        }else {
            manButton.selected = false
            womanButton.selected = true
        }
    }
    
    func buildUI() {
        tipLabel = UILabel(frame: CGRectZero)
        tipLabel.text = "请问你的性别是？"
        tipLabel.textAlignment = .Center
        tipLabel.font = UIFont(name: LightFont, size: 16.0)
        tipLabel.textColor = CustomBarTintColor
        tipLabel.numberOfLines = 0
        tipLabel.sizeToFit()
        tipLabel.frame = CGRectMake(0, 30, SCREEN_WIDTH, 45)
        view.addSubview(tipLabel)
        
        manButton.frame = CGRectMake(30, 120, 102, 150)
        manButton.tag = 110
        manButton.setImage(UIImage(named: "Man_selected"), forState: .Selected)
        manButton.setImage(UIImage(named: "Man_unselected"), forState: .Normal)
        manButton.adjustsImageWhenHighlighted = false
        manButton.selected = true
        manButton.addTarget(self, action: "clickCenter:", forControlEvents: .TouchUpInside)
        view.addSubview(manButton)
        
        womanButton.frame = CGRectMake(SCREEN_WIDTH - 30 - 102, 120, 102, 150)
        womanButton.tag = 111
        womanButton.setImage(UIImage(named: "Woman_selected"), forState: .Selected)
        womanButton.setImage(UIImage(named: "Woman_unselected"), forState: .Normal)
        womanButton.adjustsImageWhenHighlighted = false
        womanButton.addTarget(self, action: "clickCenter:", forControlEvents: .TouchUpInside)
        view.addSubview(womanButton)
        
        
        completeBtn.layer.cornerRadius = 17.0
        completeBtn.backgroundColor = CustomBarTintColor
        completeBtn.setTitle("完成", forState: .Normal)
        completeBtn.titleLabel?.font = UIFont(name: LightFont, size: 20.0)
        completeBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        completeBtn.sizeToFit()
        completeBtn.frame = CGRectMake(SCREEN_WIDTH/2 - 158/2 - completeBtn.frame.width/2, SCREEN_HEIGHT - 64 - completeBtn.frame.height - 24 - 10, completeBtn.frame.width + 158,  completeBtn.frame
            .height)
        completeBtn.addTarget(self, action: "clickComplete", forControlEvents: .TouchUpInside)
        view.addSubview(completeBtn)
    }
    
    func clickCenter(sender: UIButton) {
        if sender.tag == 110 {
            UserSex = "汉子"
            
            womanButton.selected = false
            manButton.selected = true
            
        }else {
            UserSex = "妹子"
            
            manButton.selected = false
            womanButton.selected = true
        }
    }
    
    func clickComplete() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

