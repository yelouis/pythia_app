//
//  EditConditionsView.swift
//  PythiaSwift
//
//  Created by Nathaniel Veimau (old comp) on 9/1/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct EditConditionsView: View {
    
    var algorithm: Algorithm
    var condType: String
    
    var conditionList : [AlgoCondition] {
        if condType == "Buy" {
            return algorithm.buyCondition
        } else {
            return algorithm.sellCondition
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                /*
                Image("TopBar")
                    .resizable()
                    .frame(width: 400, height: 55)
                */
                ConditionsTableView(conditions: conditionList, condType: condType)
                
                
            }
        //MARK: make this better
        }.navigationBarTitle(Text("Hi"))
    }
}

struct EditConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        //EditConditionsView()
        Text("Hello world")
    }
}
