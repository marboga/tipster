//
//  ViewController.swift
//  Tipster
//
//  Created by Michael Arbogast on 5/4/16.
//  Copyright © 2016 Michael Arbogast. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet var tipPercentCollection: [UILabel]!
    @IBOutlet var tipAmountCollection: [UILabel]!
    @IBOutlet var billAmountCollection: [UILabel]!
    
    @IBOutlet weak var tipPercentValue: UILabel!
    @IBOutlet weak var groupSizeValue: UILabel!
    
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var groupSizeSlider: UISlider!
    
    @IBOutlet var numeralCollection: [UIButton]!
    @IBOutlet weak var clearButton: UIButton!
    
    var groupSizeSelected: Int = 4
    var tipPercentSelected = 20
    var billTotalString: String = "0"
    var billTotal: Double = 0
    
    @IBAction func tipPercentSliderChanged(sender: UISlider) {
        tipPercentSelected = Int(sender.value)
        tipPercentValue.text = "Tip: \(tipPercentSelected)%"
        updateDisplayUI()
    }
    
    @IBAction func groupSizeSliderChanged(sender: UISlider) {
        groupSizeSelected = Int(sender.value)
        print(groupSizeSelected, " = groupsize,", billTotal, "=billtotal", tipPercentSelected, "=tippercent")
        updateDisplayUI()
    }
    
    @IBAction func numberButtonPressed(sender: UIButton) {
        print(sender.tag)
        if billTotalString == "0" {
            if sender.tag != 10 {
                billTotalString = String(sender.tag)
            } else {
                billTotalString = "0."
            }
        } else {
            if sender.tag != 10 {
            billTotalString += "\(sender.tag)"
            } else {
                billTotalString += "."
            }
        }
        updateDisplayUI()
    }
    
    
    @IBAction func clearButtonActivated(sender: UIButton) {
        billTotalString = "0"
        updateDisplayUI()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipPercentValue.text = "Tip: \(tipPercentSelected)%"
        updateDisplayUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateDisplayUI() {
        resultLabel.text = billTotalString
        groupSizeValue.text = "Group size: \(groupSizeSelected)"
        tipAmountCollection[0].text = String(format: "%.2f", (Double(billTotalString)! * Double(tipPercentSelected - 5) / Double(groupSizeSelected) / 100 ))
        tipAmountCollection[1].text = String(format: "%.2f", (Double(billTotalString)! * Double(tipPercentSelected) / Double(groupSizeSelected) / 100))
        tipAmountCollection[2].text = String(format: "%.2f", (Double(billTotalString)! * Double(tipPercentSelected + 5) / Double(groupSizeSelected) / 100))
        billAmountCollection[0].text = String(format: "%.2f", (Double(billTotalString)! / Double(groupSizeSelected) + Double(tipAmountCollection[0].text!)!))
        billAmountCollection[1].text = String(format: "%.2f", (Double(billTotalString)! / Double(groupSizeSelected) + Double(tipAmountCollection[1].text!)!))
        billAmountCollection[2].text = String(format: "%.2f", (Double(billTotalString)! / Double(groupSizeSelected) + Double(tipAmountCollection[2].text!)!))
        tipPercentCollection[0].text = "\(tipPercentSelected - 5)%"
        tipPercentCollection[1].text = "\(tipPercentSelected)%"
        tipPercentCollection[2].text = "\(tipPercentSelected + 5)%"
        
        
        
    }
    
    
}

