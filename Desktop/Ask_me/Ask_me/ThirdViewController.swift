//
//  ThirdViewController.swift
//  Ask_me
//
//  Created by Apple on 16/7/11.
//  Copyright © 2016年 NJU. All rights reserved.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    private var topView = personCenterimageView()
    
    private var headerImgView = UIImageView()
    
    private var backImgView = UIImageView()
    
//    private var titleView: TitleView?
    
    private var collectionHeadView = UIView()
    
    //    private var showCollectionView = UICollectionView?
    
    //    private var collectionViewMode = ShowCollectionViewType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
//        self.navigationItem.title = "test for load"
//        self.title = "fff"
      //  self.view
        buildCollectionHeaderView()
        //        self.dismissViewControllerAnimated(true, completion: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.title = "test for appear"
        if UserSex.containsString("汉子") {
            topView.selectSexBtn.setImage(UIImage(named: "iconfont-man"), forState: .Normal)
        } else {
            topView.selectSexBtn.setImage(UIImage(named: "iconfont-woman"), forState: .Normal)
        }
        
    }
    
    //build collectionheaderView
    func buildCollectionHeaderView() {
        collectionHeadView = UIView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, 385))
        collectionHeadView.backgroundColor = UIColor.clearColor()
        
//        view.addSubview(topView)
//        
//        headerImgView.frame = CGRectMake(SCREEN_WIDTH/2 - 30, 50, 60, 60)
//        headerImgView.image = UIImage(named: "headerImage")
//        view.addSubview(headerImgView)
        
        backImgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 230)
        backImgView.image = UIImage(named: "PersonCenterbackImage")
        view.addSubview(backImgView)
        
        topView = personCenterimageView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, 230))
    
        //更换头像
        topView.clickHeadImage = { () -> () in
            let alertController = UIAlertController(title: "更换头像",message: "选取一张喜欢的图片", preferredStyle: .ActionSheet)
            let action_TakingPhotos = UIAlertAction(title: "拍照",style: .Default, handler: { (alertAction) -> Void in
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
                    imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
                    self.presentViewController(imagePicker, animated: true, completion: nil)
                } else {
                    TipView.showMessage("请换一个有摄像头的手机")
                }
            } )
            
            let action_ReadFromPhotos = UIAlertAction(title: "从相册取",style: .Default,handler:{ (alertAction) -> Void in
                let showMeVC = ShowMeViewController.init(leftTitle: "取消", rightTitle: "")
                let nav = BaseNavigationController(rootViewController: showMeVC)
                self.presentViewController(nav, animated: true, completion: nil)
            } )
            
            let cancelAction = UIAlertAction(title: "不换啦",style: UIAlertActionStyle.Cancel, handler:{ (alertAction) -> Void in
                alertController.dismissViewControllerAnimated(true, completion: nil)
            } )
            
            alertController.addAction(action_ReadFromPhotos)
            alertController.addAction(action_TakingPhotos)
            alertController.addAction(cancelAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        topView.clickSettingBtn = { () -> () in
            let settingVC = settingViewController.init(leftTitle: "",rightTitle: "")
            self.navigationController?.pushViewController(settingVC, animated: true)
        }
        topView.clickSelectSex = { () -> () in
            let selectSexVC = selectSexController.init(leftTitle: "",rightTitle: "")
            let nav = BaseNavigationController(rootViewController: selectSexVC)
            self.navigationController?.presentViewController(nav, animated: true, completion: nil)
        }
        view.addSubview(topView)
        
        //订单 好友 积分
        let fourBtnView = fourBottonView(frame: CGRectMake(0, 230, SCREEN_WIDTH, 111))
        //fourButtonView 点击事件处理
        fourBtnView.fourBottonClickCenter = { (ButtonTag: Int) -> () in
            
            switch ButtonTag {
            case fourButtontype.OrderButtonClick.rawValue:
                TipView.showMessage("暂时没有订单~")
                break
            case fourButtontype.FriendButtonClick.rawValue:
                let friendVC = friendViewController.init(leftTitle:"Back",rightTitle: "")
                let nav = BaseNavigationController(rootViewController: friendVC)
                self.presentViewController(nav, animated: true, completion: nil)
                break
            case fourButtontype.PointButtonClick.rawValue:
                TipView.showMessage("你的积分还有100")
                break
            default:
                break
            }
        }
        view.addSubview(fourBtnView)
    }
}