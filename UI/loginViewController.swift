//
//  loginViewController.swift
//  UI
//
//  Created by ZY H on 2020/6/9.
//  Copyright © 2020 zyh. All rights reserved.
//

import UIKit

class loginViewController: UIViewController,UITextFieldDelegate{

  
    
    @IBAction func login(_ sender: Any) {
        ViewController.load()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.hideKeyboardWhenTappedAround()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self,action: #selector(loginViewController.dismissKeyboard)))
        
       

    }
    
   @objc  func dismissKeyboard() {
  self.view.endEditing(true)
  }



 
    

   
}
extension UIViewController{
    //隐藏键盘
//    func hideKeyboardWhenTappedAround() {
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
//    }
//
//    @objc private func dismissKeyboard() {
//        view.endEditing(true)
//    }
    
}

