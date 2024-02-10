//
//  ContentView.swift
//  Shizu
//
//  Created by Ahmet Ozen on 9.02.2024.
//

import SwiftUI

struct MainView: View {
    @Environment(GameViewModel.self) var gvm
    @State var showSettingsView:Bool = false
    
    
    var body: some View {
        ZStack {
            GearIconView(showSettingsView: $showSettingsView)
            VStack {
               
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
