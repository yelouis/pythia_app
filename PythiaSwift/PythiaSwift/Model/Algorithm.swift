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
//    var buyCondition: BuyCondition
//    var sellCondition: SellCondition
//    var algoReturns : AlgoReturns
    fileprivate var smallGraph: String
    fileprivate var bigGraph: String

}

extension Algorithm {
    var smallImage: Image {
        ImageStore.shared.image(name: smallGraph)
    }
    
    var bigImage: Image {
        ImageStore.shared.image(name: bigGraph)
    }
}
