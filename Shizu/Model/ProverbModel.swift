//
//  ProverbModel.swift
//  Shizu
//
//  Created by Ahmet Ozen on 10.02.2024.
//

import Foundation

// https://chinese-proverbs.onrender.com/api/proverbs/random



struct ProverbModel: Codable {
    let id, proverb, pinyin, translation: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case proverb,pinyin,translation
    }

    static func defaultQuote() -> ProverbModel {
        ProverbModel(id: "63e6ae053bd28e8c186fdf8a", proverb: "家和万事兴", pinyin: "Jiā hé wàn shì xīng", translation: "If a family is harmonious everything will go well.")
    }
    
}
