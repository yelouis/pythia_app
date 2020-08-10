//
//  StockAttributeViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 8/9/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

class StockAttributeViewController: UIViewController {
    
    var amount : Double = 0
    var comparator1 : String = "willBeSet"
    var comparator2 : String = "willBeSet"
    var clickedButton : String = "willBeSet"
    var leftCondition : String = "willBeSet"
    var rightCondition : String = "willBeSet"
    
    var topLeftCondition : String = "willBeSet"
    var topRightCondition : String = "willBeSet"
    var botLeftCondition : String = "willBeSet"
    var botRightCondition : String = "willBeSet"
    
    var subcondition : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var stockAttrText: UITextField!
    @IBOutlet weak var timeCompText: UITextField!
    
    
    @IBAction func saveComparand(_ sender: Any) {
        subcondition = stockAttrText.text! + " (" +  timeCompText.text! + ")"
        if clickedButton == "left" || clickedButton == "right" {
            performSegue(withIdentifier: "toSingleSubCondition", sender: self)
        } else {
            performSegue(withIdentifier: "toDoubleSubCondition", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSingleSubCondition" {
            let vc = segue.destination as! SubConditionsViewController
            vc.comparatorString = self.comparator1
            vc.amount = amount
            if clickedButton == "left" {
                print(subcondition)
                vc.leftButtonTitle = subcondition
                vc.rightButtonTitle = rightCondition
            } else if clickedButton == "right" {
                vc.rightButtonTitle = subcondition
                vc.leftButtonTitle = leftCondition
            }
        } else if segue.identifier == "toDoubleSubCondition" {
            let vc = segue.destination as! SubConditions2ViewController
            vc.amount = amount
            //don't edit top conditions in doubleSubConditionsVC
            vc.topRightButtonTitle = topRightCondition
            vc.topLeftButtonTitle = topLeftCondition
            vc.comparator1String = self.comparator1
            vc.comparator2String = self.comparator2
            if clickedButton == "botLeft" {
                vc.botLeftButtonTitle = subcondition
                vc.botRightButtonTitle = botRightCondition
            } else if clickedButton == "botRight" {
                vc.botRightButtonTitle = subcondition
                vc.botLeftButtonTitle = botLeftCondition
            }
        }
    }
}
