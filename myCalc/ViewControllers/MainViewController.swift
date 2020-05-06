//
//  ViewController.swift
//  myCalc
//
//  Created by Nizelan on 24.04.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import UIKit

enum MathematicalOperation: String {
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "*"
    case power = "^"
}

class MainViewController: UIViewController {
    public var action: MathematicalOperation?
    
    let model = CalcModel()
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var upperLabel: UILabel!
    
    // Cleen Button ligic
    @IBAction func cleenButton(_ sender: UIButton) {
        label.text = ""
        upperLabel.text = ""
        action = nil
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
        action = .divide
        upperLabel.text = upperLabel.text! + label.text! + "/"
        label.text = ""
    }
    @IBAction func multipleButton(_ sender: UIButton) {
        action = .multiply
        upperLabel.text = upperLabel.text! + label.text! + "*"
        label.text = ""
    }
    @IBAction func subtracButton(_ sender: UIButton) {
        action = .substract
        upperLabel.text = upperLabel.text! + label.text! + "-"
        label.text = ""
    }
    @IBAction func additButton(_ sender: UIButton) {
        action = .add
        upperLabel.text = upperLabel.text! + label.text! + "+"
        label.text = ""
    }
    @IBAction func powerButton(_ sender: UIButton) {
        action = .power
        upperLabel.text = upperLabel.text! + label.text! + "^"
        label.text = ""
    }
    
// Equal Button ligic
    @IBAction func equalButton(_ sender: UIButton) {
        upperLabel.text = upperLabel.text! + label.text!
        label.text = String(model.resolve(string: upperLabel.text!))
    }
}

