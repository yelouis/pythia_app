//
//  LoginScreen.swift
//  PythiaSwift
//
//  Created by Louis Ye on 8/9/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct LoginScreen: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Pythia")
                    .font(Font.system(size: 50))
                    .fontWeight(.bold)
                    .padding(.top, 150)

                Spacer()

                NavigationLink(destination: PythiaHomeView()){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 300, height: 55)
                            .foregroundColor(.green)
                        Text("Unlock").foregroundColor(.white)
                    }
                }

                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: 55)
                        .foregroundColor(.gray)
                    Text("Sign Out").foregroundColor(.white)
                }
                    .padding(.bottom, 50)
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
