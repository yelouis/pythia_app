//
//  RunningAlgoRow.swift
//  PythiaSwift
//
//  Created by Nathaniel Veimau (old comp) on 8/22/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct RunningAlgoRow: View {
    
    var algorithm: Algorithm
    
    var graphColor : Color {
        if algorithm.algoReturns.type == "positive" {
            return Color.green
        } else {
            return Color.red
        }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(algorithm.name)
                    .font(.system(size: 15))
                
                Text(String(algorithm.currentShares) + " shares")
                    .font(.system(size: 12))
                    .fontWeight(.light)
                    
            }
            
            Spacer()
        
            Image(algorithm.smallGraph)
                .resizable()
                .frame(width: 110, height: 50)
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(graphColor)
                    .frame(width: 90, height: 35)
                Text("$" + String(algorithm.algoReturns.amount))
                    .foregroundColor(Color.white)
                
            }
        }
        .padding(.leading, 35)
        .padding(.trailing, 35)
    }
}

struct RunningAlgoRow_Previews: PreviewProvider {
    static var previews: some View {
        RunningAlgoRow(algorithm: algorithmData[0])
    }
}
