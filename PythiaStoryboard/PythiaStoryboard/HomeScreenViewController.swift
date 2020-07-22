//  HomeScreenViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 7/18/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {


    @IBOutlet weak var portfolioLabel: UILabel!
    @IBOutlet weak var buyingPowerLabel: UILabel!
    @IBOutlet weak var portfolioPerformance: UILabel!
        
    // portfolioList is a list of all the tickers a user has investments in
    var portfolioList = [TickerShareCombo]()
    var buyingPower : Double = 0
    var portfolioValue : Double = 0
    
    func createPerformanceString (startValue: Double, currValue : Double) -> String {
        let performanceInWindow : Double = currValue - startValue
        let pctPerformanceInWindow : Double = currValue/startValue - 1.0
        let performanceString = "$" + String(format: "%.2f", performanceInWindow) + " (" + String(format: "%.2f", pctPerformanceInWindow) + ")"
        return performanceString
    }
    
    func setPerformanceColor (startValue: Double, currValue: Double) -> UIColor {
        let performanceInWindow : Double = currValue - startValue
        if performanceInWindow > 0 {
            return .green
        } else if performanceInWindow < 0 {
            return .red
        } else {
            return .gray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //creating accurate portfolioLabel
        portfolioValue = 10235.25
        portfolioLabel.text = "Portfolio Value: $"
            + String(format: "%.2f", portfolioValue)
        
        //creating accurate buyingPowerLabel
        buyingPower = 1500.00
        buyingPowerLabel.text = "Buying Power: $" + String(format: "%.2f", buyingPower)
        
        //determine color & look of portfolio performance label
        let startValue : Double = 10276.25
        portfolioPerformance.text = createPerformanceString(startValue, portfolioValue)
        portfolioPerformance.textColor = setPerformanceColor (startValue, portfolioValue)
        
    }
    //Should be run every second or two seconds to make sure the user's portfolio value is constantly kept up to date
    func computePortfolioValue(){
        portfolioList.forEach { tickShare in
            tickShare.updatePrice()
            if (tickShare.difference != 0){
                portfolioValue += tickShare.difference
                tickShare.difference = 0
            }
        }
    }
}

class TickerShareCombo {
    var ticker : String
    var numSharesOwned : Int
    var currentSharePrice : Double
    var historicalSharePrice : Double
    var difference : Double = 0
    
    init(ticker : String, numSharesOwned : Int, currentSharePrice : Double){
        self.ticker = ticker
        self.numSharesOwned = numSharesOwned
        self.currentSharePrice = currentSharePrice
        self.historicalSharePrice = currentSharePrice
    }
    
    // checkPrice
    func updatePrice(){
        //TODO set currentSharePrice here to be equal the tickers current share price
        if (historicalSharePrice != currentSharePrice) {
            difference = currentSharePrice - historicalSharePrice
            historicalSharePrice = currentSharePrice
        }
    }
}


