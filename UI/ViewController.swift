//
//  ViewController.swift
//  UI
//
//Created by hzy on 2020/05/30
//  Copyright © 2020 zys All rights reserved.
//

import UIKit
import JCLoopPlayView
import SDWebImage
var page = 0
import Kingfisher


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,JCLoopPlayDelegate {
    func currentIndex(_ index: Int) {
                print("当前index = \(index - 1)")

    }
    
    func selectedIndex(_ index: Int) {
                print("选中index = \(index - 1)")

    }
    
   
    @IBOutlet weak var dingdanView: UIView!
    
    @IBOutlet weak var tv: UITableView!
    @IBOutlet weak var iconView: UIView!
    @IBAction func cart(_ sender: UIButton) {
        CartController.load()
        
    }
        let cellSpacingHeight: CGFloat = 5
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stock
    }
    
    //图片轮播
    private let loopView: JCLoopPlayView = {
          let imageStrs = ["icon", "icon", "b0", "b1", "b4", "b2"]
          let rect = CGRect(x: 0, y: 120, width: UIScreen.main.bounds.width, height: 240)
          let loopView = JCLoopPlayView(frame: rect, imageStrs: imageStrs)
          return loopView
      }()
      
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "shop")
        let index = indexPath.row
        cell?.textLabel?.text = titleMessage[index] + "             " + dict["price"]!
        cell?.detailTextLabel?.text = detialMessage[index]
        cell?.imageView!.image = arrImage[index]
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 1
        cell?.layer.cornerRadius = 30
        cell?.clipsToBounds = true
//        cell?.imageView?.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        cell?.imageView?.adjustsImageSizeForAccessibilityContentSizeCategory = false
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        let cell = tv.dequeueReusableCell(withIdentifier: "shop")
        page = indexPath.row

    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
        
    }
    private func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
           if indexPath.section != 0{
               return true
           }
           return false
       }
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tv.delegate = self
        tv.dataSource = self
        tv.rowHeight = 150
        tv.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 5, right: 0)

//        print(page)
        bookOfMessage()
        //设置购物车图标圆角；
        iconView.layer.cornerRadius = iconView.frame.size.width / 2
        iconView.clipsToBounds = true
//       tebBar.selectedItem = shangpingTebBar
        loopView.delegate = self
        view.addSubview(loopView)
      
    }
    

}
