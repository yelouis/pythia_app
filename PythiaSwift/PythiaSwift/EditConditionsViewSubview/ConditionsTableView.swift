//
//  ConditionsTableView.swift
//  PythiaSwift
//
//  Created by Nathaniel Veimau (old comp) on 9/1/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct ConditionsTableView: View {
    var conditions: [AlgoCondition]
    var condType: String

    
    var body: some View {
        VStack {
            Text(condType + " Conditions")
                .font(.headline)
                .fontWeight(.semibold)
        }
    }
}

struct ConditionCellLayout: View {
    var condition : AlgoCondition
    var transactionType : String

    let textColor : Color = Color(red: 240/255, green: 240/255, blue: 240/255)
    
    var body: some View {
        VStack {
            HStack {
                    VStack(alignment: .leading) {
                        Text("If")
                            .font(Font.largeTitle)
                        ForEach(condition.subCondition) { subCondition in
                            Text(subCondition.toString)
                                .foregroundColor(self.textColor)
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text(transactionType)
                            .font(Font.largeTitle)
                        Text(condition.transactionAmount.toString())
                    }
                }
                    .foregroundColor(textColor)
                    .padding()
            }
            
        }
        
}

struct ConditionsTableView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionsTableView(conditions: algorithmData[0].buyCondition, condType: "Buy")
    }
}
