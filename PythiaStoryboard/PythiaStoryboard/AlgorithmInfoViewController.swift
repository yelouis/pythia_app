//
//  AlgorithmInfoViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 7/30/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

class AlgorithmInfoViewController: UIViewController {
    
    //The conditions will need to be fed in here from a data source depending on what algo is selected
    let conditionList = ["Condition One", "Two", "Three"]
    
    
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
        
        buyDropButton.imageView?.contentMode = .scaleAspectFit
        buyDropButton.imageView?.frame = CGRect(
            origin: buyDropButton.imageView!.center,
            size: CGSize(
                width: buyDropButton.frame.width / 2,
                height: buyDropButton.frame.height / 2))
        
        //transfer in from previous view controller
        algorithmName.text = "myAlgo"
        tickerForAlgorithm.text = "WORK"
        dynamicAlgorithmPrice.text = "$1483.45"
        showStockTrends.titleLabel?.numberOfLines=3
        
        //ConditionTableView shit
        buyConditions.isHidden = true
    }
    
    @IBAction func showBuyConditions(_ sender: Any) {
        if buyConditions.isHidden {
            animate(toggle: true, conditions: buyConditions, buttonPressed: buyDropButton)
        } else {
            animate(toggle: false, conditions: buyConditions, buttonPressed: buyDropButton)
        }
    }
    
    func animate(toggle: Bool, conditions : UITableView, buttonPressed : UIButton) {//Need to have button to change and table to show as arguments in this function
        if toggle {
            //Will need to have arrow change to be upwards facing
            UIView.animate(withDuration: 0.3) {
                conditions.isHidden = false
                buttonPressed.imageView?.image?.rotate(radians: .pi)
            }
        } else {
            //Will need to have arrow change to be downwards facing
            UIView.animate(withDuration: 0.3) {
                conditions.isHidden = true
                buttonPressed.imageView?.image?.rotate(radians: .pi)
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
        return conditionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "condition",
            for: indexPath)//as! ConditionViewCell
        cell.textLabel?.text = conditionList[indexPath.row]
        return cell
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
    
}

class Condition {
    
}

class Subcondition {
    
}
