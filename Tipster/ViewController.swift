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
    var tipPercentSelected: Double = 20.0
    var billTotalString: String = "0"
    var billTotal: Double = 0
    
    @IBAction func tipPercentSliderChanged(sender: UISlider) {
        tipPercentSelected = Double(sender.value)
        tipPercentValue.text = "Tip: \(Int(tipPercentSelected))"
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
                billTotalString = "."
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipAmountCollection[0].text = "\((tipPercentSelected - 5.0) * Double(billTotalString)! / 100)"
        billTotal = 0
        updateDisplayUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateDisplayUI() {
        resultLabel.text = billTotalString
        groupSizeValue.text = "Group size: \(groupSizeSelected)"
        tipAmountCollection[0].text = String(format: "%.2f", (Double(billTotalString)! * (tipPercentSelected - 5) / Double(groupSizeSelected) / 100 ))
        tipAmountCollection[1].text = String(format: "%.2f", (Double(billTotalString)! * (tipPercentSelected) / Double(groupSizeSelected) / 100))
        tipAmountCollection[2].text = String(format: "%.2f", (Double(billTotalString)! * (tipPercentSelected + 5) / Double(groupSizeSelected) / 100))
        tipPercentCollection[0].text = String.localizedStringWithFormat("%.0f %@",(tipPercentSelected - 5), "%")
        tipPercentCollection[1].text = String.localizedStringWithFormat("%.0f %@",(tipPercentSelected), "%")
        tipPercentCollection[2].text = String.localizedStringWithFormat("%.0f %@",(tipPercentSelected + 5), "%")
    }
    
}

