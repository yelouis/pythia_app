//
//  PythiaHomeView.swift
//  PythiaSwift
//
//  Created by Louis Ye on 8/3/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct PythiaHomeView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Investing").font(.title)
                Spacer()
            }.padding()
            
            HStack{
                Text("$777.93").font(.title)
                Spacer()
            }.padding()
            Spacer()
        }
        //.hiddenNavigationBarStyle()
    }
}

struct PythiaHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PythiaHomeView()
    }
}
