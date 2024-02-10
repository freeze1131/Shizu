//
//  GameModel.swift
//  Shizu
//
//  Created by Ahmet Ozen on 9.02.2024.
//

import Foundation


struct GameModel {
    var score: Int
    let maxTurns: Int
    var volume: Float
    var turns: Int // Turns played so far
    var answer: Int
    var alternatives: [Int] // Possible solutions including answer
    var gameWon: Bool {
        turns >= maxTurns
    }
    var gameOver: Bool {
        score < 0 || gameWon
    }
    
    // Score code
   mutating func increaseScore() {
        score += 1
    }
    
    // Update turn
    mutating func nextTurn() {
        turns += 1
    }
    //Generate next problem
    

    mutating func generateNewProblem() {
        // create and array of four different values between 0 and 99
        alternatives = Int.generateUniqueRandomInt(count: 4)
        // Let the last alternative be the answer
        answer = alternatives[3]
        
        // Shuffle the alternatives so the solution will be in different place
        alternatives = alternatives.shuffled()
    }
    
    mutating func restart() {
        self = GameModel(score: 0, maxTurns: 5, volume: self.volume, turns: 0, answer: 10, alternatives: [42,13,7,10].shuffled())
    }
    
    static var defaultGameModel: GameModel{
        .init(score: 0, maxTurns: 5, volume: 0.7, turns: 0, answer: 10, alternatives: [42,13,7,10].shuffled())
    }
    
    
}
