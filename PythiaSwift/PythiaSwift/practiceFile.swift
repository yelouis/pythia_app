//
//  practiceFile.swift
//  PythiaSwift
//
//  Created by Nathaniel Veimau (old comp) on 8/22/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct practiceFile: View {
    var body: some View {
        List {
            RunningAlgoRow(algoName: "MyAlgo1", graphString: "TWTRgraph", algoReturn: 10.43, numShares: 10)
            RunningAlgoRow(algoName: "MyAlgo2", graphString: "OPKgraph", algoReturn: 12.43, numShares: 420)
            RunningAlgoRow(algoName: "MyAlgo3", graphString: "BLDPgraph", algoReturn: 10.43, numShares: 69)
        }
    }
}

struct practiceFile_Previews: PreviewProvider {
    static var previews: some View {
        practiceFile()
    }
}
