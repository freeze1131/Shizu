//
//  ShizuApp.swift
//  Shizu
//
//  Created by Ahmet Ozen on 9.02.2024.
//

import SwiftUI

@main
struct ShizuApp: App {
    @State private var gvm: GameViewModel = GameViewModel()
    var body: some Scene {
        
        
        WindowGroup {
            ContainerView()
                .environment(gvm)
        }
    }
}
