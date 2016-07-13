//
//  SecondViewController.swift
//  Ask_me
//
//  Created by Apple on 16/7/11.
//  Copyright © 2016年 NJU. All rights reserved.
//

import Foundation
import UIKit

//
//class SecondViewController: UIViewController,UITableViewDelegate{
//
//}

class SecondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var tableView:UITableView?
    var Infos = [Food]()

   let name = UITextField(frame:CGRectMake(10,160,200,30))
   let rate = UITextField(frame:CGRectMake(10,300,200,30))
   let url = UITextField(frame:CGRectMake(10,440,200,30))
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.tableView = UITableView(frame:self.view.frame,style:.Plain)
        
        let food1:Food = Food(name:"抹茶冰淇淋",rate:"五星",url:"http://img3.duitang.com/uploads/item/201607/08/20160708152643_2MKeH.thumb.700_0.jpeg")
        
        Infos.append(food1)
        
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        let item = UIBarButtonItem(title:"Add",style:.Plain,target:self,action:#selector(SecondViewController.add))
        
        self.navigationItem.setRightBarButtonItem(item, animated: true)
        
        self.view.addSubview(self.tableView!)
        
    }
    
    func add(){
        
        let dest = UIViewController()
        
        dest.title = "添加收藏"
        
        let childviewOfDest = UIView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT));
        childviewOfDest.backgroundColor = UIColor.whiteColor()
        
        
        name.borderStyle = UITextBorderStyle.RoundedRect
        name.backgroundColor = UIColor.whiteColor()
        name.placeholder="请输入名称"
        childviewOfDest.addSubview(name)
        
        
        rate.borderStyle = UITextBorderStyle.RoundedRect
        rate.backgroundColor = UIColor.whiteColor()
        rate.placeholder="请输入评价星级（1~5）"
        childviewOfDest.addSubview(rate)

        url.borderStyle = UITextBorderStyle.RoundedRect
        url.backgroundColor = UIColor.whiteColor()
        url.placeholder="请输入图片的URL"
        childviewOfDest.addSubview(url)
        
        let item = UIBarButtonItem(title:"Done",style:.Plain,target:dest,action:#selector(SecondViewController.done))
        
        dest.navigationItem.setRightBarButtonItem(item, animated: true)
        
        dest.view.addSubview(childviewOfDest)
        
        navigationController?.pushViewController(dest, animated: true)
        
    }
    
    func done(){
        let food = Food(name: (name.text)!,rate: (name.text)!,url: (url.text)!)
        Infos.append(food)
        self.tableView?.reloadData()
    }
    
    func numberOfSectionsIntableView(tableView:UITableView) -> Int{
        return 1;
    }
    
    func tableView(tableView:UITableView,numberOfRowsInSection:Int) -> Int{
        return Infos.count
    }
    
    func tableView(tableView:UITableView,cellForRowAtIndexPath indexPath:NSIndexPath)
        -> UITableViewCell {
            let identifier = "CellIndentifier"
            
            let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle,reuseIdentifier: identifier)
            
            let food:Food = Infos[indexPath.row]
            
            cell.textLabel!.text = food.name as String;
            cell.detailTextLabel!.text = food.rate as String
            
//            cell.imageView!.image = UIImage(named: "food.jpg")
//            cell.imageView?.layer.masksToBounds = true
//            cell.imageView?.layer.cornerRadius = 5
//            cell.imageView!.layer.borderWidth = 2
//            cell.imageView?.layer.borderColor = UIColor.blueColor().CGColor;
            
            return cell
    }
    
    func tableView(tableView:UITableView,heightForRowAtIndexPath indexPath:NSIndexPath) ->CGFloat{
        return 60.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
//        NSLog("Row: \(row)")
        
        let dest = UIViewController()
        
        dest.title = Infos[row].name as String
        
        let url = NSURL(string:Infos[indexPath.row].url as String)
        print(url)
        let data = NSData(contentsOfURL: url!)
        if(data != nil){
            let newImage = UIImage(data: data!)
            let imageView = UIImageView(image: newImage)
            imageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
            dest.view.addSubview(imageView)
        
            navigationController?.pushViewController(dest, animated: true)
        }
    }
    
    
    
}

