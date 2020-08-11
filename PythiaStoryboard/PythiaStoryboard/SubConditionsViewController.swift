//
//  SubConditionsViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 8/2/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

class SubConditionsViewController: UIViewController {
    
    //var subConditionView: SubConditionView { return self.view as! SubConditionView }
    
    
    var finalCondition : Condition? = nil //This will be passed back once a user has finished making their condition
        
    var leftButtonTitle : String = "Select Attribute"
    var rightButtonTitle : String = "Select Attribute"
    //buyWith = false means %, buyWith = true means # of shares
    var buyWith : Bool = true
    var clickedButton : String = "somethin"
    var ticker : String = ""
    var saveCondition : Bool = true
    var amount : Double = 0
    var isBuyCondition : Bool = true
    var comparatorString : String = ""
    
    //var pctButton : RadioButton = RadioButton.init()
    //var dollarsButton : RadioButton = RadioButton.init()
    
    @IBOutlet weak var comparatorField: UITextField!
    
    @IBOutlet weak var buyAmountField: UITextField!
    
    @IBOutlet weak var leftB: UIButton!
    
    @IBOutlet weak var rightB: UIButton!
    @IBOutlet weak var firstBuyConditionView: UIView!
    
    func saveSubcondition(){
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
        
        var compOneName : String = leftButtonTitle.components(separatedBy: " ")[0]
        var periodOneName : String = leftButtonTitle.components(separatedBy: " ").dropFirst().joined()
        var compTwoName : String = rightButtonTitle.components(separatedBy: " ")[0]
        var periodTwoName : String = rightButtonTitle.components(separatedBy: " ").dropFirst().joined()
        
        var newCondition : Condition = Condition(
            subconditions: [
            Subcondition(
            comparandOne: compOneName,
            periodOne: periodOneName,
            comparandTwo: compTwoName,
            periodTwo: periodTwoName,
            comparator: comparatorString
            )],
            amount: (buyAmountField.text! as NSString).doubleValue,
            condType: newCondType,
            amountType: newAmountType
            )
        
            
        finalCondition = newCondition
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        saveCondition = false
        performSegue(withIdentifier: "saveCondition", sender: self)
    }
    
    @IBAction func pctButton(_ sender: Any) {
        buyWith = false
    }
    
    @IBAction func numSharesButton(_ sender: Any) {
        buyWith = true
    }
    
    @IBAction func rightButton(_ sender: Any) {
        clickedButton = "right"
        comparatorString = comparatorField.text!
        performSegue(withIdentifier: "toVar", sender: self)
    }
    
    @IBAction func leftButton(_ sender: Any) {
        clickedButton = "left"
        comparatorString = comparatorField.text!
        performSegue(withIdentifier: "toVar", sender: self)
    }
    
    @IBAction func addAnd(_ sender: Any) {
        comparatorString = comparatorField.text!
        amount = Double(buyAmountField.text!) ?? 0
        performSegue(withIdentifier: "toDoubleSubCondition", sender: self)
    }
    
    @IBAction func saveCondition(_ sender: Any) {
        saveSubcondition()
        performSegue(withIdentifier: "saveCondition", sender: self)
    }
    
    
    /*
    override func awakeFromNib() {
        
        self.view.layoutIfNeeded()

        //pctButton.isSelected = true
        //dollarsButton.isSelected = false
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        leftB.setTitle(leftButtonTitle, for: .normal)
        rightB.setTitle(rightButtonTitle, for: .normal)
        
        comparatorField.text = comparatorString
        //pctButton.alternateButton = [dollarsButton]
        //dollarsButton.alternateButton = [pctButton]
        
        buyAmountField.text = String(amount)
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
            
            //Sets subconditon
            leftButtonTitle = finalCondition!.subconditions![0].comparandOne
            rightButtonTitle = finalCondition!.subconditions![0].comparandTwo
            comparatorString = finalCondition!.subconditions![0].comparator
            //Need to unpack subconditions of finalCondition
        }
        //Check if finalCondition contains anything, if it does, set all the local variables equal to the ones stored in finalCondition
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveCondition" && saveCondition {
            let vc = segue.destination as! NewAlgorithmViewController
            if isBuyCondition == true {
                vc.buyConditionsList.append(finalCondition!)
            } else {
                vc.sellConditionsList.append(finalCondition!)
            }
        } else if segue.identifier == "toVar" {
            comparatorString = comparatorField.text!
            let vc = segue.destination as! StockAttributeViewController
            vc.amount = amount
            
            vc.clickedButton = clickedButton
            vc.leftCondition = self.leftB.titleLabel!.text!
            vc.rightCondition = self.leftB.titleLabel!.text!
            vc.comparator1 = comparatorString
        } else if segue.identifier == "toDoubleSubCondition" {
            let vc = segue.destination as! SubConditions2ViewController
            vc.topLeftButtonTitle = self.leftB.titleLabel!.text!
            vc.topRightButtonTitle = self.rightB.titleLabel!.text!
            vc.comparator1String = self.comparatorString
            vc.amount = self.amount
            //vc.topLef
        }
        
    }
    
    //save condition button will need to save into finalCondition and set isBuyCondition
}

/*
class SubConditionView: UIView {
    //var makePattern
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 81, green: 165, blue: 186, alpha: 1)
        setupViews()
        //setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(contentView)
        self.addSubview(makePatternButton)
    }
    
    /*
    we may not need this function because we are going to put this view in a stack view
    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        contentView.topAnchor.constraint(equalTo: self., constant: <#T##CGFloat#>)
    }
    */
    
    let contentView: UIView = {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        return view
    }()
    
    let makePatternButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Make Pattern", for: .normal)
        return button
    }()
    
    
}
*/


class RadioButton: UIButton {
    var alternateButton:Array<RadioButton>?

    override func awakeFromNib() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2.0
        self.layer.masksToBounds = true
    }

    func unselectAlternateButtons() {
        if alternateButton != nil {
            self.isSelected = true

            for aButton:RadioButton in alternateButton! {
                aButton.isSelected = false
            }
        } else {
            toggleButton()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        unselectAlternateButtons()
        super.touchesBegan(touches, with: event)
    }

    func toggleButton() {
        self.isSelected = !isSelected
    }

    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.layer.borderColor = CGColor.init(srgbRed: 0, green: 0, blue: 255, alpha: 1)
            } else {
                self.layer.borderColor = CGColor.init(srgbRed: 125, green: 125, blue: 125, alpha: 1)
            }
        }
    }
}

