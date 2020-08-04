//
//  PythiaHomeView.swift
//  PythiaSwift
//
//  Created by Louis Ye on 8/3/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct PythiaHomeView: View {
    var body: some View {
        NavigationView{
            Text("Hello, World!")

        }
        .hiddenNavigationBarStyle()
    }
}

struct PythiaHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PythiaHomeView()
    }
}
