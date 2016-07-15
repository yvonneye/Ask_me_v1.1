//
//  BannerView.swift
//  Ask me
//
//  Created by Apple on 16/6/6.
//  Copyright © 2016年 NJU. All rights reserved.
//

import Foundation

import UIKit



//轮播图每次滚动距离
private let bannerWidth = SCREEN_WIDTH


class  BannerView: UIView,UIScrollViewDelegate {
    var showScrollerView = UIScrollView()
    var bannerArray = NSMutableArray()
    
    let address :[String] = ["http://a1.qpic.cn/psb?/V13YH7W402XUsU/KZhjCLn9YkGGCpyBlXHb*rUAfMyII7X.FFaAJbyxIxk!/b/dAsBAAAAAAAA&bo=LAIgAwAAAAAFByk!&rf=viewer_4","http://a1.qpic.cn/psb?/V13YH7W402XUsU/xVyy0gn3G3a9OCS4lFcCL59gXVWq8RZ51ZZH9yXAzjo!/b/dOEAAAAAAAAA&bo=LAIgAwAAAAAFAC4!&rf=viewer_4","http://a3.qpic.cn/psb?/V13YH7W402XUsU/cAilQ23AcaU31dLsDB7XT4l0TSBWXiTw23Lv8YFWv7Y!/b/dHABAAAAAAAA&bo=LAIgAwAAAAAFAC4!&rf=viewer_4","http://img3.duitang.com/uploads/item/201604/03/20160403102627_wM8NF.thumb.700_0.jpeg","http://img3.duitang.com/uploads/item/201408/04/20140804170804_BaUdm.thumb.700_0.jpeg"]
    
    var timer = NSTimer()
    var pageControl = UIPageControl()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.bannerArray = ProductRecommand.createDailyBannerModel()
        print("bannerView -> bannerArray.count = \(self.bannerArray.count)")
        
        self.createBannerView()
  //      self.createFourButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //创建轮播图
    func createBannerView() {
        showScrollerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
        showScrollerView.delegate = self
        showScrollerView.pagingEnabled = true
        showScrollerView.bounces = false
        showScrollerView.showsHorizontalScrollIndicator = false
        
        //index = 0前面加最后一张图片，index = count-1后加第一张图片,最后一张放到index=0的位置
        let lastImageView = UIImageView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
        let bannerModel = self.bannerArray[bannerArray.count-1] as! DailyBannerModel
//        lastImageView.sd_setImageWithURL(NSURL(string: bannerModel.imageUrl),placeholderImage: UIImage(named: "placeholder.jpg"))
        lastImageView.image = UIImage(named: "placeholder.jpg")
        showScrollerView.addSubview(lastImageView)
        //第一张放index=count的位置
        let firstImageView = UIImageView.init(frame: CGRectMake(CGFloat(bannerArray.count+1)*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
        let model = self.bannerArray[0] as! DailyBannerModel
//        firstImageView.sd_setImageWithURL(NSURL(string: model.imageUrl), placeholderImage: UIImage(named: "placeholder.jpg"))
        firstImageView.image = UIImage(named: "placeholder.jpg")
        showScrollerView.addSubview(firstImageView)
        
        for (var index = 0; index < self.bannerArray.count;index++) {
            let bannerModel = self.bannerArray[index] as! DailyBannerModel
            let imageView  = UIImageView(frame: CGRectMake(SCREEN_WIDTH*CGFloat(index+1), 0, SCREEN_WIDTH, SCREEN_HEIGHT))
//            imageView.sd_setImageWithURL(NSURL(string: bannerModel.imageUrl), placeholderImage: UIImage(named: "placeholder.jpg"))
            imageView.image = UIImage(named: "placeholder"+String(index)+".jpg")
            showScrollerView.addSubview(imageView)
        }
        showScrollerView.contentSize  = CGSizeMake(SCREEN_WIDTH*CGFloat(bannerArray.count+2), 0)
        showScrollerView.contentOffset = CGPointMake(SCREEN_WIDTH, 0)
        
        self.addSubview(showScrollerView)
        
        //创建pageControl
        pageControl.numberOfPages = bannerArray.count
        let size = pageControl.sizeForNumberOfPages(bannerArray.count)
        pageControl.frame = CGRectMake(0, 670, size.width, 6)
        pageControl.layer.zPosition = 2
        pageControl.center = CGPointMake(SCREEN_WIDTH/2, pageControl.center.y)
        pageControl.pageIndicatorTintColor = UIColor(red: 228/255.0,green: 228/255.0,blue: 228/255.0,alpha: 1.0)
        pageControl.currentPageIndicatorTintColor = UIColor(red: 253/255.0, green:99/255.0,blue: 99/255.0,alpha: 1.0 )
        //给pageControl添加事件
        pageControl.addTarget(self, action: "currentPageChanged", forControlEvents: UIControlEvents.ValueChanged)
        pageControl.currentPage = 0
        self.addSubview(pageControl)
        
        startTimer()
    }
    
    //开启timer
    func startTimer() {
        timer = NSTimer(timeInterval: 2.0,target: self,selector: "autoMeticScroll",userInfo: nil,repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
    //timer计时 滚动视图
    //方法->改变pageControl.currentPage
    func autoMeticScroll() {
        //滑动到最后一张
        if showScrollerView.contentOffset.x == CGFloat(bannerArray.count+1)*SCREEN_WIDTH {
            showScrollerView.contentOffset = CGPointMake(SCREEN_WIDTH, 0)
            pageControl.currentPage = 0
        } else {
            let page = Int((showScrollerView.contentOffset.x - SCREEN_WIDTH)/SCREEN_WIDTH)
            pageControl.currentPage = page
        }
        showScrollerView.setContentOffset(CGPointMake(showScrollerView.contentOffset.x+bannerWidth,0), animated: true)
    }
    //scrollerviewDelegate
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        //计算页数
        let page = Int((showScrollerView.contentOffset.x - SCREEN_WIDTH)/SCREEN_WIDTH)
        pageControl.currentPage = page
        //如果滑到第一张
        if showScrollerView.contentOffset.x == 0 {
            showScrollerView.contentOffset = CGPointMake(showScrollerView.contentOffset.x+bannerWidth, 0)
            pageControl.currentPage = bannerArray.count-1
        } else if showScrollerView.contentOffset.x == CGFloat(bannerArray.count+1)*SCREEN_WIDTH {
            //滑到最后一张的时候
            showScrollerView.contentOffset = CGPointMake(SCREEN_WIDTH,0)
            pageControl.currentPage = 0
        }
    }
    
    //抓住图片的时候停止时钟
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        timer.invalidate()
    }
    //结束拖动状态时开启时钟
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        startTimer()
    }
    
}

