//
//  ViewController.swift
//  BMICompute
//
//  Created by 陳仲堯 on 2018/8/8.
//  Copyright © 2018年 陳仲堯. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var result: UITextView!
    
    //點擊compute時計算BMI
    @IBAction func compute(_ sender: UIButton) {
        
        if height.text != "", weight.text != "" {
            //檢查是否為數字
            if let heightC = Double(height.text!), let weightC = Double(weight.text!) {
                let bmiResult = round((weightC / pow((heightC / 100), 2)) * 100) / 100
                bmi.text = String(bmiResult)
                
                if bmiResult < 18.5 {
                    result.text = "過輕"
                } else if 18.5 < bmiResult, bmiResult < 24 {
                    result.text = "適中"
                } else {
                    result.text = "過重"
                }
            }else {
                result.text = "請輸入數字"
            }
            
            
        }else{
            result.text = "請輸入數字"
        }
        
    }
    
    /*
     須將UI的TextField的delegate設定為此View
     1.對TextField按右鍵
     2.將delegate拉至UI上的ViewController
    */
    //隱藏虛擬鍵盤:點擊return時關閉
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //隱藏虛擬鍵盤:點擊任意背景時關閉
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

