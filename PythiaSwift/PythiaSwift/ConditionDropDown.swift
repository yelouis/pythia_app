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
    
    let condType : String
    let textColor : Color = .white
    let buyColor : Color = Color(red: 141/255, green: 223/255, blue: 144/255)
    let sellColor : Color = Color(red: 231/255, green: 110/255, blue: 100/255)
    
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
                Spacer()
                Image(systemName: expand ? "chevron.compact.up" : "chevron.compact.down")
                    .resizable()
                    .frame(width: 12, height: 6)
            }
                .foregroundColor(textColor)
                .onTapGesture {
                    self.expand.toggle()
                }
            
            if expand {
                ConditionLayout()
                ConditionLayout()
            }
            
        }.padding(10)
            .background(backgroundColor)
        .cornerRadius(10)
        .animation(.spring())
        .frame(width: 400, height: 10)
    }
}

struct ConditionLayout: View {
    let subconditionList : [String] = ["Open (1D prev) < Open (today)", "High(1W) < High(1D)"]
    let buyAmount : String = "10 shares"
    let textColor : Color = Color(red: 240/255, green: 240/255, blue: 240/255)
    var body: some View {
        
        VStack {
            HStack {
                    VStack(alignment: .leading) {
                        Text("If")
                            .font(Font.largeTitle)
                        ForEach(subconditionList, id: \.self) { condition in
                            Text(condition)
                                .foregroundColor(self.textColor)
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Buy")
                            .font(Font.largeTitle)
                        Text(buyAmount)
                    }
                }
                .foregroundColor(textColor)
                .padding()
            }
            
        }
        
}

struct ConditionDropDown_Previews: PreviewProvider {
    static var previews: some View {
        ConditionDropDown(condType: "Buy")
    }
}
