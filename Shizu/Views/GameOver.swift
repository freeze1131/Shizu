//
//  GameOver.swift
//  Shizu
//
//  Created by Ahmet Ozen on 10.02.2024.
//

import SwiftUI

struct GameOver: View {
    @Environment(GameViewModel.self) var gvm
    
    let color: Color
    
    var body: some View {
        ZStack{
            Image([.china1,.china2,.china3,.china4,.china5,.china6,.china7].randomElement()!)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.7)
            
            VStack {
                VStack{
                    Text("Game over")
                    Text("You solved \(gvm.gameModel.score) out of \(gvm.gameModel.maxTurns)!")
                    Text("Click to restart")
                        .fontWeight(.regular)
                }
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(color)
            .background(Material.ultraThin,in:RoundedRectangle(cornerRadius: 8))
            .overlay{
                RoundedRectangle(cornerRadius: 8)
                    .stroke(color,lineWidth: 5)
            }
                Spacer()
            }
           
        }
        .onTapGesture {
            gvm.gameModel.restart()
        }

    }
}

#Preview {
    GameOver(color: .green)
        .environment(GameViewModel())
}
