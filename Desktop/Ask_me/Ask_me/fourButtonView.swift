//
//  fourButtonView.swift
//  Ask me
//
//  Created by Apple on 16/7/7.
//  Copyright © 2016年 NJU. All rights reserved.
//

import Foundation
import UIKit

enum fourButtontype: Int {
    case OrderButtonClick = 110
    case FriendButtonClick = 111
    case PointButtonClick = 112
   // case TeamButtonClick = 113
}

class fourBottonView:UIView {
    private var orderBtn: UIButton?
    private var friendBtn: UIButton?
    private var pointBtn: UIButton?
   // private var teamBtn: UIButton?
    
    //点击事件处理
    var fourBottonClickCenter: ( (Int) -> () )?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildUI() {
        var orginX = CGFloat(145/5)
        orderBtn = UIButton(frame: CGRectMake(orginX,18,52,80))
        orderBtn?.tag = fourButtontype.OrderButtonClick.rawValue
        orderBtn?.addTarget(self, action: "clickCenter:", forControlEvents: .TouchUpInside)
        orderBtn?.setImage(UIImage(named: "button_order"), forState: .Normal)
        orderBtn?.setImage(UIImage(named: "button_order"), forState: .Highlighted)
        addSubview(orderBtn!)
        orginX += 52+82
        
        friendBtn = UIButton(frame: CGRectMake(orginX,18,52,80))
        friendBtn?.tag = fourButtontype.FriendButtonClick.rawValue
        friendBtn?.addTarget(self, action: "clickCenter:", forControlEvents: .TouchUpInside)
        friendBtn?.setImage(UIImage(named: "button_friend"), forState: .Normal)
        friendBtn?.setImage(UIImage(named: "button_friend"), forState: .Highlighted)
        addSubview(friendBtn!)
        orginX += 52+82
        
        pointBtn = UIButton(frame: CGRectMake(orginX,18,52,80))
        pointBtn?.tag = fourButtontype.PointButtonClick.rawValue
        pointBtn?.addTarget(self, action: "clickCenter:", forControlEvents: .TouchUpInside)
        pointBtn?.setImage(UIImage(named: "button_point"), forState: .Normal)
        pointBtn?.setImage(UIImage(named: "button_point"), forState: .Highlighted)
        addSubview(pointBtn!)
//        orginX += 52+82
        
//        teamBtn = UIButton(frame: CGRectMake(orginX,18,52,80))
//        teamBtn?.tag = fourButtontype.TeamButtonClick.rawValue
//        teamBtn?.addTarget(self, action: "clickCenter", forControlEvents: .TouchUpInside)
//        teamBtn?.setImage(UIImage(named: "button_team"), forState: .Normal)
//        teamBtn?.setImage(UIImage(named: "button_team"), forState: .Highlighted)
//        addSubview(teamBtn!)
    }
    
    func clickCenter(sender: UIButton) {
        if fourBottonClickCenter != nil {
            fourBottonClickCenter!(sender.tag)
        }
    }
}

