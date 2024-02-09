//
//  GameViewModel.swift
//  Shizu
//
//  Created by Ahmet Ozen on 9.02.2024.
//

import Foundation
import Observation
import AVFoundation

@Observable
class GameViewModel {
    var gameModel: GameModel = .defaultGameModel
    var audioPlayer: AVAudioPlayer?
    // TODO: Complete Game View Model
    
    private func playSound(name:String) {
        guard let soundURL =  Bundle.main.url(forResource: name, withExtension: "aiff") else {
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = 0.7 // TODO: Update this
            audioPlayer?.play()
        } catch let error  {
            print(error.localizedDescription)
        }
    }
    
    
}
