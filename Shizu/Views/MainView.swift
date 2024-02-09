//
//  ContentView.swift
//  Shizu
//
//  Created by Ahmet Ozen on 9.02.2024.
//

import SwiftUI

struct MainView: View {
    @Environment(GameViewModel.self) var gvm
    var body: some View {
        VStack {
  
            Button(action: {
                gvm.successSound()
            }, label: {
                Text("Succes")
            })
            
            Button(action: {
                gvm.failureSounds()
            }, label: {
                Text("Incorrect")
            })
        }
        .padding()
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
