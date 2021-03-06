//
//  friendViewController.swift
//  Ask me
//
//  Created by Apple on 16/7/7.
//  Copyright © 2016年 NJU. All rights reserved.
//

import Foundation
import UIKit

class friendViewController: BaseViewController,UITableViewDelegate, UITableViewDataSource{
    private var showTableView: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "好基友"
        
        
        buildTableView()
    }
    
    
    
    func buildTableView() {
        showTableView = UITableView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64), style: .Plain)
        showTableView?.delegate = self
        showTableView?.dataSource = self
        showTableView?.separatorStyle = .None
        view.addSubview(showTableView!)
    }
    
    
    
    
    //MARK: UITableviewDelegate uitableviewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserFriendName.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("showTableViewCell")
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "showTableViewCell")
            cell?.selectionStyle = .None
            cell?.textLabel?.font = UIFont(name: LightFont, size: 15.0)
            cell?.textLabel?.textColor = MainTitleColor
            cell?.detailTextLabel?.font = UIFont(name: ThinFont, size: 13.0)
            cell?.detailTextLabel?.textColor = SubTitleColor
            cell?.addSubview(DrawLine.createLine(DrawType.DottedLine, lineRect: CGRectMake(0, 70 - 0.5, SCREEN_WIDTH, 0.5)))
        }
        cell?.imageView?.image = ImageOperationCenter.HeaderImageOperation(UIImage(named: "headerImage")!, borderColor: CustomBarTintColor, borderWidth: 1.0)
        cell?.textLabel?.text = UserFriendName[indexPath.row]
        cell?.detailTextLabel?.text = UserFriendWord[indexPath.row]
        
        return cell!
    }

    
}
