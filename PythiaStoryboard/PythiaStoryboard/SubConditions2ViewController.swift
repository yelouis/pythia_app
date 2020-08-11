//
//  SubConditions2ViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 8/9/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

class SubConditions2ViewController: UIViewController {
    var saveCondition : Bool = false
    var finalCondition : Condition? = nil //This will be passed back once a user has finished making their condition

    var comparator1String : String = ""
    var comparator2String : String = ""
    
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
    
    @IBOutlet weak var comparator1Field: UITextField!
    @IBOutlet weak var comparator2Field: UITextField!
    
    @IBOutlet weak var secondBuyConditionView: UIView!
    
    func saveSubconditions(){
        var newCondType : Int
        var newAmountType: Int
        if isBuyCondition == true{
            newCondType = 0
        } else {
            newCondType = 1
        }
        if buyWith == true {
            newAmountType = 0
        } else {
            newAmountType = 1
        }
        
        var compOneName : String = topLeftButtonTitle.components(separatedBy: " ")[0]
        var periodOneName : String = topLeftButtonTitle.components(separatedBy: " ").dropFirst().joined()
        var compTwoName : String = topRightButtonTitle.components(separatedBy: " ")[0]
        var periodTwoName : String = topRightButtonTitle.components(separatedBy: " ").dropFirst().joined()
        
        var comp2OneName : String = topLeftButtonTitle.components(separatedBy: " ")[0]
        var period2OneName : String = topLeftButtonTitle.components(separatedBy: " ").dropFirst().joined()
        var comp2TwoName : String = topRightButtonTitle.components(separatedBy: " ")[0]
        var period2TwoName : String = topRightButtonTitle.components(separatedBy: " ").dropFirst().joined()
        
        var newCondition : Condition = Condition(
            subconditions: [
        Subcondition(
        comparandOne: compOneName,
        periodOne: periodOneName,
        comparandTwo: compTwoName,
        periodTwo: periodTwoName,
        comparator: comparator1String
        ),
        Subcondition(
        comparandOne: comp2OneName,
        periodOne: period2OneName,
        comparandTwo: comp2TwoName,
        periodTwo: period2TwoName,
        comparator: comparator2String
        )],
            amount: (buyAmountField.text! as NSString).doubleValue,
        condType: newCondType,
        amountType: newAmountType)
        finalCondition = newCondition
    }
    
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
    
    @IBOutlet weak var pctOutlet: RadioButton!
    
    @IBOutlet weak var numSharesOutlet: RadioButton!
    

    @IBAction func saveButton(_ sender: Any) {
        saveCondition = true
        performSegue(withIdentifier: "saveCondition", sender: self)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        performSegue(withIdentifier:
            "saveCondition", sender: self)
    }
    
    
    
    @IBOutlet weak var buyAmountField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toVar" {
            comparator1String = comparator1Field.text!
            comparator2String = comparator2Field.text!
            let vc = segue.destination as! StockAttributeViewController
            vc.clickedButton = clickedButton
            vc.topLeftCondition = self.topLeftB.titleLabel!.text!
            vc.topRightCondition = self.topRightB.titleLabel!.text!
            vc.botLeftCondition = self.botLeftB.titleLabel!.text!
            vc.botRightCondition = self.botRightB.titleLabel!.text!
            vc.comparator1 = comparator1String
            vc.comparator2 = comparator2String
            vc.amount = amount
        }
        if segue.identifier == "saveCondition" && saveCondition {
            let vc = segue.destination as! NewAlgorithmViewController
            saveSubconditions()
            if isBuyCondition == true {
                vc.buyConditionsList.append(finalCondition!)
            } else {
                vc.sellConditionsList.append(finalCondition!)
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if finalCondition != nil{
            if finalCondition!.condType == 0{
                isBuyCondition = true
            } else {
                isBuyCondition = false
            }
            self.amount = finalCondition!.amount
            if finalCondition!.amountType == 0 {
                buyWith = false
            } else {
                buyWith = true
            }
            
            //Sets subconditons
            topLeftButtonTitle = finalCondition!.subconditions![0].comparandOne
            topRightButtonTitle = finalCondition!.subconditions![0].comparandTwo
            comparator1String = finalCondition!.subconditions![0].comparator
            
            botLeftButtonTitle = finalCondition!.subconditions![1].comparandOne
            botRightButtonTitle = finalCondition!.subconditions![1].comparandTwo
            comparator2String = finalCondition!.subconditions![1].comparator
            //Need to unpack subconditions of finalCondition
        }
        if buyWith == true {
            numSharesOutlet.isSelected = true
            pctOutlet.isSelected = false
        } else {
            numSharesOutlet.isSelected = false
            pctOutlet.isSelected = true
        }
        
        topLeftB.setTitle(topLeftButtonTitle, for: .normal)
        topRightB.setTitle(topRightButtonTitle, for: .normal)
        botLeftB.setTitle(botLeftButtonTitle, for: .normal)
        botRightB.setTitle(botRightButtonTitle, for: .normal)
        
        comparator1Field.text = comparator1String
        comparator2Field.text = comparator2String
        
        buyAmountField.text = String(amount)
        
    }
}

