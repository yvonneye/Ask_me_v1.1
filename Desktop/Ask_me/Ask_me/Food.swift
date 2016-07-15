//
//  Food.swift
//  Ask_me
//
//  Created by Apple on 16/7/11.
//  Copyright © 2016年 NJU. All rights reserved.
//

import UIKit

class Food: NSObject {
    
    var name:NSString
    var rate:NSString
    var url:NSString
    
    init(name:NSString,rate:NSString,url:NSString) {
        self.name = name
        self.rate = rate
        self.url = url
    }
}
