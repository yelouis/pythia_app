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
        VStack{
            Text("Pythia")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 150)
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 55)
                    .foregroundColor(.blue)
                Text("Unlock").foregroundColor(.white)
            }.padding(.bottom, 50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PythiaInitialView()
    }
}
