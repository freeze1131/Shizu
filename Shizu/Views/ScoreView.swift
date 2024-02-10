//
//  Score View.swift
//  Shizu
//
//  Created by Ahmet Ozen on 10.02.2024.
//

import SwiftUI

struct ScoreView: View {
    let score: Int
    let maxTurns: Int
    
    var body: some View {
        Text("Score: \(score) out of \(maxTurns)")
            .font(.largeTitle)
            .fontWeight(.semibold)
    }
}

#Preview {
    ScoreView(score: 2, maxTurns: 5)
}
