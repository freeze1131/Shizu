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
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
