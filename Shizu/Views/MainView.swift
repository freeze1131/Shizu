//
//  ContentView.swift
//  Shizu
//
//  Created by Ahmet Ozen on 9.02.2024.
//

import SwiftUI

struct MainView: View {
    @Environment(GameViewModel.self) var gvm
    @State private var showSettingsView:Bool = false
    @State private var showTranslation:Bool = false
    @State private var done:Bool = false
    
    var gameOver: Bool {
        gvm.gameModel.gameOver
    }
    
    var body: some View {
        ZStack {
            GearIconView(showSettingsView: $showSettingsView)
            VStack {
                ScoreView(score: gvm.gameModel.score, maxTurns:gvm.gameModel.maxTurns)
                
                PinyinView(showingTranslation: $showTranslation)
                    .padding()
                if let chineseNum = Chinese.numToChinese(num: gvm.gameModel.answer){
                    
                    Spacer()
                    Text(chineseNum.chinese)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    if showTranslation {
                        Text(chineseNum.pinyin)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                    }
                }
               
                NumberOptionsView(numbers: gvm.gameModel.alternatives, answer: gvm.gameModel.answer)
                    .onChange(of: gvm.gameModel.turns) { _, _ in
                        gvm.gameModel.generateNewProblem()
                    }
                Spacer()
            }
            .padding()
        }
        .fullScreenCover(isPresented: $done, content: {
            GameOver(color: .green.opacity(0.8))
        })
        .onChange(of: gameOver) { _, _ in
            done = gameOver
        }
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
