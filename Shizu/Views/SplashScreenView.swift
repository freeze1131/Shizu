//
//  SplashScreenView.swift
//  Shizu
//
//  Created by Ahmet Ozen on 10.02.2024.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isPresented:Bool
    
    @State private var opacity = 0.0
    @State private var scale = CGSize(width: 0.5, height: 0.5)
    @State private var moveUp = false
    @State private var angle = 45.0
    @State private var spacing = 5.0
    
    var vm = ProverbViewModel()
    
    var chinese: String {
        vm.proverbModel.proverb
    }
    
    var pinyin: String {
        vm.proverbModel.pinyin
    }
    
    var translation: String {
        vm.proverbModel.translation
    }
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black
                    .ignoresSafeArea()
                Image("china1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: geo.size.width,height: geo.size.height)
                    .opacity(opacity)
                
                VStack {
                    VeryCoolTextView(spacing: spacing, text1: chinese, text2: pinyin, text3: translation, scale: scale, angle: angle, opacity: opacity)
                    
                    if moveUp {
                        Spacer()
                    }
                }
                
                VStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            isPresented = false
                        }
                    }, label: {
                        Image("friend")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 75)
                            .clipShape(Capsule())
                            .overlay(
                            Capsule()
                                .stroke(Color.red,lineWidth: 1)
                            )
                })
                }
                
            }
        }
        .onAppear{
            vm.getRandomQuote()
            
            withAnimation(.linear(duration: 2.5)) {
                opacity = 0.8
                scale = CGSize(width: 1, height: 1 )
                angle = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                withAnimation(.easeInOut(duration: 2)) {
                    moveUp = true
                    spacing = 30
                }
            }
        }
    }
}

#Preview {
    SplashScreenView(isPresented: .constant(true))
}
