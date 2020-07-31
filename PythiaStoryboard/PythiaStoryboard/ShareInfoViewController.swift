//
//  ShareInfoViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 7/28/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

class ShareInfoViewController: UIViewController {
    
    @IBOutlet weak var currentPriceLabel: UILabel!
    
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var shareNameLabel: UILabel!
    @IBOutlet weak var dynamicPriceLabel: UILabel!
    @IBOutlet weak var fixedBar: UIView!
    
    @IBOutlet weak var yourPositionLabel: UILabel!
    @IBOutlet weak var yourPositionView: UIView!
    @IBOutlet weak var sharesOwnedValueLabel: UILabel!
    
    @IBOutlet weak var tradeButton: UIButton!
    
    @IBOutlet weak var scroll: UIScrollView!
    
    func getCurrentPrice(ticker: String) -> Double {
        if ticker == "WORK" {
            return 28.75
        }
        return 0.0; //Means the ticker wasn't "WORK"
    }
    
    func getShareName(ticker: String) -> String {
        if ticker == "WORK" {
            return "Slack"
        }
        return "N/a" //Means the ticker wasn't "WORK"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //in the future, we will get the string for the ticker from the previous view controller
        
        let ticker : String = "WORK"
        let currentPrice : Double = getCurrentPrice(ticker:ticker)
        
        currentPriceLabel.text = "Current Share Value: $"
            + String(format: "%.2f", currentPrice)
        tickerLabel.text = ticker
        shareNameLabel.text = getShareName(ticker:ticker)
        dynamicPriceLabel.text = String(format: "%.2f", currentPrice)
        
        //round edges of view
        yourPositionView.layer.cornerRadius = 10
        
        sharesOwnedValueLabel.text = String(format: "%d", 10)
        
        tradeButton.layer.cornerRadius = 18
    }
    
    
}
