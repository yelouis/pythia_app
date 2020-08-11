//
//  TradePopup.swift
//  PythiaSwift
//
//  Created by Louis Ye on 8/10/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct TradePopup: View {
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
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 200, height: buttonHeight)
                    .foregroundColor(.green)
                Text("Algotrade").foregroundColor(.white)
                    .fontWeight(.bold)
            }
        }
    }
    
    var buttonHeight: CGFloat = 50
}

struct TradePopup_Previews: PreviewProvider {
    static var previews: some View {
        TradePopup()
    }
}
