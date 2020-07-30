//
//  NewAlgorithmViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 7/29/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

class NewAlgorithmViewController: UIViewController {
    
    
    @IBOutlet weak var currentShareValueLabel: UILabel!
    
    @IBOutlet weak var algorithmForShareLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ticker : String = "WORK"
        
        algorithmForShareLabel.text = "New Algorithm for " + ticker
        
    }

}
