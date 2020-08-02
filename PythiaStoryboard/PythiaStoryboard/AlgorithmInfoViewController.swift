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
    //Buy conditions outlets
    @IBOutlet weak var buyStackView: UIStackView!
    @IBOutlet weak var buyDropButton: UIButton!
    @IBOutlet weak var buyConditions: UITableView!
    
    //Algo information outlets
    @IBOutlet weak var algorithmName: UILabel!
    @IBOutlet weak var dynamicAlgorithmPrice: UILabel!
    @IBOutlet weak var currentShareValueLabel: UILabel!
    override func viewDidLoad() {
           super.viewDidLoad()
        //transfer in from previous view controller
        algorithmName.text = "myAlgo"
        tickerForAlgorithm.text = "WORK"
        dynamicAlgorithmPrice.text = "$1483.45"
        showStockTrends.titleLabel?.numberOfLines=3
        
    }
    
    @IBAction func showBuyConditions(_ sender: Any) {
    }
}

extension AlgorithmInfoViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me and I am a condition")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conditionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "investment", for: indexPath)as! StockTableViewCell
        cell.textLabel?.text = conditionList[indexPath.row]
        return cell
    }
    
    
}

class Condition {
    
}

class Subcondition {
    
}
