/*
    Algorithm.swift
    PythiaSwift
 
    Created by Louis Ye on 8/27/20.
    Copyright © 2020 Louis Ye. All rights reserved.
 
    Abstract:
    The model for an individual landmark.
*/

import SwiftUI
import CoreLocation

struct Algorithm: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var buyCondition: [AlgoCondition]
    var sellCondition: [AlgoCondition]
    var algoReturns : AlgoReturns
    var currentShares : Int
    var smallGraph: String
    var bigGraph: String
}

struct AlgoReturns: Hashable, Codable{
    var amount: Float
    var type: String
}

struct AlgoCondition: Hashable, Codable, Identifiable{
    var id: Int
    var subCondition: [SubCondition]
    var transactionAmount: TransactionAmount
}

struct SubCondition: Hashable, Codable, Identifiable {
    var id: Int
    var comparand: String
    var firstElement: AlgoElement
    var secondElement: AlgoElement
    
    var toString: String {
        firstElement.toString + " " + comparand + secondElement.toString
    }
    
    //not using rn
    var subConditionView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke()
                .foregroundColor(Color.white)
            Text(toString)
                .foregroundColor(Color(red: 240/255, green: 240/255, blue: 240/255))
        }
    }
}

struct AlgoElement: Hashable, Codable {
    var timeFrame: String
    var element: String
    
    var toString: String {
        element + " (" + timeFrame + ")"
    }
}

struct TransactionAmount: Hashable, Codable{
    var amount: Int
    var type: String
    
    func toString() -> String {
        if type == "percent" {
            return String(amount) + "% equity"
        } else {
            return String(amount) + " shares"
        }
    }
}
