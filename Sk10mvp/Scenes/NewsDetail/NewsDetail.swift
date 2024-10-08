//
//  NewsDetail.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 08.10.2024.
//

import Foundation
import SwiftUI

struct NewsDetail: View {

    @EnvironmentObject var coordinator: AppCoordinator
    let newsItem: NewsItem

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
//                Image(newsItem.imageName)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .clipped()
//                    .cornerRadius(12)
//                    .padding(.horizontal)
                AutoScroller(imageNames: [newsItem.imageName, "ipoteka", "greenside", "malina", "pushkin"])

                Text(newsItem.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                Text(newsItem.description)
                    .font(.body)
                    .padding(.horizontal)
                BaseButton(buttonTitle: "Узнать подробности", action: {
                    print("call back tap")
                })
                .padding(.bottom, 16)
            }
            .padding(.top)
        }
    }
}
