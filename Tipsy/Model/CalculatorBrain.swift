//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Darius Turner on 10/28/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    func deselectBtns(btnOne: UIButton, btnTwo: UIButton, btnThree: UIButton) {
        btnOne.isSelected = false
        btnTwo.isSelected = false
        btnThree.isSelected = false
    }
    
    func getFairShare(text: String, percentage: Double, timesSplit: Int) -> String {
        let fairShare = ((Double(text)! * percentage) + Double(text)!) / Double(timesSplit)
        let result = String(format: "%.2f", fairShare)
        
        return result
        
    }
}
