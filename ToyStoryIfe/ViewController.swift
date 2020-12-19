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

   
    
    
    
    
    
    
    
    
    var giftSetstr = ""
    var qtyValue = 0
    var deliveryOrNotstr = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func giftSetSelection(_ sender: UISegmentedControl) {
        if giftSegment.selectedSegmentIndex == 0 {
            giftSetstr = "Golden Set"
        } else if giftSegment.selectedSegmentIndex == 1{
            giftSetstr = "Luxury Set"
        }
    }
    
    @IBAction func qtySlider(_ sender: UISlider) {
        qtySlider.value.round()
        qtyValue = Int(qtySlider.value)
        qtyLabel.text = String(qtySlider.value)
    }
    
    @IBAction func deliveryOrNot(_ sender: UISwitch) {
        //由sender == deliverySwitch 預先判斷按的是哪一個開關
        if sender == deliverySwitch{
            if deliverySwitch.isOn {
                pickupSwitch.setOn(false, animated: true)
                deliveryOrNotstr = "deliver to your address."
            }
        } else {
            if pickupSwitch.isOn {
            deliverySwitch.setOn(false, animated: true)
            deliveryOrNotstr = "pick up in-store."
        }
    }
    }
    
    @IBAction func checkOutButton(_ sender: UIButton) {
        //亂數決定缺貨，搶貨也是靠運氣的啦～哈哈哈
        let isOutOfStock = Bool.random()
        if isOutOfStock {
            orderInformationTextView.text = "Sorry! \n It's out of stock!"
            orderInformationTextView.textColor = UIColor.red
        }
        
        else if qtySlider.value == 0 {
            orderInformationTextView.text = "**Quantity needed!**"
            orderInformationTextView.textColor = UIColor.red
            qtyLabel.textColor = UIColor.red
        }else{
            orderInformationTextView.text = "You order \(qtyValue) Christmas \(giftSetstr) and will \(deliveryOrNotstr) \n Thank you!"
            orderInformationTextView.textColor = UIColor.black
            qtyLabel.textColor = UIColor.black
            
        }
    }
    //清除所有值：將所有stepper, textField值, totalLabel設為0
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

