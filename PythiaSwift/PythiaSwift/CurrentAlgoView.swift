//
//  CurrentAlgoView.swift
//  PythiaSwift
//
//  Created by Louis Ye on 8/23/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct CurrentAlgoView: View {
    @EnvironmentObject var userData: UserData
    var algorithm: Algorithm
    
    var algorithmIndex: Int {
        userData.algorithms.firstIndex(where: { $0.id == algorithm.id })!
    }
    
//    @State var tempString: String = ""
    
    
    var body: some View {
        
        VStack {
//            Text(userData.algorithms[algorithmIndex].buyCondition[0].subCondition[0].toString)
//            TextField("Type something here", text: $tempString)
//
//            Rectangle().onTapGesture {
//                self.userData.algorithms[self.algorithmIndex].buyCondition[0].subCondition[0].firstElement.element = self.tempString
//            }

            
            ScrollView {
                Image(algorithm.bigGraph)
                .resizable()
                .frame(width: 416, height:400)
                    .padding(.bottom)
                
                
                ConditionDropDown(algorithm: algorithm, condType: "Buy", algorithmIndex: algorithmIndex).padding([.leading, .trailing])
                ConditionDropDown(algorithm: algorithm, condType: "Sell", algorithmIndex: algorithmIndex).padding([.leading, .trailing])
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(red: 220/255, green: 220/255, blue: 220/255))
                    HStack {
                        //MARK: give this more thought this looks dumb (try without 4 spacers)
                        Spacer()
                        Text("Deposit")
                        Spacer()
                        Divider()
                        Spacer()
                        Text("Withdraw")
                        Spacer()

                    }
                        .foregroundColor(Color.white)
                }
                    .frame(height: 45)
                    .padding()
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.red)
                        .frame(height: 50)
                    Text("Liquidate and Halt Algorithm")
                        .foregroundColor(Color.white)
                }
                .padding([.leading, .trailing])
            }
            .animation(.spring())
            
            
            
            Image("BottomBar")
                .resizable()
                .frame(width: 400, height: 55)
        }
        .navigationBarTitle(Text(algorithm.name))
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

struct CurrentAlgoView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentAlgoView(algorithm: algorithmData[0]).environmentObject(UserData())
    }
}

