//
//  ContentView.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 18.09.2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Image(.skLogo)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding()
    }
}

#Preview {
    LoadingView()
}
