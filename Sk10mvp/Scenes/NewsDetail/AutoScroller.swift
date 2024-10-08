//
//  AutoScroller.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 08.10.2024.
//

import Foundation
import SwiftUI

struct AutoScroller: View {

    var imageNames: [String]
    let timer = Timer.publish(every: 4.0, on: .main, in: .common).autoconnect()
    @State private var selectedImageIndex = 0
    var body: some View {
        ZStack {
            Color.clear
                .ignoresSafeArea()

            TabView(selection: $selectedImageIndex) {
                ForEach(0..<imageNames.count, id: \.self) { index in
                    ZStack(alignment: .topLeading) {
                        Image("\(imageNames[index])")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tag(index)
//                            .frame(width: 350, height: 200)
                    }
                }
            }
            .frame(height: 300)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()

            HStack {
                ForEach(0..<imageNames.count, id: \.self) { index in
                    Capsule()
                        .fill(Color.gray.opacity(selectedImageIndex == index ? 1 : 0.33))
                        .frame(width: 8, height: 8)
                        .onTapGesture {
                            selectedImageIndex = index
                        }
                }
                .offset(y: 130)
            }
        }
        .onReceive(timer) { _ in
            withAnimation(.default) {
                selectedImageIndex = (selectedImageIndex + 1) % imageNames.count
            }
        }
    }
}
