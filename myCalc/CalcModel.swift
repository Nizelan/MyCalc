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
        var arrayOfString = [String]()
        let operationPriority: [[MathematicalOperation]] =
            [[.power], [.divide, .multiply], [.add, .substract]]
        
        arrayOfString = stringAsArray(string: string)
        
        if arrayOfString.contains("(") {
            var brackets = 0
            var elementsInBrack: String = ""
            var elementsCount = 0
            
            while arrayOfString.contains("(") {
                let i = arrayOfString.firstIndex(of: "(")!
                
                for index in 0..<arrayOfString.count {
                    if arrayOfString[index + i] == "(" {
                        if brackets == 0 {
                            brackets += 1
                            continue
                        } else {
                            brackets += 1
                        }
                    } else if arrayOfString[index + i] == ")" {
                        brackets -= 1
                    }
                    if brackets > 0 {
                        elementsInBrack += arrayOfString[index + i]
                        elementsCount += 1
                    } else if brackets == 0 {
                        arrayOfString.replaceSubrange(i...i + elementsCount + 1, with: [String(resolve(string: elementsInBrack))])
                        elementsInBrack = ""
                        elementsCount = 0
                        break
                    }
                }
            }
        }
        
        for operations in operationPriority {
            let isStringAnOperationFromCurrentTear: ((String) -> Bool) = { str in
                if let operation = MathematicalOperation(rawValue: str) {
                    return operations.contains(operation)
                } else {
                    return false
                }
            }
            while let i = arrayOfString.firstIndex(where: isStringAnOperationFromCurrentTear) {
                let operation = MathematicalOperation(rawValue: arrayOfString[i])!
                let result = calculate(operand: Double(arrayOfString[i-1])!, operand2: Double(arrayOfString[i+1])!, operation: operation)
                arrayOfString.replaceSubrange(i-1...i+1, with: [String(result)])
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
        default:
            return 0.0
        }
    }
    
    func stringAsArray(string: String) -> Array<String> {
        var string = string
        var array = [String]()
        
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
            if varible != "" {
                array.append(varible)
            }
            guard let action = char else { break }
            array.append(action)
        }
        return array
    }
    
    func findUrHalf(array: Array<String>) -> String {
        var openBracket = 0
        var clouseBracket = 0
        var elementsInBrack: String = ""
        
        for i in 0..<array.count {
            if array[i] == "(" {
                openBracket += 1
            }
            if openBracket > clouseBracket && array[i] != "(" {
                elementsInBrack += array[i]
            }
            if array[i] == ")" {
                clouseBracket += 1
            }
            if openBracket == clouseBracket {
                return String()
            }
        }
        return elementsInBrack
    }
}

