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
    @EnvironmentObject private var userData: UserData

    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Image("TopBar")
                        .resizable()
                        .frame(width: 400, height: 55)
                    
                    if popup == true{
                        WhiteOutBackground(frameHeight: 55)
                    }
                }
                .animation(.spring())
                
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
                            WhiteOutBackground(frameHeight: 690)
                        }
                    }
                    .animation(.spring())


                    
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

struct WhiteOutBackground: View{
    let frameHeight: CGFloat
    
    var body: some View{
        Rectangle()
            .fill(Color.white)
            .frame(width: 400, height: frameHeight)
            .opacity(0.8)

    }
}

struct RunningAlgorithms: View {
    var body: some View {
        VStack {
            ForEach (algorithmData){ algorithm in
                NavigationLink(destination: CurrentAlgoView(algorithm: algorithm)) {
                    RunningAlgoRow(algorithm: algorithm)
                }.buttonStyle(PlainButtonStyle())
                Divider()
            }
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
