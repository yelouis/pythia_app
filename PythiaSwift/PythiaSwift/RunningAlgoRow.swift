//
//  RunningAlgoRow.swift
//  PythiaSwift
//
//  Created by Nathaniel Veimau (old comp) on 8/22/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct RunningAlgoRow: View {
    
    var algoName : String
    var graphString : String
    var algoReturn : Double
    
    var graphColor : Color {
        if graphString == "OPKgraph" {
            return Color.red
        } else {
            return Color.green
        }
    }
    
    
    var numShares : Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(algoName)
                    .font(.system(size: 15))
                
                Text(String(numShares) + " shares")
                    .font(.system(size: 12))
                    .fontWeight(.light)
                    
            }
            
            Spacer()
        
            Image(graphString)
                .resizable()
                .frame(width: 110, height: 50)
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(graphColor)
                    .frame(width: 90, height: 35)
                Text("$" + String(algoReturn))
                    .foregroundColor(Color.white)
                
            }
        }
        .padding(.leading, 35)
        .padding(.trailing, 35)
    }
}

struct RunningAlgoRow_Previews: PreviewProvider {
    static var previews: some View {
        RunningAlgoRow(algoName: "Best",graphString: "TWTRgraph", algoReturn: 15.43, numShares: 10)
    }
}
