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
    var tipPercentSelected: Double = 18.0
    var billTotal: Double = 32.38
    
    @IBAction func tipPercentSliderChanged(sender: UISlider) {
        tipPercentSelected = Double(sender.value)
        tipPercentValue.text = "Tip: \(Int(tipPercentSelected))"
        tipPercentCollection[0].text = String.localizedStringWithFormat("%.0f %@",(tipPercentSelected - 5), "%")
        tipPercentCollection[1].text = String.localizedStringWithFormat("%.0f %@",(tipPercentSelected), "%")
        tipPercentCollection[2].text = String.localizedStringWithFormat("%.0f %@",(tipPercentSelected + 5), "%")
    }
    
    @IBAction func groupSizeSliderChanged(sender: UISlider) {
        groupSizeSelected = Int(sender.value)
        print(groupSizeSelected, " = groupsize,", billTotal, "=billtotal", tipPercentSelected, "=tippercent")
        groupSizeValue.text = "Group size: \(groupSizeSelected)"
        tipAmountCollection[0].text = String(format: "%.2f", (billTotal * (tipPercentSelected - 5) / 100))
        tipAmountCollection[1].text = String(format: "%.2f", (billTotal * (tipPercentSelected) / 100))
        tipAmountCollection[2].text = String(format: "%.2f", (billTotal * (tipPercentSelected + 5) / 100))
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipAmountCollection[0].text = "\((tipPercentSelected - 5.0) * billTotal / 100)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}

