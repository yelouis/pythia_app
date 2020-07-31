//  HomeScreenViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 7/18/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

var testingStockList : [Stock] = [
    Stock(ticker: "AAPL", numSharesOwned: 10, currentSharePrice: 10.00),
    Stock(ticker: "TSLA", numSharesOwned: 7, currentSharePrice: 20.11),
    Stock(ticker: "MMM", numSharesOwned: 1, currentSharePrice: 31.20),
    Stock(ticker: "NKE", numSharesOwned: 5, currentSharePrice: 17.69),
    Stock(ticker: "BA", numSharesOwned: 12, currentSharePrice: 11.34),
    Stock(ticker: "AMZN", numSharesOwned: 4, currentSharePrice: 4.56),
    Stock(ticker: "BP", numSharesOwned: 16, currentSharePrice: 2.87),
    Stock(ticker: "CSCO", numSharesOwned: 20, currentSharePrice: 51.22)]

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var investmentsTableView: UITableView!
    
    @IBOutlet weak var portfolioLabel: UILabel!
    @IBOutlet weak var buyingPowerLabel: UILabel!
    @IBOutlet weak var portfolioPerformance: UILabel!
    @IBOutlet weak var graphImage: UIImageView!
    
    // portfolioList is a list of all the tickers a user has investments in
    var portfolioList = [Stock]()
    // watchList is a list of all the tickers a user is watching
    var watchList = [Stock]()
    var buyingPower : Double = 0
    var portfolioValue : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //setting tableView stuff
        investmentsTableView.delegate = self
        investmentsTableView.dataSource = self
        
        //creating accurate portfolioLabel
        portfolioValue = 10235.25
        portfolioLabel.text = "Portfolio Value: $"
            + String(format: "%.2f", portfolioValue)
        
        //creating accurate buyingPowerLabel
        buyingPower = 1500.00
        buyingPowerLabel.text = "Buying Power: $"
            + String(format: "%.2f", buyingPower)
        
        //determine color & look of portfolio performance label
        let startValue : Double = 10276.25
        portfolioPerformance.text = createPerformanceString(startValue:startValue, currValue:portfolioValue)
        portfolioPerformance.textColor = setPerformanceColor (startValue:startValue, currValue:portfolioValue)
        
        
        //TODO This initialization of lists may need to be moved later
        portfolioList.append(Stock(ticker: "TSLA", numSharesOwned: 10))
        watchList.append(Stock(ticker: "AMD"))
    
    }
    
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
    
    
    //Should be run every second or two seconds to make sure the user's portfolio value is constantly kept up to date
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
}

extension HomeScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print ("you tapped me!")
    }
}

extension HomeScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testingStockList.count //This is the number of tickers we want to show at any given time
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "investment", for: indexPath)
        
        let cellStock = testingStockList[indexPath.row]
        let shares = " (x" + String(cellStock.numSharesOwned) + " shares) "
        
        //Randomly makes the current share price either red or green (In actual implementation this will be decided relative to the close price of the previous day)
        let sharePriceAsString = String(cellStock.currentSharePrice)
        let range = (sharePriceAsString as NSString).range(of: sharePriceAsString)
        let coloredSharePrice = NSMutableAttributedString(string: sharePriceAsString)
        let priceChange = Int.random(in: 0...1)
        if (priceChange == 0){
            coloredSharePrice.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], range: range)
        } else {
            coloredSharePrice.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.green], range: range)
        }
        cell.textLabel?.text = cellStock.ticker + shares + (coloredSharePrice.mutableString as String)
        
        return cell
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
    
    // TESTING Initializer for stock user is invested in
    init(ticker : String, numSharesOwned : Int, currentSharePrice : Double){
        self.ticker = ticker
        self.numSharesOwned = numSharesOwned
        self.currentSharePrice = currentSharePrice
        //TODO code to get current share price and set it
    }
    
    func updatePrice(){
        //TODO code to get current share price and set it
    }
}

