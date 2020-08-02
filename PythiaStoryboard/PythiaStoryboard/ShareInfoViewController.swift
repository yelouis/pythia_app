//
//  ShareInfoViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 7/28/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

class ShareInfoViewController: UIViewController {
    var ticker = ""
    var currentPrice = 0.0
    @IBOutlet weak var currentPriceLabel: UILabel!
    
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var shareNameLabel: UILabel!
    @IBOutlet weak var dynamicPriceLabel: UILabel!
    @IBOutlet weak var fixedBar: UIView!
    
    @IBOutlet weak var yourPositionLabel: UILabel!
    @IBOutlet weak var yourPositionView: UIView!
    @IBOutlet weak var sharesOwnedValueLabel: UILabel!
    @IBOutlet weak var marketValueLabel: UILabel!
    @IBOutlet weak var averageCostLabel: UILabel!
    @IBOutlet weak var totalReturnLabel: UILabel!
    
    @IBOutlet weak var tradeButton: UIButton!
    
    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var algoTable: UITableView!
    
    
    let transparentView = UIView()
    
    func addTransparentView() {
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparentView)
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        
        transparentView.addGestureRecognizer(tapgesture)
        transparentView.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut,  animations: {self.transparentView.alpha = 0.7}, completion: nil)
    }

    @objc func removeTransparentView() {
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut,  animations: {self.transparentView.alpha = 0.0}, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! NewAlgorithmViewController
        vc.ticker = self.ticker
    }
    
    @IBAction func tradeButton(_ sender: Any) {
        addTransparentView()
        performSegue(withIdentifier: "toNewAlgo", sender: self)
    }
    
    
    
    
    /*
    func getCurrentPrice(ticker: String) -> Double {
        if ticker == "WORK" {
            return 28.75
        }
        
        return 0.0; //Means the ticker wasn't "WORK"
    }
    */
    
    func getShareName(ticker: String) -> String {
        if ticker == "WORK" {
            return "Slack"
        }
        if ticker == "AAPL" {
            return "Apple"
        }
        if ticker == "AMZN" {
            return "Amazon"
        }
        if ticker == "TSLA" {
            return "Tesla"
        }
        if ticker == "BA" {
            return "Boeing"
        }
        if ticker == "MMM" {
            return "3M"
        }
        if ticker == "NKE" {
            return "Nike"
        }
        if ticker == "BP" {
            return "British Petroleum"
        }
        if ticker == "CSCO" {
            return "Cisco"
        }
        return "N/a" //Means the ticker wasn't "WORK"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //in the future, we will get the string for the ticker from the previous view controller
        
        
        //let currentPrice : Double = getCurrentPrice(ticker:ticker)
        
        let sharesOwned : Int = 10
        let averageCost : Double = currentPrice - 1.52
        currentPriceLabel.text = "Current Share Value: $"
            + String(format: "%.2f", currentPrice)
        tickerLabel.text = ticker
        shareNameLabel.text = getShareName(ticker:ticker)
        dynamicPriceLabel.text = "$" + String(format: "%.2f", currentPrice)
        
        //round edges of view
        yourPositionView.layer.cornerRadius = 10
        
        sharesOwnedValueLabel.text = String(format: "%d", sharesOwned)
        marketValueLabel.text = "$" + String(format: "%.2f", Double(sharesOwned) * currentPrice)
        averageCostLabel.text = "$" + String(format: "%.2f", averageCost)
        totalReturnLabel.text = "$" + String(format: "%.2f", (currentPrice - averageCost) * Double(sharesOwned))
        
        
        tradeButton.layer.cornerRadius = 18
    }
    
    
}
