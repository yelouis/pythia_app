//
//  AlgorithmInfoViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 7/30/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

class AlgorithmInfoViewController: UIViewController {
    var ticker = ""
    var currentPrice = 0.0
    var algoName = ""
    
    var buyGreen : UIColor = UIColor(red: CGFloat(62), green: CGFloat(79), blue: CGFloat(51), alpha: CGFloat(1))
    var sellRed : UIColor = UIColor(red: CGFloat(79), green: CGFloat(51), blue: CGFloat(51), alpha: CGFloat(1))
    
    
    //The conditions will need to be fed in here from a data source depending on what algo is selected
    var buyConditionList : [Condition] = [Condition(
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
    
    var sellConditionList : [Condition] = [Condition(
       subconditions: [
           Subcondition(
           comparandOne: "Close",
           periodOne: "5 day prev",
           comparandTwo: "Close",
           periodTwo: "today",
           comparator: "<")],
       amount: 20,
       condType: 1,
       amountType: 1)]
    
    //Need to make outlets for both table views and then set delegates to self
    
    @IBOutlet weak var showStockTrends: UIButton!
    @IBOutlet weak var tickerForAlgorithm: UILabel!
    
    //Conditions outlets
    @IBOutlet weak var buyDropButton: UIButton!
    @IBOutlet weak var buyConditions: UITableView!
            
    @IBOutlet weak var sellDropButton: UIButton!
    @IBOutlet weak var sellConditions: UITableView!
    
    
    //Algo information outlets
    @IBOutlet weak var algorithmName: UILabel!
    @IBOutlet weak var dynamicAlgorithmPrice: UILabel!
    @IBOutlet weak var currentShareValueLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buyConditions.delegate = self
        buyConditions.dataSource = self
        buyConditions.isHidden = true
        
        sellConditions.delegate = self
        sellConditions.dataSource = self
        sellConditions.isHidden = true
        //makeImageSmaller(button: buyDropButton)
        
        //transfer in from previous view controller
        algorithmName.text = algoName
        tickerForAlgorithm.text = ticker
        dynamicAlgorithmPrice.text = "$1483.45"
        showStockTrends.titleLabel?.numberOfLines=3
        currentShareValueLabel.text! = String(currentPrice)
    }
    
    func makeImageSmaller(button : UIButton){
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.frame = CGRect(
            origin: button.imageView!.center,
            size: CGSize(
                width: button.frame.width / 2,
                height: button.frame.height / 2))
    }
    
    @IBAction func showBuyConditions(_ sender: Any) {
        if buyConditions.isHidden {
            animate(toggle: true, conditions: buyConditions, buttonPressed: buyDropButton)
        } else {
            animate(toggle: false, conditions: buyConditions, buttonPressed: buyDropButton)
        }
    }
    
    @IBAction func showSellConditions(_ sender: Any) {
        if sellConditions.isHidden {
            animate(toggle: true, conditions: sellConditions, buttonPressed: sellDropButton)
        } else {
            animate(toggle: false, conditions: sellConditions, buttonPressed: sellDropButton)
        }
    }
    
    func animate(toggle: Bool, conditions : UITableView, buttonPressed : UIButton) {//Need to have button to change and table to show as arguments in this function
        if toggle {
            //Will need to have arrow change to be upwards facing
            UIView.animate(withDuration: 0.3) {
                conditions.isHidden = false
               // buttonPressed.imageView?.image?.rotate(radians: .pi)
            }
        } else {
            //Will need to have arrow change to be downwards facing
            UIView.animate(withDuration: 0.3) {
                conditions.isHidden = true
                //buttonPressed.imageView?.image?.rotate(radians: .pi)
            }
        }
    }
}

extension AlgorithmInfoViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //This will become a segue
        print("you tapped me and I am a condition")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == buyConditions{
            return buyConditionList.count
        } else {
            return sellConditionList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == buyConditions{
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "buyCondition",
                for: indexPath)as! ConditionViewCell
            
            let cellCondition = buyConditionList[indexPath.row]
            cell.backgroundColor = UIColor.green
            cell.setShit(cond: cellCondition)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "sellCondition",
                for: indexPath)as! ConditionViewCell
            
            let cellCondition = sellConditionList[indexPath.row]
            cell.backgroundColor = UIColor.red
            cell.setShit(cond: cellCondition)
            return cell
        }
    }
}

extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return rotatedImage ?? self
        }

        return self
    }
}

class ConditionViewCell : UITableViewCell {
    
    @IBOutlet weak var buyLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var subconditions: UIStackView!
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

class Condition: Equatable {
    
    static func == (left: Condition, right: Condition) -> Bool {
        if left.subconditions!.count != right.subconditions!.count {
            return false
        }
        for i in 0...left.subconditions!.count - 1 {
            let l : Subcondition = left.subconditions![i]
            let r : Subcondition = right.subconditions![i]
            if (r == l) == false {
                return false
            }
        }
        return true
    }
    //subconditions and pattern are optionals because a user could make a subcondition that is either a list of subconditions or use a pattern they draw
    var subconditions : [Subcondition]?
    //var pattern : Pattern? (Need to make a class for this)
    var amount : Double //Double will work for both percentage amounts and "number of shares" amounts
    var condType : Int // 0 - Buy condition, 1 - Sell condition
    var amountType : Int // 0 - Percentage of balance, 1 - Set number of stocks
    
    init(subconditions : [Subcondition], amount : Double, condType : Int, amountType : Int){
        self.subconditions = subconditions
        self.amount = amount
        self.condType = condType
        self.amountType = amountType
    }
    
    /* Will be needed once Pattern is created
    init(pattern : Pattern, amount : Double, condType : Int, amountType : Int){
        self.amount = amount
        self.condType = condType
        self.amountType = amountType
    }
    */
    
}

class Subcondition: Equatable {
    var comparandOne : String
    var periodOne : String
    var comparandTwo : String
    var periodTwo : String
    var comparator : String
    
    static func == (left: Subcondition, right: Subcondition) -> Bool {
        if left.comparandOne != right.comparandOne || left.periodOne != right.periodOne || left.comparandTwo != right.comparandTwo || left.periodTwo != right.periodTwo || left.comparator != right.comparator {
            return false
        }
        return true
    }
    
    init(comparandOne : String, periodOne: String, comparandTwo : String, periodTwo : String, comparator : String){
        self.comparandOne = comparandOne
        self.periodOne = periodOne
        self.comparandTwo = comparandTwo
        self.periodTwo = periodTwo
        self.comparator = comparator
    }
}
