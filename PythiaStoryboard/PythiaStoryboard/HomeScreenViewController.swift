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
    
    @IBOutlet weak var graphImage: UIImageView!
    
    // portfolioList is a list of all the tickers a user has investments in
    var portfolioList = [Stock]()
    var watchList = [Stock]()
    var buyingPower : Double = 0
    var portfolioValue : Double = 0
    
    func createPerformanceString (startValue: Double, currValue : Double) -> String {
        let performanceInWindow : Double = currValue - startValue
        let pctPerformanceInWindow : Double = (currValue/startValue - 1.00) * 100
        let performanceString = "$" + String(format: "%.2f", performanceInWindow) + " (" + String(format: "%.2f", pctPerformanceInWindow) + "%)"
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
        portfolioPerformance.text = createPerformanceString(startValue:startValue, currValue:portfolioValue)
        portfolioPerformance.textColor = setPerformanceColor (startValue:startValue, currValue:portfolioValue)
        
    }
    //Should be run every second or two seconds to make sure the user's portfolio value is constantly kept up to date
    
    portfolioList.append(newElement: Stock(ticker: "TSLA", numSharesOwned: 10))
    watchList.append(newElement: Stock(ticker: "AMD"))
    
    func computePortfolioValue(){
        var updatedPortfolioValue : Double = 0
        portfolioList.forEach { stock in
            stock.updatePrice()
            updatedPortfolioValue +=  Double(stock.numSharesOwned) * stock.currentSharePrice
        }
        portfolioValue = updatedPortfolioValue
    }
    func updateWatchlist(){
        watchList.forEach { stock in
            stock.updatePrice()
        
    }
}

class Stock {
    var ticker : String
    var numSharesOwned : Int
    var currentSharePrice : Double
    
    // Initalizer for stock user is watching
    init(ticker : String) {
        self.ticker = ticker
        self.numSharesOwned = 0
        self.currentSharePrice = 0
        //TODO code to get current share price and set it
    }
    
    // Initializer for stock user is invested in
    init(ticker : String, numSharesOwned : Int){
        self.ticker = ticker
        self.numSharesOwned = numSharesOwned
        self.currentSharePrice = 0
        //TODO code to get current share price and set it
    }
    
    func updatePrice(){
        //TODO code to get current share price and set it
    }
}

