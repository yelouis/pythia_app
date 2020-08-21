//
//  PythiaInitialView.swift
//  PythiaSwift
//
//  Created by Louis Ye on 8/3/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct PythiaInitialView: View {
    var body: some View {
        NavigationView{
            VStack{
                Image("TopBar")
                    .resizable()
                    .frame(width: 400, height: 55)
                
                ZStack(alignment: .bottom) {
                    ScrollView(.vertical){
                        Image("ScrollData")
                            .resizable()
                            .frame(width: 400, height: 600)
                        
                        Text("Running Algorithms")
                            .font(.title)
                        
                    }
                    
                    Spacer()
                    
                    TradingBar()
                    //ZStack causing problems with clicking?
                    // Also, what is causing that weird line?
                    // Weird line is caused by spacers in the trading bar file
                }
                
                Image("BottomBar")
                    .resizable()
                    .frame(width: 400, height: 55)
            }
                .hiddenNavigationBarStyle()
        }

    }
}

//struct RunningAlgorithms: view {
//    //Make a view for the running algorhtms table
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PythiaInitialView()
    }
}
