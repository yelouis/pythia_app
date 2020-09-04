//
//  practiceFile.swift
//  PythiaSwift
//
//  Created by Nathaniel Veimau (old comp) on 8/22/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct practiceFile: View {
    @EnvironmentObject var userData: UserData
    
//    @State var currentText: String = ""
//    @State var buttonThing: Bool = false
    
    var body: some View {
        VStack{
            Text("Hi")
        }
    }
}

struct practiceFile_Previews: PreviewProvider {
    static var previews: some View {
        practiceFile().environmentObject(UserData())
    }
}
