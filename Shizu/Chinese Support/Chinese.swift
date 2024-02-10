//
//  Chinese.swift
//  Shizu
//
//  Created by Ahmet Ozen on 10.02.2024.


import Foundation

class Chinese {
    static func numToChinese(num: Int) -> (chinese: String, pinyin: String)? {
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
        ]

        var chineseResult: String
        var pinyinResult: String
        
        switch(num) {
        case 0...10:
            chineseResult = chineseDigitsWithPinyin[num].chinese
            pinyinResult = chineseDigitsWithPinyin[num].pinyin
        case 11...19:
            chineseResult = "十\(chineseDigitsWithPinyin[num%10].chinese)"
            pinyinResult = "shí \(chineseDigitsWithPinyin[num%10].pinyin)"
        case 20...99:
            // 70
            let tenths = num / 10   // 7
            let digit = num % 10    // 0
            chineseResult = "\(chineseDigitsWithPinyin[tenths].chinese)十\(chineseDigitsWithPinyinEmptyZero[digit].chinese)"
            pinyinResult = "\(chineseDigitsWithPinyin[tenths].pinyin) shí \(chineseDigitsWithPinyinEmptyZero[digit].pinyin)"
        default:
            return nil
        }
        
        pinyinResult = pinyinResult.trimmingCharacters(in: .whitespaces)
        
        return (chineseResult, pinyinResult)
    }
}

