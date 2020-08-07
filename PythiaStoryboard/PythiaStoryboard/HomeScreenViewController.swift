//  HomeScreenViewController.swift
//  PythiaStoryboard
//
//  Created by Nathaniel Veimau (old comp) on 7/18/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import UIKit

var investmentList : [Stock] = [
    Stock(ticker: "AAPL", numSharesOwned: 10, currentSharePrice: 10.00),
    Stock(ticker: "TSLA", numSharesOwned: 7, currentSharePrice: 20.11),
    Stock(ticker: "MMM", numSharesOwned: 1, currentSharePrice: 31.20),
    Stock(ticker: "NKE", numSharesOwned: 5, currentSharePrice: 17.69),
    Stock(ticker: "BA", numSharesOwned: 12, currentSharePrice: 11.34),
    Stock(ticker: "AMZN", numSharesOwned: 4, currentSharePrice: 4.56),
    Stock(ticker: "BP", numSharesOwned: 16, currentSharePrice: 2.87),
    Stock(ticker: "CSCO", numSharesOwned: 20, currentSharePrice: 51.22)]

var interestList : [Stock] = [
    Stock(ticker: "HEXO", currentSharePrice: 10.00),
    Stock(ticker: "SUMR", currentSharePrice: 20.11),
    Stock(ticker: "AXTA", currentSharePrice: 31.20),
    Stock(ticker: "TEAM", currentSharePrice: 17.69),
    Stock(ticker: "TCEHY", currentSharePrice: 11.34),
    Stock(ticker: "SPYD", currentSharePrice: 4.56)]

class HomeScreenViewController: UIViewController {
    
    var cellTicker : String = ""
    var cellPrice : Double = 0.0
    
    @IBOutlet weak var investmentsTableView: UITableView!
    @IBOutlet weak var interestsTableView: UITableView!
    
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
        interestsTableView.delegate = self
        interestsTableView.dataSource = self
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //WILL REPLACE WITH A SWITCH CASE
        if segue.identifier == "toShareInfo" {
            let vc = segue.destination as! ShareInfoViewController
            vc.ticker = self.cellTicker
            vc.currentPrice = self.cellPrice
        }
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
            //TODO NEED TO FIND A WAY TO RUN updatePriceLabel() from StockTableViewCell class
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
        if tableView == investmentsTableView{
            cellTicker = investmentList[indexPath.row].ticker
            cellPrice = investmentList[indexPath.row].currentSharePrice
        } else {
            cellTicker = interestList[indexPath.row].ticker
            cellPrice = interestList[indexPath.row].currentSharePrice
        }
        performSegue(withIdentifier: "toShareInfo", sender: self)
    }
}

func + (left: NSAttributedString, right: NSAttributedString) -> NSAttributedString
{
    let result = NSMutableAttributedString()
    result.append(left)
    result.append(right)
    return result
}

extension HomeScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == investmentsTableView{
            return investmentList.count //This is the number of tickers we want to show at any given time
        } else {
            return interestList.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == investmentsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "investment", for: indexPath)as! StockTableViewCell

            let cellStock = investmentList[indexPath.row]
            cell.setInvestmentCell(ticker: cellStock.ticker, numSharesOwned: cellStock.numSharesOwned, currentSharePrice: cellStock.currentSharePrice)
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "interest", for: indexPath)as! StockTableViewCell

            let cellStock = interestList[indexPath.row]
            cell.setInterestCell(ticker: cellStock.ticker, currentSharePrice: cellStock.currentSharePrice)
            return cell
        }
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
    
    // TESTING Initializer for stock user is watching
    init(ticker : String, currentSharePrice : Double){
        self.ticker = ticker
        self.numSharesOwned = 0
        self.currentSharePrice = currentSharePrice
        //TODO code to get current share price and set it
    }
    
    func updatePrice(){
        //TODO code to get current share price and set it
    }
}

class StockTableViewCell : UITableViewCell{
    
    //This stack view holds the three parts of a Stock object (Consider replacing the three variables with a stock object??)
    @IBOutlet weak var cellHorizontalStackView: UIStackView!
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var tickerAtts : [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.white]
    var sharesAtts : [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont(name: "Kefa", size: 10.0)]
    var priceAtts : [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.black]
   
    //The function name is pretty intuitive (In case it isn't: This function is called upon creation of any StockTableViewCell in order to make sure it has the right variables and formatting
    func setInvestmentCell(ticker : String, numSharesOwned : Int?, currentSharePrice : Double){
           
        let nsTicker : NSAttributedString = NSMutableAttributedString(string: "   " + ticker, attributes: tickerAtts)
        let nsShares : NSAttributedString = NSMutableAttributedString(string: "(" + String(numSharesOwned!) + " shares)", attributes: sharesAtts)
        var nsPrice : NSAttributedString = NSMutableAttributedString(string: String(currentSharePrice) + "   ", attributes: priceAtts)
        
        let priceChange = Int.random(in: 0...1)
        
        //Temporary random setting of current price colors to simulate if our shit actually had access to realtime data
        if (priceChange == 0){
            nsPrice = NSAttributedString(string: String(currentSharePrice), attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        } else {
            nsPrice = NSAttributedString(string: String(currentSharePrice), attributes: [NSAttributedString.Key.foregroundColor: UIColor.green])
        }
        //Setting the cell visuals
        tickerLabel.attributedText = nsTicker
        shareLabel.attributedText = nsShares
        priceLabel.attributedText = nsPrice
        
        cellHorizontalStackView.addArrangedSubview(tickerLabel!)
        cellHorizontalStackView.addArrangedSubview(shareLabel!)
        cellHorizontalStackView.addArrangedSubview(priceLabel!)
    }
    
    func setInterestCell(ticker : String, currentSharePrice : Double){
    
        let nsTicker : NSAttributedString = NSMutableAttributedString(string: "   " + ticker, attributes: tickerAtts)
        var nsPrice : NSAttributedString = NSMutableAttributedString(string: String(currentSharePrice) + "   ", attributes: priceAtts)
        
        let priceChange = Int.random(in: 0...1)
        
        //Temporary random setting of current price colors to simulate if our shit actually had access to realtime data
        if (priceChange == 0){
            nsPrice = NSAttributedString(string: String(currentSharePrice), attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        } else {
            nsPrice = NSAttributedString(string: String(currentSharePrice), attributes: [NSAttributedString.Key.foregroundColor: UIColor.green])
        }
        //Setting the cell visuals
        tickerLabel.attributedText = nsTicker
        priceLabel.attributedText = nsPrice
        
        cellHorizontalStackView.addArrangedSubview(tickerLabel!)

        cellHorizontalStackView.addArrangedSubview(priceLabel!)
    }
    
    //This will run alongside the price updating on our stock list in order to see if the label needs to be green or red
    func updatePriceLabel(newPrice : Double){
        let prevPrice = (priceLabel.attributedText!.string as NSString).doubleValue
        if (newPrice >= prevPrice){
            let nsPrice : NSAttributedString = NSMutableAttributedString(string: String(prevPrice), attributes: [NSAttributedString.Key.foregroundColor: UIColor.green])
            priceLabel.attributedText = nsPrice
        } else {
            let nsPrice : NSAttributedString = NSMutableAttributedString(string: String(prevPrice), attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            priceLabel.attributedText = nsPrice
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}
