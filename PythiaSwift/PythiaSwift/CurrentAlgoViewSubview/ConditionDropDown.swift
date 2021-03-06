//
//  ConditionDropDown.swift
//  PythiaSwift
//
//  Created by Nathaniel Veimau (old comp) on 8/27/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct ConditionDropDown: View {
    //initialization
    //let conditionList : [String] = ["Open (1D prev) < Open (today)"]
    @State var expand = false
    @EnvironmentObject var userData: UserData
    
    var algorithm: Algorithm
    let condType : String
    var algorithmIndex: Int

    let textColor : Color = .white
    let buyColor : Color = Color(red: 141/255, green: 223/255, blue: 144/255)
    let sellColor : Color = Color(red: 231/255, green: 110/255, blue: 100/255)
    
    
    
    var conditionList : [AlgoCondition] {
        if condType == "Buy" {
            return algorithm.buyCondition
        } else {
            return algorithm.sellCondition
        }
    }
    
    var backgroundColor : Color {
        if condType == "Buy" {
            return buyColor
        } else {
            return sellColor
        }
    }

    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(condType + " Conditions")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: expand ? "chevron.compact.up" : "chevron.compact.down")
                    .resizable()
                    .frame(width: 17, height: 10)
            }
                .foregroundColor(textColor)
                .onTapGesture {
                    self.expand.toggle()
                }
            
            if expand {
                ForEach(conditionList) { condition in
                    ConditionLayout(condition: condition, transactionType: self.condType, algorithmIndex: self.algorithmIndex)
                    Divider()
                }
            }
            
            NavigationLink(destination: EditConditionsView(algorithm: algorithm, condType: condType, algorithmIndex: algorithmIndex)) {
                ZStack {
                    //MARK: maybe make it a lighter blue
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                        .frame(height:30)
                    Text("Edit " + condType + " Conditions")

                }.foregroundColor(Color(red: 130/255, green: 130/255, blue: 245/255))
            }
        }.padding(10)
        .background(backgroundColor)
        .cornerRadius(10)
        .animation(.spring())
        .alignmentGuide(VerticalAlignment.center) { $0[.top] }
    }
}

struct ConditionLayout: View {
    @EnvironmentObject var userData: UserData
    
    var condition : AlgoCondition
    var transactionType : String
    var algorithmIndex: Int

    let textColor : Color = Color(red: 240/255, green: 240/255, blue: 240/255)

    var conditionIndex: Int {
        if transactionType == "Buy"{
            return userData.algorithms[algorithmIndex].buyCondition.firstIndex(where: { $0.id == condition.id }) ?? -1
        }else{
            return userData.algorithms[algorithmIndex].sellCondition.firstIndex(where: { $0.id == condition.id }) ?? -1
        }
    }
    

    // var subConditionList : [SubCondition]
    // var amount : TransactionAmount
    // var transactionType : String
    
    /*
    init(condition: AlgoCondition, transactionType: String) {
        self.condition = condition
        self.subConditionList = condition.subCondition
        self.amount = condition.transactionAmount
        self.transactionType = transactionType
        self.fullConditionText = ""
    }
     */
    
    var body: some View {
        VStack {
            HStack {
                    VStack(alignment: .leading) {
                        Text("If")
                            .font(Font.largeTitle)
                        ForEach(userData.algorithms[algorithmIndex].buyCondition[conditionIndex].subCondition) { subCondition in
                            Text(subCondition.toString)
                                .foregroundColor(self.textColor)

                        }
                    }
                    
                    Spacer()
                    VStack(alignment: .leading) {
                        Text(transactionType)
                            .font(Font.largeTitle)
                        if transactionType == "Buy"{
                            Text(userData.algorithms[algorithmIndex].buyCondition[conditionIndex].transactionAmount.toString())
                        }else{
                            Text(userData.algorithms[algorithmIndex].sellCondition[conditionIndex].transactionAmount.toString())
                        }
                    }
                }
                    .foregroundColor(textColor)
                    .padding()
            
                //Divider()
            }
            
        }
        
}

struct ConditionDropDown_Previews: PreviewProvider {
    static var previews: some View {
        ConditionDropDown(algorithm: algorithmData[0], condType: "Buy", algorithmIndex: 0)
    }
}
