//
//  settingViewController.swift
//  Ask me
//
//  Created by Apple on 16/7/7.
//  Copyright © 2016年 NJU. All rights reserved.
//

import Foundation
import UIKit

class settingViewController: BaseViewController ,UITableViewDelegate,UITableViewDataSource {
    private var showTableView: UITableView?
    
    /// 关于Boo
    private var aboutView = UIView()
    
    private let cellID = "SettingCell"
    
    private let tableViewData = ["分享我的APP","GitHub:点击查看我的GitHub","关于作者"]
    private let iconData = [UIImage(named: "Share_fire"),UIImage(named: "iconfont-github"),UIImage(named: "iconfont-ren")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1.0)
        
        buildTableView()
        
    }
    
    func buildTableView() {
        showTableView = UITableView(frame: CGRectMake(10, 0, SCREEN_WIDTH, CGFloat(tableViewData.count * 50)), style: .Plain)
        showTableView?.delegate = self
        showTableView?.dataSource = self
        view.addSubview(showTableView!)
    }
    
    //MARK: UITableView Delegate / DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellID)
        }
        
        cell?.imageView?.image = iconData[indexPath.row]
        cell?.textLabel?.text = tableViewData[indexPath.row]
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        //打开GitHub*****************
        if indexPath.row == 0 {
            TipView.showMessage("不好意思，没有做微信分享(⊙o⊙)")
        }
        else if indexPath.row == 1 {
            UIApplication.sharedApplication().openURL(NSURL(string: GitHubURL)!)
        }
            
            //关于作者
        else if indexPath.row == 2 {
            buildAboutMeView()
        }
    }
    
    
    //MARK: 弹出关于作者
    func buildAboutMeView() {
        aboutView = UIView(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
        aboutView.backgroundColor = UIColor.init(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
        //给view添加tap手势
        let tapGesture = UITapGestureRecognizer(target: self, action: "closeAboutView")
        aboutView.addGestureRecognizer(tapGesture)
        view.addSubview(aboutView)
        
        //
        let tipsLabel = CMLabel(frame: CGRectMake(20, 200, SCREEN_WIDTH - 40, 100), title: MyIntroduce, font: UIFont(name: LightFont, size: 20.0)!, textColor: UIColor.blackColor(), lineSpacing: 4.0, textEdgeInsets: UIEdgeInsetsZero)
        aboutView.addSubview(tipsLabel)
        
    }
    
    //关闭 关于作者 界面
    func closeAboutView() {
        
        self.aboutView.removeFromSuperview()
    }

}