//
//  ContainerView.swift
//  Shizu
//
//  Created by Ahmet Ozen on 10.02.2024.
//

import SwiftUI

struct ContainerView: View {
    @State private var splashScreenIsPresented:Bool = true
    var body: some View {
        if splashScreenIsPresented {
            SplashScreenView(isPresented: $splashScreenIsPresented)
        } else {
            MainView()
        }
    }
}

#Preview {
    ContainerView()
        .environment(GameViewModel())
}
