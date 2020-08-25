//
//  CurrentAlgoView.swift
//  PythiaSwift
//
//  Created by Louis Ye on 8/23/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct CurrentAlgoView: View {

    var algoName: String
    var graphString: String
    var algoReturn: Double
    var numShares: Int
    
    var body: some View {
        VStack {
            ScrollView {
                Image("MyAlgo1graph")
                .resizable()
                .frame(width: 416, height:400)
            }
            
            BuyConditionBar()
            
            
        }
    }
}

struct BuyConditionBar: View {
    //implementLater
    var buyConditionList : [Condition] = []
    var sellConditionList : [Condition] = []

    var body: some View {

        HStack {
            Text("Buy Conditions")
                .font(Font.largeTitle)
                .foregroundColor(Color.black)
            
            Spacer()
            
            Triangle()
                .fill(Color.black)
                .frame(width: 20, height: 20)
        }
        .padding()
        .foregroundColor(Color.black)
    }
    
}

struct Condition {
    //implement and move to diff file
    var a: String
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
        CurrentAlgoView(algoName: "MyAlgo1", graphString: "TWTRgraph", algoReturn: 10.43, numShares: 10)
    }
}

