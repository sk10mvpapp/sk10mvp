//
//  ContentView.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 18.09.2024.
//

import SwiftUI

struct LoadingView: View {

    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        ZStack {
            Image(.skLogo)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack {
                Spacer()
                Loader(loaderToUseFor: .view, colorLoaderType: .blue)
                    .frame(width: 34, height: 34)
            }
        }
        .padding()
        .onAppear {
            simulateLoading()
        }
    }

    @MainActor
    func simulateLoading() {
        Task {
            try await Task.sleep(seconds: 2)
            coordinator.finishLoading()
        }
    }
}

#Preview {
    LoadingView()
}
