//
//  AppDelegate.swift
//  Ask_me
//
//  Created by Apple on 16/7/11.
//  Copyright © 2016年 NJU. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UITabBarControllerDelegate {

    var window: UIWindow?
    var tabbarController:UITabBarController!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        self.createTabbarController()
        self.window?.rootViewController = mainViewController()
        self.window?.makeKeyAndVisible()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "changeRootViewController", name: DismissFirstViewController_Notification, object: nil)
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func createTabbarController() {
        self.tabbarController = UITabBarController.init()
        tabbarController.delegate = self
        
        let homeVC = FirstViewController.init()
        homeVC.navigationController?.navigationBarHidden = true
        homeVC.tabBarItem.title = "Home"
        homeVC.tabBarItem.image = UIImage.init(named: "Image1")
        let homeNav = UINavigationController.init(rootViewController: homeVC)
        
        let likeVC = SecondViewController.init()
        likeVC.navigationController?.navigationBarHidden = true
        likeVC.tabBarItem = UITabBarItem.init(tabBarSystemItem:UITabBarSystemItem.Favorites, tag: 1)
        let likeNav = UINavigationController.init(rootViewController: likeVC)
        
        let meVC = ThirdViewController.init()
        meVC.navigationController?.navigationBarHidden = true
        meVC.tabBarItem.title = "Me"
        meVC.tabBarItem.image = UIImage.init(named: "Image3")
        let meNav = UINavigationController.init(rootViewController: meVC)
        
        let viewControllerArr = NSArray.init(objects: homeNav,likeNav,meNav)
        self.tabbarController.tabBar.translucent = false
        self.tabbarController.viewControllers = viewControllerArr as! [UINavigationController]
        
        for var i = 0;i < tabbarController.viewControllers?.count;i++ {
            let nav = tabbarController.viewControllers![i] as! UINavigationController
            nav.navigationBar.barTintColor = CustomBarTintColor
            nav.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            nav.navigationBar.translucent = false
        }
    }

    func mainViewController() -> UIViewController {
        let firstVC = StartViewController()
        return firstVC
    }
    
    func changeRootViewController() {
        self.window!.rootViewController = self.tabbarController
    }

}

