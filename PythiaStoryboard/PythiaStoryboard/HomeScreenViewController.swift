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
    
    // tickShareList is a list of all the tickers a user has investments in
    var tickShareList = [TickerShareCombo]()
    var buyingPower = 0
    var portfolioValue : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        portfolioValue = 10235.25
        let portfolioValueString: String = String(format: "%.2f", portfolioValue)
        portfolioLabel.text = "Portfolio Value: $"
            + portfolioValueString
        buyingPower = 1500
        let buyingPowerString: String = String(format: "%.2f", buyingPower)
        buyingPowerLabel.text = "Buying Power: $" + buyingPowerString
    }
    //Should be run every second or two seconds to make sure the user's portfolio value is constantly kept up to date
    func computePortfolioValue(){
        tickShareList.forEach { tickShare in
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


