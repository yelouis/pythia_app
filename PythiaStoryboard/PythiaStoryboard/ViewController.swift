//
//  ViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 7/18/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pythiaLabel: UILabel!
    
    @IBOutlet weak var unlockButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        unlockButton.backgroundColor = .darkGray
        unlockButton.layer.cornerRadius = 15
        unlockButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func toHomeScreen(_ sender: Any) {

        performSegue(withIdentifier: "toHomeScreen", sender: self)
    }
    

}




