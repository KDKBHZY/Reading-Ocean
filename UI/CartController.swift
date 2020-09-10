//
//  CartController.swift
//  UI
//
//  Created by hzy on 2020/05/30
//  Copyright © 2020 zys All rights reserved.
//

import UIKit

var num = [Int](repeating: 0, count: bookTypeNumber)

class CartController: UIViewController ,UITableViewDataSource ,UITableViewDelegate{
    var change = 0
    var titleM = [String](repeating: "", count: bookTypeNumber)
    var detialM = [String](repeating: "", count: bookTypeNumber)
    var image = [UIImage]()
    @IBAction func backButton(_ sender: Any) {
//        ViewController.show()
//        CartController.load()
        
        
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delAction = UIContextualAction(style: .destructive, title: "DELETE") { (_, _, completion) in
            self.titleM.remove(at: indexPath.row)
            self.detialM.remove(at: indexPath.row)
            self.image.remove(at: indexPath.row)
            self.change = 1
           
            self.tv.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)//平滑效果
           // self.tv.reloadData()
           // self.tv.reloadData()
            completion(true)
        }
        let shareAction = UIContextualAction(style: .normal, title: "SHARE") { (_, _, completion) in
            let text = "分享一本好书  \(self.titleM[indexPath.row])!"
            let image = self.image[indexPath.row]
            let ac = UIActivityViewController(activityItems: [text,image], applicationActivities: nil)
            self.present(ac, animated: true)
            completion(true)
        }
        shareAction.backgroundColor=UIColor.orange
        let config = UISwipeActionsConfiguration(actions: [delAction,shareAction])
        return config
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var booktypenumber = 0
       if(self.change == 1)
                  {
                     for i in 0..<bookTypeNumber{
                     isAddCartMessage[i] = "0"
                    }
                       
                  }
        for i in 0..<bookTypeNumber{
           
            if isAddCartMessage[i] == "1"{
                
                
                titleM[booktypenumber] = titleMessage[i]
                detialM[booktypenumber] = "件数： "+String(num[i])
                image.append(arrImage[i])
                    booktypenumber += 1
                
            }
        }
       if(self.change == 1)
       {
           booktypenumber = 0
           self.change = 0
           isAdd = "0"
            
       }
//        print(booktypenumber)
        return booktypenumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "cart")
        if isAdd == "1"{
            let index = indexPath.row
            cell?.textLabel?.text = titleM[index]
            cell?.detailTextLabel?.text = detialM[index]
            cell?.imageView!.image = image[index]
            
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        for i in 0..<bookTypeNumber{
            if titleM[index] == titleMessage[i]{
                page = i
                
                break
            }
        }
    }
    
    @IBOutlet weak var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.delegate = self
        tv.dataSource = self
        tv.rowHeight = 100
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
