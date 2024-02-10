//
//  NumberOptionsView.swift
//  Shizu
//
//  Created by Ahmet Ozen on 10.02.2024.
//

import SwiftUI

struct NumberOptionsView: View {
    let numbers: [Int]
    let answer:Int
    
    var body: some View {
        
        VStack {
            HStack {
                CircleView(value: numbers[0], answer: answer, color: .blue)
                CircleView(value: numbers[1], answer: answer, color: .green)
            }
            HStack {
                CircleView(value: numbers[2], answer: answer, color: .red)
                CircleView(value: numbers[3], answer: answer, color: .orange)
            }
        }
    }
}



struct CircleView: View {
    let value: Int
    let answer:Int
    let color:Color
    
    @Environment(GameViewModel.self) var gvm

    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(color.gradient)
            Text("\(value)")
                .foregroundStyle(.white)
                .font(.title)
        }
        .onTapGesture {
            if answer == value {
                // correct
                self.gvm.gameModel.increaseScore()
                self.gvm.playNumber(num: answer)
            } else {
                // false
                self.gvm.failureSounds()
            }
            // Next turn
            self.gvm.gameModel.nextTurn()
        }
    }
}


#Preview {
    NumberOptionsView(numbers: [42,13,10,28], answer: 10)
        .environment(GameViewModel())
}
