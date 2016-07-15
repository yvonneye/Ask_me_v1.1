//
//  FirstViewController.swift
//  Ask me
//
//  Created by Apple on 16/6/1.
//  Copyright © 2016年 NJU. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController{
    
    var customBar = UIView()
    
    var bannerView = BannerView()

    var headView = UIView()
    
    var showScrollView:UIScrollView!
    
    var showCollectionView : UICollectionView!
    
    var searchBar = CMSearchBar()
    
    var cancelBtn = UIButton()
    
    var leftTableView:UITableView!
    
    var currentTableView:UITableView!
    
    var rightTableView:UITableView!
    
    var dataStr = ProductRecommand()
    
    var productArr:NSMutableArray?
    
    var currentIndex = Int()
    var tmpCount = Int()
    var currentContentOffsetX = CGFloat()
    
    override func viewDidLoad() {
        print("enter homeviewdidload")
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        tmpCount = currentIndex
        
        self.loadData()
        print("load data succeed")
        self.createBannerView()
        print("create bannerview succeed")
//        self.dismissViewControllerAnimated(true, completion: nil)
//        self.buildSearchBar()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    
    //创建顶部轮播视图
    func createBannerView() {
        headView = UIView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
        headView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(headView)
        
        bannerView = BannerView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
        headView.addSubview(bannerView)
    }
    
    func createCollectionView() {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .Horizontal
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        
        showCollectionView = UICollectionView.init(frame: CGRectMake(0, 180, SCREEN_WIDTH, SCREEN_HEIGHT),collectionViewLayout: layout)
        showCollectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellIDentifier")
        showCollectionView?.contentSize = CGSizeMake(13*SCREEN_WIDTH, 0)
        showCollectionView.bounces = false
        showCollectionView.pagingEnabled = true
        showCollectionView.backgroundColor = UIColor.whiteColor()
      //  showCollectionView?.delegate = self
       // showCollectionView?.dataSource = self
        self.view.addSubview(showCollectionView)
    }
    
    func loadData() {
        self.productArr = dataStr.createProductRecommendModel(0)
        print("product.count = \(self.productArr!.count)")
        
    }
    
//    func buildSearchBar() {
//        searchBar = CMSearchBar.init(frame: CGRectMake(36, 330/2, 265, 29),Font:UIFont.systemFontOfSize(12.0),TextColor: MainTitleColor,PlaceHolder: "search for food",HotWords: nil)
//        weak var weakSelf = self
//        searchBar.changetextfieldClourse = { (text:String)->() in
//            if text.characters.count == 0 {
//                print("searchBar clear")
//                weakSelf!.cancelBtn.setTitle("cancle", forState: .Normal)
//            } else if text.characters.count > 0 {
//                weakSelf!.cancelBtn.setTitle("search", forState: .Normal)
//            }
//        }
//        customBar.addSubview(searchBar)
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
