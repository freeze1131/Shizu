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
    private var audioPlayer: AVAudioPlayer?
   
    
    

    func successSound(){
        playSound(name: ["awesome","bell","correct","whoop","yes"].randomElement() ?? "whoop")
    }
    
    func failureSounds(){
        playSound(name: ["incorrectAnswer","OhNo","weak"].randomElement() ?? "OhNo")
    }
    
    func playNumber(num: Int) {
        switch(num) {
        case 0...10:
            playDigit(digit: num)
        case 11...19:
            playDigit(digit: 10)
            playDigit(digit: num % 10)
        case 20...99:
            let digit = num % 10
            let tenths = num / 10
            playDigit(digit: tenths)
            playDigit(digit: 10)
            if digit != 0 {
                playDigit(digit: digit)
            }
        default:
            playSound(name: "bell")
        }
    }
    
    

    
 /*
  let chineseDigitsWithPinyin: [(chinese: String, pinyin: String) ] = [
      ("零", "líng"),  // 0
      ("一", "yī"),    // 1
      ("二", "èr"),    // 2
      ("三", "sān"),
      ("四", "sì"),
      ("五", "wǔ"),
      ("六", "liù"),
      ("七", "qī"),
      ("八", "bā"),
      ("九", "jiǔ"),
      ("十", "shí")    // 10
  ]
  let chineseDigitsWithPinyinEmptyZero: [(chinese: String, pinyin: String)] = [
      ("", ""),
      ("一", "yī"),
      ("二", "èr"),
      ("三", "sān"),
      ("四", "sì"),
      ("五", "wǔ"),
      ("六", "liù"),
      ("七", "qī"),
      ("八", "bā"),
      ("九", "jiǔ"),
      ("十", "shí")
  
  
  */
    
    
    private func playDigit(digit: Int) {
        playSound(name: digitToName(digit: digit) ?? "bell")
    }

    private func digitToName(digit: Int) -> String? {
        let digitNames = [
        "zero",
        "one",
        "two",
        "three",
        "four",
        "five",
        "six",
        "seven",
        "eight",
        "nine",
        "ten"
        ]
        if digit >= 0 && digit <= 10 {
            return digitNames[digit]
        } else {
            return nil
        }
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
