//
//  PinyinView.swift
//  Shizu
//
//  Created by Ahmet Ozen on 10.02.2024.
//

import SwiftUI

struct PinyinView: View {
    @Binding var showingTranslation: Bool
    var body: some View {
        HStack {
            Toggle(isOn: $showingTranslation, label: {
                Text(showingTranslation ? "Hide Pinyin" : "Show Pinyin")
            })
        }
    }
}

#Preview {
    PinyinView(showingTranslation: .constant(true))
}
