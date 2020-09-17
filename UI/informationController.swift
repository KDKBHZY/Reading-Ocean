//
//  informationController.swift
//  UI
//
//Created by hzy on 2020/05/30
//  Copyright © 2020 zyh All rights reserved.
//

import UIKit

class informationController: UIViewController{
    @IBOutlet weak var kucun: UITextField!
    //@IBOutlet weak var titleColor: UITextField!
    @IBOutlet weak var jiage: UITextField!
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var detial1: UITextView!
    @IBOutlet weak var numbs: UITextField!
    @IBAction func updating(_ sender: Any) {
//        ViewController.viewDidLoad()
    }
    
    
    @IBAction func Pay(_ sender: Any) {
        sendWXPay()
    }
    @IBAction func addToCart(_ sender: Any) {
//        dict["isAddCart"] = "1"
//        isAddCartMessage[page] = "1"
        isAddCartMessage[page] = "1"
        isAdd = 1
        num[page] += Int(numbs.text!) ?? 1
        let alertController = UIAlertController(title: "提示",message: "已添加进购物车", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)

        let okAction = UIAlertAction(title: "好的", style: .default, handler: {
            action in
 })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)



//        print(isAddCartMessage[page])
//        print(titleMessage[page])
        DispatchAfter(after: 0.1){
            
        }
        
    }
    @IBAction func plus(_ sender: Any) {
        var n = Int(numbs.text!) ?? 1
        if n < 99{
            n += 1
            numbs.text = String(n)
        }
    }
    @IBAction func Minus(_ sender: Any) {
        var n = Int(numbs.text!) ?? 1
        if n > 1{
            n -= 1
            numbs.text = String(n)
        }
    }
    override func viewDidLoad() {
        //titleColor.isEnabled = false
        super.viewDidLoad()
        DispatchAfter(after: 0.1){
            print(page)
            self.jiage.text = String(price)
            self.kucun.text = "库存：" + String(stock)
            self.jiage.isEnabled = false
            self.kucun.isEnabled = false
            self.picture.image = UIImage(named: "b\(page)")
            self.bookTitle.text = "《" + titleMessage[page] + "》"
            self.detial1.text! = detialMessage[page]
            self.detial1.isEditable = false
        }
        

        // Do any additional setup after loading the view.
    }
    //延迟操作
    public func DispatchAfter(after: Double, handler:@escaping ()->())
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + after) {
            handler()
        }
    }
    

    

}
