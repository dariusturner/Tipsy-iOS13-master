//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Darius Turner on 10/27/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total: String?
    var timesSplit: Int?
    var percent: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = total
        settingsLabel.text = "Split between \(timesSplit ?? 2) people, with \(Int(percent ?? 0.1 * 100))% tip."
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
