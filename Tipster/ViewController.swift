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
    
    var tipPercentSelected: Double = 0.0
    @IBAction func tipPercentSliderChanged(sender: UISlider) {
        tipPercentSelected = Double(sender.value)
        tipPercentValue.text = String.localizedStringWithFormat("%.1f %@", "Tip: ",tipPercentSelected, "%")
        tipPercentCollection[0].text = String.localizedStringWithFormat("%.1f %@",(tipPercentSelected - 5), "%")
        tipPercentCollection[1].text = String.localizedStringWithFormat("%.1f %@",tipPercentSelected, "%")
        tipPercentCollection[2].text = String.localizedStringWithFormat("%.1f %@",(tipPercentSelected + 5), "%")
    }
    
    @IBAction func groupSizeSliderChanged(sender: UISlider) {
        let groupSizeSelected = Int(sender.value)
        groupSizeValue.text = "Group Size: \(groupSizeSelected)"
        tipAmountCollection[0].text = "\(Double(resultLabel.text!)! * (tipPercentSelected - 5) / 100  )"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

