//
//  TradingBar.swift
//  PythiaSwift
//
//  Created by Louis Ye on 8/9/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct TradingBar: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .frame(width: 400, height: 55)
                .foregroundColor(.white)
            HStack{
                VStack{
                    Text("Today's Volume").font(Font.body.bold())
                    Text("57,305,856")
                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 200, height: 55)
                        .foregroundColor(.green)
                    Text("Trade").foregroundColor(.white)
                        .font(Font.body.bold())
                }
                
            }
        }

    }
}

struct TradingBar_Previews: PreviewProvider {
    static var previews: some View {
        TradingBar()
    }
}
