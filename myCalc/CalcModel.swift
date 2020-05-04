//
//  CalcModel.swift
//  myCalc
//
//  Created by Nizelan on 02.05.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import UIKit

class CalcModel {
    
    var arrayOfString = [String]()
    
    public func resolve(string: String) -> Double {
        var string = string
        
        while string != "" {
            var varible: String = ""
            var char: String?
            
            for character in string {
                if MathematicalOperation(rawValue: String(character)) == nil && char == nil {
                    varible += String(character)
                    string.removeFirst(1)
                } else if MathematicalOperation(rawValue: String(character)) != nil && char == nil{
                    char = String(character)
                    string.removeFirst(1)
                } else if MathematicalOperation(rawValue: String(character)) == nil && char != nil {
                    break
                }
            }
            arrayOfString.append(varible)
            guard let action = char else { break }
            arrayOfString.append(action)
        }
        
        while arrayOfString.contains("/") || arrayOfString.contains("*") {
            guard let i = arrayOfString.firstIndex(where: { $0 == "/" || $0 == "*"}) else { break }
            switch arrayOfString[i] {
            case "/":
                arrayOfString.replaceSubrange(i-1...i+1, with: repeatElement(String(Double(arrayOfString[i-1])! / Double(arrayOfString[i+1])!), count: 1))
            case "*":
                arrayOfString.replaceSubrange(i-1...i+1, with: repeatElement(String(Double(arrayOfString[i-1])! * Double(arrayOfString[i+1])!), count: 1))
            default: break
            }
        }
        while arrayOfString.contains("+") || arrayOfString.contains("-") {
            guard let i = arrayOfString.firstIndex(where: { $0 == "+" || $0 == "-"}) else { break }
            switch arrayOfString[i] {
            case "+":
                arrayOfString.replaceSubrange(i-1...i+1, with: repeatElement(String(Double(arrayOfString[i-1])! + Double(arrayOfString[i+1])!), count: 1))
            case "-":
                arrayOfString.replaceSubrange(i-1...i+1, with: repeatElement(String(Double(arrayOfString[i-1])! - Double(arrayOfString[i+1])!), count: 1))
            default: break
            }
        }
        return Double(arrayOfString[0])!
    }
}
