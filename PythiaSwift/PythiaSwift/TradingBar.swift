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
                .frame(width: 400, height: 50)
                .foregroundColor(.white)
            HStack{
                VStack(alignment: .leading){
                    Text("Today's Volume").fontWeight(.semibold)
                    Text("57,305,856")
                }.padding(.leading)
                
                Spacer()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 200, height: 50)
                        .foregroundColor(.green)
                    Text("Trade").foregroundColor(.white)
                        .fontWeight(.bold)
                }.padding(.trailing)
                
            }
        }

    }
}

struct TradingBar_Previews: PreviewProvider {
    static var previews: some View {
        TradingBar()
    }
}
