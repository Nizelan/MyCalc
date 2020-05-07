//
//  CalcModel.swift
//  myCalc
//
//  Created by Nizelan on 02.05.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import UIKit

class CalcModel {
    
    public func resolve(string: String) -> Double {
        var string = string
        var arrayOfString = [String]()
        let operationPriority: [MathematicalOperation] =
            [.power, .divide, .multiply, .add, .substract]
        
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
        
        for x in 0..<operationPriority.count {
            
            while arrayOfString.contains(operationPriority[x].rawValue) {
                guard let i = arrayOfString.firstIndex(where: { $0 == operationPriority[x].rawValue }) else { break }
                if let operation = MathematicalOperation(rawValue: arrayOfString[i]) {
                    let result = calculate(operand: Double(arrayOfString[i-1])!, operand2: Double(arrayOfString[i+1])!, operation: operation)
                    arrayOfString.replaceSubrange(i-1...i+1, with: repeatElement(String(result), count: 1))
                }
            }
            
        }
        return Double(arrayOfString[0])!
    }
    
    func calculate(operand: Double, operand2: Double, operation: MathematicalOperation) -> Double{
        switch operation {
        case .add:
            return operand + operand2
        case .substract:
            return operand - operand2
        case .multiply:
            return operand * operand2
        case .divide:
            return operand / operand2
        case .power:
            return pow(operand, operand2)
        }
    }
}

