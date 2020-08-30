//
//  TradePopup.swift
//  PythiaSwift
//
//  Created by Louis Ye on 8/10/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct TradePopup: View {
    @Binding var closePopup: Bool
    
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 200, height: buttonHeight)
                    .foregroundColor(.green)
                Text("Trade Options").foregroundColor(.white)
                    .fontWeight(.bold)
            }
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 200, height: buttonHeight)
                    .foregroundColor(.green)
                Text("Sell").foregroundColor(.white)
                    .fontWeight(.bold)
            }
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 200, height: buttonHeight)
                    .foregroundColor(.green)
                Text("Buy").foregroundColor(.white)
                    .fontWeight(.bold)
            }
            
            NavigationLink(destination: LoginScreen()){
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 200, height: buttonHeight)
                        .foregroundColor(.green)
                    Text("Algotrade").foregroundColor(.white)
                        .fontWeight(.bold)
                }
            }

            
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.green, lineWidth: 2)
                    .frame(width: 200, height: buttonHeight)
                )
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: buttonHeight)
                Text("X")
                    .fontWeight(.bold)
                    .foregroundColor(.green)
            }.onTapGesture {
                self.closePopup = false
            }
        }
    }
    
    var buttonHeight: CGFloat = 50
}

struct TradePopup_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
