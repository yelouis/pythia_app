//
//  PythiaInitialView.swift
//  PythiaSwift
//
//  Created by Louis Ye on 8/3/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct PythiaInitialView: View {
    @State var popup: Bool = false

    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Image("TopBar")
                        .resizable()
                        .frame(width: 400, height: 55)
                    
                    if popup == true{
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 400, height: 55)
                            .opacity(0.8)
                    }
                }
                
                ZStack(alignment: .bottom) {
                    ZStack{
                          ScrollView(.vertical){
                              Image("ScrollData")
                                  .resizable()
                                  .frame(width: 400, height: 600)
                              
                              HStack {
                                  Text("Running Algorithms")
                                      .font(.title)
                                      .padding(.top, 10)
                                      .padding(.leading, 38)
                                  Spacer()
                              }
                              
                              RunningAlgorithms()
        
                          }
                        
                        if popup == true{
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 400, height: 690)
                                .opacity(0.8)
                        }
                    }

                    
                    Spacer()
                    
                    TradingBar(popup: self.$popup)
                    
                }
                
                Image("BottomBar")
                    .resizable()
                    .frame(width: 400, height: 55)
            }
                .hiddenNavigationBarStyle()
        }

    }
}

struct RunningAlgorithms: View {
    var body: some View {
            VStack {
                //Change destination
                NavigationLink(destination: LoginScreen()) {
                    RunningAlgoRow(algoName: "MyAlgo1", graphString: "TWTRgraph", algoReturn: 10.43, numShares: 10)
                }.buttonStyle(PlainButtonStyle())
                Divider()
                RunningAlgoRow(algoName: "MyAlgo2", graphString: "OPKgraph", algoReturn: 12.43, numShares: 420)
                Divider()
                RunningAlgoRow(algoName: "MyAlgo3", graphString: "BLDPgraph", algoReturn: 10.43, numShares: 69)
                RoundedRectangle(cornerRadius: 0)
                .fill(Color.white)
                .frame(width: 420, height: 65)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PythiaInitialView()
    }
}
