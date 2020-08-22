//
//  TradingBar.swift
//  PythiaSwift
//
//  Created by Louis Ye on 8/9/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct TradingBar: View {
    @State var popup: Bool = true
    
    var body: some View {
        
        ZStack{
            VStack{
                Spacer()
                RoundedRectangle(cornerRadius: 0)
                    .fill(Color.white)
                    .frame(width: 420, height: 60)
            }

            HStack{
                VStack(alignment: .leading){
                    Spacer()
                    Text("Today's Volume").fontWeight(.semibold)
                        .font(.system(size: 15))
                    Text("57,305,856")
                }.padding(.leading)
                
                Spacer()
                
                VStack{
                    Spacer()
                    if self.popup == true{
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 200, height: 50)
                                .foregroundColor(.green)
                            Text("Trade").foregroundColor(.white)
                                .fontWeight(.bold)
                        }.padding(.trailing)
                            .onTapGesture {
                                self.popup = false
                        }
                    }else{
                        TradePopup(closePopup: self.$popup)
                            .padding(.trailing)
                    }
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
