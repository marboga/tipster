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
    
    
    @IBOutlet var numeralCollection: [UIButton]!
    @IBOutlet weak var clearButton: UIButton!
    
    
    @IBAction func tipPercentSliderChanged(sender: UISlider) {
        let tipPercentSelected = Float(sender.value)
        tipPercentValue.text = "Tip: \(tipPercentSelected)%"
    }
    
    @IBAction func groupSizeSliderChanged(sender: UISlider) {
        let groupSizeSelected = Int(sender.value)
        groupSizeValue.text = "Group Size: \(groupSizeSelected)"
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

