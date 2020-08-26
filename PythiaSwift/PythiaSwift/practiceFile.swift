//
//  practiceFile.swift
//  PythiaSwift
//
//  Created by Nathaniel Veimau (old comp) on 8/22/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct practiceFile: View {
    var body: some View {
        /*
        List {
            RunningAlgoRow(algoName: "MyAlgo1", graphString: "TWTRgraph", algoReturn: 10.43, numShares: 10)
            RunningAlgoRow(algoName: "MyAlgo2", graphString: "OPKgraph", algoReturn: 12.43, numShares: 420)
            RunningAlgoRow(algoName: "MyAlgo3", graphString: "BLDPgraph", algoReturn: 10.43, numShares: 69)
        }
         */
        DropDown(backgroundColor: Color.green)
    }
}

struct DropDown: View {
    
    @State var expand = false
    let myColor : Color = Color.white
    let backgroundColor : Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            HStack {
                Text("Expand").fontWeight(.heavy).foregroundColor(myColor)
                Image(systemName: expand ? "chevron.compact.up" : "chevron.compact.down")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(myColor)
            }.onTapGesture {
                self.expand.toggle()
            }
            
            if expand {
                Button(action: {
                    //nothing
                }) {
                    Text("Select 1")
                }
                    .foregroundColor(myColor)
                
                Button(action: {
                    //nothing
                }) {
                    Text("Select 2")
                }
                    .foregroundColor(myColor)
                
                Button(action: {
                    //nothing
                }) {
                    Text("Select 3")
                }
                    .foregroundColor(myColor)
            }
            
           
        })
            .padding(7)
            .background(LinearGradient(gradient: .init(colors: [.red,.orange]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(10)
            .animation(.spring())
    }
}

struct practiceFile_Previews: PreviewProvider {
    static var previews: some View {
        practiceFile()
    }
}
