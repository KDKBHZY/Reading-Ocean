//
//  ViewController.swift
//  UI
//
//Created by hzy on 2020/05/30
//  Copyright © 2020 zys All rights reserved.
//

import UIKit

var page = 0
//var Title = ""


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
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
    }
    

}

