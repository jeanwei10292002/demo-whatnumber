//
//  ViewController.swift
//  demo-whatnumber
//
//  Created by jeanwei on 2020/3/17.
//  Copyright © 2020 jeanwei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chanceLabel: UILabel!
    @IBOutlet weak var typeinNumberLabel: UILabel!
    @IBOutlet weak var inputTexFileld: UITextField!
    var chance = 5
    var minnumber = 0
    var maxnumber = 100
    var answer = Int(arc4random_uniform(100)+1)
 
    
 

    @IBAction func submitButtonsubmitBu(_ sender: UIButton) {
        chance -= 1
        chanceLabel.text = "\(chance)"
        if chance == 0 {
        rePlayAlert()
        }
        print("answer = \(answer)")
        let inputtex = inputTexFileld.text!
        //清除textfileld
        inputTexFileld.text = ""
        //輸入 輸出
        let inputnumber = Int(inputtex)
        print("inputnumber = \(inputnumber)")
        //判斷輸入空值 輸入與答案的差異
    
        if inputnumber == nil{
            typeinNumberLabel.text = "你尚未輸入！"
        }else {
            if inputnumber! > maxnumber{
                //使用者輸入太大
                typeinNumberLabel.text = "你輸入太大！數字介於\(minnumber)~\(maxnumber)"
                   chanceLabel.isHidden = false
            }else {
                if inputnumber! < minnumber{
                    //使用者輸入太小
                    typeinNumberLabel.text = "你輸入太小！數字介於\(minnumber)~\(maxnumber)"
                     chanceLabel.isHidden = false
                }else {
                    //檢查答案
                    if inputnumber == answer {
                        typeinNumberLabel.text = "你答對了！如要要再繼續，請再按play again"
                        chanceLabel.isHidden = true
                    
                    }else {
                        if inputnumber! > answer {
                            maxnumber = inputnumber!
                        }else {
                           
                                minnumber = inputnumber!
                        }
                        typeinNumberLabel.text = "數字介於\(minnumber)~\(maxnumber)"
                         chanceLabel.isHidden = false
                    }
                }
            }
        }
        
    }
   //答對之後，按下again按鈕，重新在一次
  @IBAction func again(_ sender: UIButton) {
       againn()
    }
    
    override func viewDidLoad() {
           super.viewDidLoad()
      
           // Do any additional setup after loading the view, typically from a nib.
       }
    //按下空白處 收下鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func rePlayAlert(){
        let controller = UIAlertController(title: "遊戲結束！",message: "正確解答是：\(answer)",preferredStyle: .alert)
        let okaction = UIAlertAction(title:"OK",style: .default,handler: {(action:UIAlertAction) -> () in
                self.againn()
        })
        controller.addAction(okaction)
        present(controller,animated: true,completion: nil)
    }
    func againn(){
        minnumber = 0
        maxnumber = 100
        chance = 5
         chanceLabel.isHidden = true
        answer = Int(arc4random_uniform(100)+1)
        typeinNumberLabel.text = "數字介於\(minnumber)~\(maxnumber)"
    }
    
}

