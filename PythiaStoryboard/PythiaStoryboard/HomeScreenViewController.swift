//  HomeScreenViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 7/18/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {


    @IBOutlet weak var portfolioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let portfolioValue = 10235.25
        let portfolioValueString: String = String(format: "%.2f", portfolioValue)
        portfolioLabel.text = "Portfolio Value: "
            + portfolioValueString
    }
}


