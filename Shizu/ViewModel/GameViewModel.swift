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
   

    func successSound(){
        playSound(name: ["awesome","bell","correct","whoop","yes"].randomElement() ?? "whoop")
    }
    
    func failureSounds(){
        playSound(name: ["incorrectAnswer","OhNo","weak"].randomElement() ?? "OhNo")
    }
    
    func playNumber(num: Int) {
        // TODO: complete playNumber
    }
    
    
    
    
    private func playDigit(num: Int) {
        // TODO: complete playDigit
    }

    private func digitToName(digit: Int) -> String? {
        // TODO: complete digitToName
        return nil
    }
    
    // Play sounds and digits
    private func playSound(name:String, ext: String = "aiff") {
        guard let soundURL =  Bundle.main.url(forResource: name, withExtension: "aiff") else {
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = gameModel.volume
            audioPlayer?.play()
        } catch let error  {
            print(error.localizedDescription)
        }
    }

    
    
}
