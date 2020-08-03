//
//  NewAlgorithmViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 7/29/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

class NewAlgorithmViewController: UIViewController {
    
    var ticker : String = ""
    @IBOutlet weak var algoTicLabel: UILabel!
    
    @IBOutlet weak var currentShareValueLabel: UILabel!
    
    @IBOutlet weak var algorithmForShareLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newAlgorithm : Bool = true
        let algorithmName = "MyAlgo"
        
        
        if newAlgorithm {
           algorithmForShareLabel.text = "New Algorithm for " + ticker
        } else {
            algorithmForShareLabel.text = "Trading Conditions for " + algorithmName
        }
        
        algoTicLabel.text = ticker
        
        
        
    }

}
