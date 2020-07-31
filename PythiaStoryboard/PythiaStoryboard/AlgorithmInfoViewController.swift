//
//  AlgorithmInfoViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 7/30/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

class AlgorithmInfoViewController: UIViewController {
    
    @IBOutlet weak var tickerForAlgorithm: UILabel!
    
    @IBOutlet weak var algorithmName: UILabel!
    @IBOutlet weak var dynamicAlgorithmPrice: UILabel!
    @IBOutlet weak var currentShareValueLabel: UILabel!
    override func viewDidLoad() {
           super.viewDidLoad()
        //transfer in from previous view controller
        algorithmName.text = "myAlgo"
        tickerForAlgorithm.text = "WORK"
        dynamicAlgorithmPrice.text = "$1483.45"
        
    }
    
}
