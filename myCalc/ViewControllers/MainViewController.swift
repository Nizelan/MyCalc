//
//  ViewController.swift
//  myCalc
//
//  Created by Nizelan on 24.04.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import UIKit

enum MathematicalOperation {
    case add
    case substract
    case divide
    case multiply
}

class MainViewController: UIViewController {

    var firstOperand: Double?
    var secondOperand: Double = 0
    var magOperandOne: Double?
    var magOperandTwo: Double = 0
    var equalOperand: Double?
    var action: MathematicalOperation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var upperLabel: UILabel!
    
    // Cleen Button ligic
    @IBAction func cleenButton(_ sender: UIButton) {
        label.text = ""
        upperLabel.text = ""
        firstOperand = nil
        magOperandOne = nil
        magOperandTwo = 0
        secondOperand = 0
        action = nil
        equalOperand = nil
    }
    
    // Suport Buttons ligic
    @IBAction func dotTapButton(_ sender: UIButton) {
        label.text = label.text! + "."
    }
    @IBAction func minusButton(_ sender: UIButton) {
        label.text = "-" + label.text!
    }
    @IBAction func backspaceButton(_ sender: UIButton) {
        label.text = String(label.text!.dropLast(1))
    }
    
    // Number Buttons
    @IBAction func numberButton(_ sender: UIButton) {
        
        if upperLabel.text!.contains("=") {
            upperLabel.text = ""
        }
        let number = sender.currentTitle!
        label.text = label.text! + number
    }
    

    // Action Buttons logic
    @IBAction func divisionButton(_ sender: UIButton) {
        
        
    }
    @IBAction func multipleButton(_ sender: UIButton) {
        
        
    }
    @IBAction func subtracButton(_ sender: UIButton) {
       
        
    }
    @IBAction func additButton(_ sender: UIButton) {
        
    
    }
    
// Equal Button ligic
    @IBAction func equalButton(_ sender: UIButton) {
        
        if firstOperand != nil || magOperandOne != nil {
            secondOperand = Double(String(label.text!))!
            magOperandTwo = Double(String(label.text!))!
            if action == .divide {
                upperLabel.text = upperLabel.text! + label.text! + "=" + String(magOperandOne! / magOperandTwo)
                label.text = ""
            } else if action == .multiply {
                upperLabel.text = upperLabel.text! + label.text! + "=" + String(magOperandOne! * magOperandTwo)
                label.text = ""
            } else if action == .substract {
                upperLabel.text = upperLabel.text! + label.text! + "=" + String(firstOperand! - secondOperand)
                label.text = ""
            } else if action == .add {
                upperLabel.text = upperLabel.text! + label.text! + "=" + String(firstOperand! + secondOperand)
                label.text = ""
            }
        } else {
            upperLabel.text = "ERROR you maggot"
        }
//        if magOperandTwo != nil {
//            upperLabel.text = String(magOperandTwo! + equalOperand!)
//        }
        firstOperand = nil
        secondOperand = 0
        action = nil
    }
}

