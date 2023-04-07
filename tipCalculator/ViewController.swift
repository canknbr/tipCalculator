//
//  ViewController.swift
//  tipCalculator
//
//  Created by Can Kanbur on 7.04.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var splitNumber: UILabel!
    @IBOutlet var twenty: UIButton!
    @IBOutlet var ten: UIButton!
    @IBOutlet var zero: UIButton!
    @IBOutlet var billText: UITextField!

    var tip = 0.10
    var numPeople = 2
    var billTotal = 0.0
    var finalTotal = "0.0"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billText.endEditing(true)
        zero.isSelected = false
        ten.isSelected = false
        twenty.isSelected = false
        sender.isSelected = true

        let btnTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(btnTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
    }

    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitNumber.text = String(format: "%.0f", sender.value)
        numPeople = Int(sender.value)
    }

    @IBAction func calculatePressed(_ sender: Any) {
        
             let bill = billText.text!
             if bill != "" {
                 billTotal = Double(bill)!
                 let result = billTotal * (1 + tip) / Double(numPeople)
                 finalTotal = String(format: "%.2f", result)
             }
             self.performSegue(withIdentifier: "toSecondVc", sender: self)
    }
    
    
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          
          if segue.identifier == "toSecondVc" {
              
              let destinationVC = segue.destination as! SecondViewController
              destinationVC.result = finalTotal
              destinationVC.tip = Int(tip * 100)
              destinationVC.split = numPeople
          }
      }
}
