//
//  SettingsView.swift
//  Shizu
//
//  Created by Ahmet Ozen on 10.02.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(GameViewModel.self) var gvm
    @Binding var showSettings:Bool
    @State var volume: Float
    
    var body: some View {
        NavigationStack{
            VStack{
                Form {
                    Section {
                        HStack{
                            Text("Volume")
                            Spacer()
                            Text("\(volume)")
                        }
                        Slider(value: $volume, in: 0...1, step: 0.1)
                    } header: {
                        Text("Audio Settings")
                    }
                    
                }
                Button(action: {
                    gvm.gameModel.volume = volume
                    showSettings.toggle()
                }, label: {
                    
                    Text("Done")
                })
            }
            .navigationTitle("Game Settings")
        }
    }
}

#Preview {
    SettingsView(showSettings: .constant(true), volume: 0.7)
        .environment(GameViewModel())
}
