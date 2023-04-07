//
//  SecondViewController.swift
//  tipCalculator
//
//  Created by Can Kanbur on 7.04.2023.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var result = "0.0"
      var tip = 10
      var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
            settingsLabel.text = "Split between \(split) people, with \(tip)% tip."

        // Do any additional setup after loading the view.
    }
    

    @IBAction func reCalcButton(_ sender: Any) {
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
