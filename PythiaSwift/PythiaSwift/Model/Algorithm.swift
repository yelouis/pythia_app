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
    var buyCondition: AlgoCondition
    var sellCondition: AlgoCondition
    var algoReturns : AlgoReturns
    fileprivate var smallGraph: String
    fileprivate var bigGraph: String
}

struct AlgoReturns: Hashable, Codable{
    var amount: Float
    var type: String
}

struct AlgoCondition: Hashable, Codable, Identifiable{
    var id: Int
    var subCondition: SubCondition
    var transactionAmount: TransactionAmount
}

struct SubCondition: Hashable, Codable, Identifiable {
    var id: Int
    var comparand: String
    var firstElement: AlgoElement
    var secondElement: AlgoElement
}

struct AlgoElement: Hashable, Codable {
    var timeFrame: String
    var element: String
}

struct TransactionAmount: Hashable, Codable{
    var amount: Int
    var type: String
}

extension Algorithm {
    var smallImage: Image {
        ImageStore.shared.image(name: smallGraph)
    }
    
    var bigImage: Image {
        ImageStore.shared.image(name: bigGraph)
    }
}
