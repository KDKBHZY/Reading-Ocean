//
//  meViewController.swift
//  UI
//
//  Created by ZY H on 2020/6/9.
//  Copyright © 2020 linyc. All rights reserved.
//

import UIKit

class meViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var a = ["个人信息","我的地址","版本更新","更多","联系我们"]
    var count:Int = 5
    @IBOutlet weak var tv: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "me")
                let index = indexPath.row
        cell?.textLabel?.text = a[index]
        cell?.layer.borderColor = UIColor.blue.cgColor
                cell?.layer.borderWidth = 1
                cell?.layer.cornerRadius = 20
                cell?.clipsToBounds = true
        //        cell?.imageView?.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        //        cell?.imageView?.adjustsImageSizeForAccessibilityContentSizeCategory = false
                
                return cell!
    }
    
    

    @IBOutlet weak var iconview: UIView!
    @IBOutlet weak var icon: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        iconview.layer.cornerRadius = iconview.frame.size.width / 2
        tv.delegate = self
               tv.dataSource = self
              tv.rowHeight = 60
               tv.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 5, right: 0)
        //iconview.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    

    

}
