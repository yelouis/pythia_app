//
//  CurrentAlgoView.swift
//  PythiaSwift
//
//  Created by Louis Ye on 8/23/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct CurrentAlgoView: View {
    var body: some View {
            ScrollView {
                NavigationLink(destination: LoginScreen()) {
                    Text("Don't use .appearance()!")
                }
        }
            .navigationBarTitle("Best Algorithm!", displayMode: .inline)
            .background(NavigationConfigurator { nc in
            nc.navigationBar.barTintColor = .white
            nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.green]
        })
                .navigationViewStyle(StackNavigationViewStyle())
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
        CurrentAlgoView()
    }
}
