//
//  CalcModel.swift
//  myCalc
//
//  Created by Nizelan on 02.05.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import UIKit

class CalcModel: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func findEqual(string: String) -> Int {
        var arr = [Character]()
        var first: String = ""
        var second: String = ""
        var action: Character
        
        for character in string {
            arr.append(character)
        }
        
        for i in 0..<arr.count {
            if arr[i] != "+" || arr[i] != "-" || arr[i] != "*" || arr[i] != "/" {
                first += String(arr[i])
            } else {
                action = arr[i]
            }
            if arr[i] != "+" || arr[i] != "-" || arr[i] != "*" || arr[i] != "/" {
                second += String(arr[i])
            }
        }
        
        return 0
    }
}
