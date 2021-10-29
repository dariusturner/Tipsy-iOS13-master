//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    let calculatorBrain = CalculatorBrain()

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var selectedPercentage = 0.1
    var selectedBtn = 2
    var timesSplit = 2
    var finalResult: String?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        calculatorBrain.deselectBtns(btnOne: zeroPctButton, btnTwo: tenPctButton, btnThree: twentyPctButton)
        sender.isSelected = true
        
        selectedBtn = sender.tag
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        timesSplit = Int(sender.value)
        splitNumberLabel.text = String(timesSplit)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "resultSegue" {
                if let resultVC = segue.destination as? ResultsViewController {
                    resultVC.total = finalResult
                    resultVC.timesSplit = timesSplit
                    resultVC.percent = selectedPercentage * 100
                }
            }
        }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        switch selectedBtn {
        case 1:
            selectedPercentage = 0.0
        case 2:
            selectedPercentage = 0.1
        case 3:
            selectedPercentage = 0.2
        default:
            selectedPercentage = 0.1
        }
//        print(timesSplit)
//        print(billTextField.text ?? 0)
        
        let textOptional = billTextField.text ?? "0.0"
        finalResult = calculatorBrain.getFairShare(text: textOptional, percentage: selectedPercentage, timesSplit: timesSplit)
        
        performSegue(withIdentifier: "resultSegue", sender: sender)
    }
    
}

