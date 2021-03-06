//
//  ViewController.swift
//  Prework
//
//  Created by Maheen Naqvi on 7/23/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Getting the bill amount from the text field input
                let bill = Double(billAmountTextField.text!) ?? 0
                
                // Get the total tip - tip * tip percentage
                let tipPercentages = [0.15, 0.18, 0.2]
                var tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
                let defaults = UserDefaults.standard
                let roundTip = defaults.bool(forKey: "roundTip")
                
                if (roundTip) {
                    tip = ceil(tip)
                }
                
                let total = bill + tip
                
                // Update the tip amount label
                tipAmountLabel.text = String(format: "$%.2f", tip)
                // Update Total Amount
                totalLabel.text = String(format: "$%.2f", total)
                
                //****self.stepChanged(self)
            }
    }

