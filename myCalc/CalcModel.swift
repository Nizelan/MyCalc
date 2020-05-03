//
//  CalcModel.swift
//  myCalc
//
//  Created by Nizelan on 02.05.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import UIKit

class CalcModel {
    

    
    func isAction(character: Character) -> Bool {
        return character == "/" || character == "*" || character == "-" || character == "+"
    }
    
    public func findEqual(string: String) -> Double {
        var string = string
        var value: Double = 0
    
        while string.contains("-") || string.contains("+") || string.contains("/") || string.contains("*") {
            var first: String = ""
            var second: String = ""
            var action: Character?
            
            for character in string {
                if isAction(character: character) == false && action == nil {
                    first += String(character)
                    string.removeFirst(1)
                } else if isAction(character: character) == true && action == nil{
                    action = character
                    string.removeFirst(1)
                } else if isAction(character: character) == false && action != nil {
                    second += String(character)
                    string.removeFirst(1)
                } else if isAction(character: character) == true && action != nil {
                    break
                }
            }
            switch action {
            case "/":
                value = Double(first)! / Double(second)!
            case "*":
                value = Double(first)! * Double(second)!
            case "-":
                value = Double(first)! - Double(second)!
            case "+":
                value = Double(first)! + Double(second)!
            default: break
            }
            string = String(value) + string
        }
        return value
    }
}
