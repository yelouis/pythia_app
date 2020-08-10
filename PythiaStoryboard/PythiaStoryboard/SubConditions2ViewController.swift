//
//  SubConditions2ViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 8/9/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

class SubConditions2ViewController: UIViewController {
    
    var finalCondition : Condition? = nil //This will be passed back once a user has finished making their condition
    
    //buyWith = false means %, buyWith = true means # of shares
    var topLeftButtonTitle : String = ""
    var topRightButtonTitle : String = ""
    var botLeftButtonTitle : String = "Select Attribute"
    var botRightButtonTitle : String = "Select Attribute"

    var buyWith : Bool = true
    var clickedButton : String = "somethin"
    var ticker : String = ""
    
    var amount : Double = 0
    var isBuyCondition : Bool = true
    
    @IBOutlet weak var topLeftB: UIButton!
    @IBOutlet weak var topRightB: UIButton!
    @IBOutlet weak var botLeftB: UIButton!
    @IBOutlet weak var botRightB: UIButton!
    
    @IBOutlet weak var secondBuyConditionView: UIView!
    
    @IBAction func topLeft(_ sender: Any) {
        clickedButton = "topLeft"
        performSegue(withIdentifier: "toVar", sender: self)
    }
    @IBAction func topRight(_ sender: Any) {
        clickedButton = "topRight"
        performSegue(withIdentifier: "toVar", sender: self)
    }
    @IBAction func botLeft(_ sender: Any) {
        clickedButton = "botLeft"
        performSegue(withIdentifier: "toVar", sender: self)
    }
    @IBAction func botRight(_ sender: Any) {
        clickedButton = "botRight"
        performSegue(withIdentifier: "toVar", sender: self)
    }
    
    @IBAction func pctButton(_ sender: Any) {
        buyWith = false
    }
    
    @IBAction func numSharesButton(_ sender: Any) {
        buyWith = true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toVar" {
            let vc = segue.destination as! StockAttributeViewController
            vc.clickedButton = clickedButton
            vc.topLeftCondition = self.topLeftB.titleLabel!.text!
            vc.topRightCondition = self.topRightB.titleLabel!.text!
            vc.botLeftCondition = self.botLeftB.titleLabel!.text!
            vc.botRightCondition = self.botRightB.titleLabel!.text!
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topLeftB.setTitle(topLeftButtonTitle, for: .normal)
        topRightB.setTitle(topRightButtonTitle, for: .normal)
        botLeftB.setTitle(botLeftButtonTitle, for: .normal)
        botRightB.setTitle(botRightButtonTitle, for: .normal)
        
    }
    
    
}

