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
    var buyConditionsList : [Condition] = [Condition(
    subconditions: [
        Subcondition(
        comparandOne: "Open",
        periodOne: "5 day prev",
        comparandTwo: "Open",
        periodTwo: "today",
        comparator: ">"),
        
        Subcondition(
        comparandOne: "80% of Close",
        periodOne: "30 day prev",
        comparandTwo: "Close",
        periodTwo: "today",
        comparator: "<")
        ],
    amount: 10,
    condType: 0,
    amountType: 0)]
    var sellConditionsList : [Condition] = []
    
    var selectedCondition : Condition?
    
    
    @IBOutlet weak var algoTicLabel: UILabel!
    @IBOutlet weak var currentShareValueLabel: UILabel!
    @IBOutlet weak var algorithmForShareLabel: UILabel!
    
    
    @IBOutlet weak var unsavedBuyConditions: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        unsavedBuyConditions.delegate = self
        unsavedBuyConditions.dataSource = self
        
        let newAlgorithm : Bool = true
        let algorithmName = "MyAlgo"
        
        
        if newAlgorithm {
           algorithmForShareLabel.text = "New Algorithm for " + ticker
        } else {
            algorithmForShareLabel.text = "Trading Conditions for " + algorithmName
        }
        
        
        //ifConditionsExist() //This runs to make sure any existing conditions are shown
        algoTicLabel.text = ticker

    }
    
    
    @IBAction func modifyCondition(_ sender: Any) {
        selectedCondition = buyConditionsList[0]
        performSegue(withIdentifier: "toSubConditions", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSubConditions"{
            let vc = segue.destination as! SubConditionsViewController
            vc.finalCondition = selectedCondition!
        } else if segue.identifier == "newCondition"{
            let vc = segue.destination as! SubConditionsViewController
            vc.finalCondition = nil
        } else {
            let vc = segue.destination as! AlgorithmInfoViewController
            vc.buyConditionList = self.buyConditionsList
            vc.sellConditionList = self.sellConditionsList
        }
    }

    func ifConditionsExist() {
        if buyConditionsList.count == 0 {
            unsavedBuyConditions.isHidden = true
        } else {
            unsavedBuyConditions.isHidden = false
        }
        
        if sellConditionsList.count == 0 {
            //unsavedSellConditions.isHidden = true
        } else {
            //unsavedSellConditions.isHidden = false
        }
    }
    
    @IBAction func addBuyCondition(_ sender: Any) {
        performSegue(withIdentifier: "newCondition", sender: self)
    }
    
    @IBAction func addSellCondition(_ sender: Any) {
    }
    @IBAction func backtestAlgorithm(_ sender: Any) {
    }
}

extension NewAlgorithmViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == unsavedBuyConditions{
            selectedCondition = buyConditionsList[indexPath.row]
        } else {
            selectedCondition = sellConditionsList[indexPath.row]
        }
    }
}
extension NewAlgorithmViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == unsavedBuyConditions{
            return buyConditionsList.count //This is the number of algos we want to show at any given time
        } else {
            return sellConditionsList.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //if tableView == unsavedBuyConditions {
        let cell = tableView.dequeueReusableCell(withIdentifier: "unsavedBuyCondition", for: indexPath)as! ConditionEditCell
            cell.setShit(cond: buyConditionsList[indexPath.row])
        return cell
        //}
    }
}

class ConditionEditCell : UITableViewCell {
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var subconditions: UIStackView!
    
    var isClicked : Bool = false
    
        //var pattern : Pattern? (Need to make a class for this)
    var compAtts : [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Kefa", size: CGFloat(14))]
       
    var periodAtts : [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.systemGray4, NSAttributedString.Key.font: UIFont(name: "Kefa", size: CGFloat(14))]
       
    var andAtts :[NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.backgroundColor: UIColor.systemGray4, NSAttributedString.Key.font: UIFont(name: "Kefa", size: CGFloat(14))]
    
    
    func setShit(cond : Condition){
        for subcondition in cond.subconditions!{
            addSubcondition(sub: subcondition)
        }
        
        if cond.condType == 0 { //Buy conditions
            if cond.amountType == 0 {
                amountLabel.attributedText = NSAttributedString(string: String(cond.amount) + "% of available cash", attributes: compAtts)
            } else {
                amountLabel.attributedText = NSAttributedString(string: String(cond.amount) + " shares" , attributes: compAtts)
            }
        } else { //Sell conditions
            if cond.amountType == 0 {
                amountLabel.attributedText = NSAttributedString(string: String(cond.amount) + "% of equity", attributes: compAtts)
            } else {
                amountLabel.attributedText = NSAttributedString(string: String(cond.amount) + " shares of equity", attributes: compAtts)
            }
        }
    }
    
    func addSubcondition(sub : Subcondition){
        let conditionLabel : UILabel =
            UILabel()
        conditionLabel.numberOfLines = 0
        conditionLabel.attributedText = NSAttributedString(string: sub.comparandOne, attributes: compAtts) + NSAttributedString(string:" (" + sub.periodOne + ")", attributes: periodAtts) + NSAttributedString(string: " " + sub.comparator + " ", attributes: compAtts) + NSAttributedString(string: sub.comparandTwo, attributes: compAtts) + NSAttributedString(string:" (" + sub.periodTwo + ")", attributes: periodAtts)
            
        if (subconditions.subviews.count == 0){
            subconditions.addArrangedSubview(conditionLabel)
        } else {
            let andLabel : UILabel = UILabel()
                andLabel.attributedText =
                NSAttributedString(string: "AND", attributes: andAtts)
            //extendView()
            subconditions.addArrangedSubview(andLabel)
            subconditions.addArrangedSubview(conditionLabel)
        }
    }
    /*
    func addPattern(pat : Pattern){
            
    }
    */
        
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}
