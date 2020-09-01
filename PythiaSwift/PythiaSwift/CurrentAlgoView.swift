//
//  CurrentAlgoView.swift
//  PythiaSwift
//
//  Created by Louis Ye on 8/23/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct CurrentAlgoView: View {
    
    var algorithm: Algorithm
    
    var body: some View {
        VStack {
            ScrollView {
                Image(algorithm.bigGraph)
                .resizable()
                .frame(width: 416, height:400)
                    .padding(.bottom)
                
                
                ConditionDropDown(algorithm: algorithm, condType: "Buy").padding([.leading, .trailing])
                ConditionDropDown(algorithm: algorithm, condType: "Sell").padding([.leading, .trailing])

            }
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
        CurrentAlgoView(algorithm: algorithmData[0])
    }
}

