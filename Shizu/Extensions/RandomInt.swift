//
//  RandomInt.swift
//  Shizu
//
//  Created by Ahmet Ozen on 9.02.2024.
//

import Foundation

extension Int {
    static func generateUniqueRandomInt(count: Int,lower: Int = 0, upper: Int = 99) -> [Int] {
        // In case the task is impossible
        if count > upper - lower + 1 || lower > upper {
            return []
        }
        
        var result = [Int]()
        
        
        while result.count < count {
            let randomInt = Int.random(in: lower...upper)
            // Check for uniqueness
            if !result.contains(randomInt) {
                result.append(randomInt)
            }
        }
        
        
        return result
    }
}
