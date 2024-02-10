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
            
            Button(action: {
                gvm.playNumber(num: 7 )
            }, label: {
                Text("Number 7")
            })
            
            Button(action: {
                gvm.playNumber(num: 30 )
            }, label: {
                Text("Number 30")
            })
            
            Button(action: {
                gvm.playNumber(num: 74 )
            }, label: {
                Text("Number 74")
            })
        }
        .padding()
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
