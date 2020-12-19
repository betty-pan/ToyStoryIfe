//
//  ViewController.swift
//  ToyStoryIfe
//
//  Created by BettyPan on 2020/12/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var orderInformationTextView: UITextView!
    @IBOutlet weak var giftSegment: UISegmentedControl!
    @IBOutlet weak var qtySlider: UISlider!
    @IBOutlet weak var deliverySwitch: UISwitch!
    @IBOutlet weak var pickupSwitch: UISwitch!
    @IBOutlet weak var qtyLabel: UILabel!
    
    //定義欲顯示於textView中之字串/數字
    var giftSetstr = ""
    var qtyValue = 0
    var deliveryOrNotstr = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //設定切換品項的名稱
    @IBAction func giftSetSelection(_ sender: UISegmentedControl) {
        if giftSegment.selectedSegmentIndex == 0 {
            giftSetstr = "Golden Set"
        } else if giftSegment.selectedSegmentIndex == 1{
            giftSetstr = "Luxury Set"
        }
    }
    
    //設定slider的值顯示在label中
    @IBAction func qtySlider(_ sender: UISlider) {
        qtySlider.value.round()
        qtyLabel.text = String(qtySlider.value)
        //設定顯示在textView中之數字(UIButton:CheckOut)
        qtyValue = Int(qtySlider.value)
    }
    
    //設定同時只能有一個Switch是開啟狀態
    @IBAction func deliveryOrNot(_ sender: UISwitch) {
        //由sender 預先判斷按的是哪一個開關
        if sender == deliverySwitch{
            //如deliverySwitch是開啟的,pickupSwitch就要關起來
            if deliverySwitch.isOn {
                pickupSwitch.setOn(false, animated: true)
                //設定顯示在textView中之數字(UIButton:CheckOut)
                deliveryOrNotstr = "deliver to your address."
            }
        //否則 如pickupSwitch是開啟的,deliverySwitch就要關起來
        } else {
            if pickupSwitch.isOn {
            deliverySwitch.setOn(false, animated: true)
            //設定顯示在textView中之數字(UIButton:CheckOut)
            deliveryOrNotstr = "pick up in-store."
        }
    }
    }
    //結帳鍵，將
    @IBAction func checkOutButton(_ sender: UIButton) {
        //亂數決定是否缺貨
        let isOutOfStock = Bool.random()
        //如缺貨將顯示此段文字,此段文字顏色為紅色
        if isOutOfStock {
            orderInformationTextView.text = "Sorry! \n It's out of stock!"
            orderInformationTextView.textColor = UIColor.red
        }
        //如slider數量為0
        else if qtySlider.value == 0 {
            //將顯示此段文字,此段文字為紅色,數量label為紅色
            orderInformationTextView.text = "**Quantity needed!**"
            orderInformationTextView.textColor = UIColor.red
            qtyLabel.textColor = UIColor.red
        }else{
            //否則將顯示此段文字,此段文字為黑色,數量label為黑色
            orderInformationTextView.text = "You order \(qtyValue) Christmas \(giftSetstr) and will \(deliveryOrNotstr) \n Thank you!"
            orderInformationTextView.textColor = UIColor.black
            qtyLabel.textColor = UIColor.black
            
        }
    }
    //清除鍵，將所有值設為0
    @IBAction func clearALLButton(_ sender: UIButton) {
        qtySlider.value = 0
        qtyLabel.text = "0"
        giftSegment.selectedSegmentIndex = 0
        deliverySwitch.setOn(false, animated: true)
        pickupSwitch.setOn(false, animated: true)
        orderInformationTextView.text = "ORDER INFORMATIONS"
        orderInformationTextView.textColor = UIColor.black
        qtyLabel.textColor = UIColor.black
    }
    
}

