//
//  EditConditionsView.swift
//  PythiaSwift
//
//  Created by Nathaniel Veimau (old comp) on 9/1/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct EditConditionsView: View {
    
    @EnvironmentObject var userData: UserData
    
    var algorithm: Algorithm
    var condType: String
    var algorithmIndex: Int
    
    @State var tempString1: String = ""
    @State var tempString2: String = ""
    @State var tempString3: String = ""
    @State var tempString4: String = ""
    @State var tempString5: String = ""

    
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
                
                TextField(algorithm.buyCondition[0].subCondition[0].firstElement.element, text: $tempString1)
                TextField(algorithm.buyCondition[0].subCondition[0].firstElement.timeFrame, text: $tempString2)
                TextField(algorithm.buyCondition[0].subCondition[0].comparand, text: $tempString3)
                TextField(algorithm.buyCondition[0].subCondition[0].secondElement.element, text: $tempString4)
                TextField(algorithm.buyCondition[0].subCondition[0].secondElement.timeFrame, text: $tempString5)
                
                Rectangle().onTapGesture {
                    self.userData.algorithms[self.algorithmIndex].buyCondition[0].subCondition[0].firstElement.element = self.tempString1
                    self.userData.algorithms[self.algorithmIndex].buyCondition[0].subCondition[0].firstElement.timeFrame = self.tempString2
                    self.userData.algorithms[self.algorithmIndex].buyCondition[0].subCondition[0].comparand = self.tempString3
                    self.userData.algorithms[self.algorithmIndex].buyCondition[0].subCondition[0].secondElement.element = self.tempString4
                    self.userData.algorithms[self.algorithmIndex].buyCondition[0].subCondition[0].secondElement.timeFrame = self.tempString5
                }
                

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
