//
//  Max.swift
//  Shizu
//
//  Created by Ahmet Ozen on 9.02.2024.
//

import Foundation


func myMax(x: Int, y: Int,z: Int) -> Int {
    if x >= y && x>=z {
        return x
    } else if y >= x && y>=z {
        return y
    } else {
        return z
    }
}
