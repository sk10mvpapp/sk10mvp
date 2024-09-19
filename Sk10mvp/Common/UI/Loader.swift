//
//  Loader.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 19.09.2024.
//

import Foundation
import SwiftUI

struct Loader: View {
    enum ColorLoader {
        case white
        case blue
    }

    enum LoaderType {
        case button
        case view
    }

    @State var animate = false
    var loaderToUseFor: LoaderType
    var colorLoaderType: ColorLoader
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.98)
            .stroke(AngularGradient(gradient: .init(colors: getColors()), center: .center), style: StrokeStyle(lineWidth: getLineWidth(), lineCap: .round))
            .rotationEffect(.init(degrees: self.animate ? 360 : 0))
            .onAppear {
                withAnimation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false)) {
                    self.animate.toggle()
                }
            }
    }

    private func getColors() -> [Color] {
        switch colorLoaderType {
        case .white:
            return [.white, Color(.white.withAlphaComponent(0.1))]
        case .blue:
            return [.blue, .blue.opacity(0.1)]
        }
    }

    private func getLineWidth() -> CGFloat {
        switch loaderToUseFor {
        case .button:
            return 3
        case .view:
            return 4
        }
    }
}
