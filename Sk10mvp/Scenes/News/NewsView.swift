//
//  NewsView.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 08.10.2024.
//

import Foundation
import SwiftUI

struct NewsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(mockData.indices, id: \.self) { index in
                    let item = mockData[index]
                    NavigationLink(destination: NewsDetail(newsItem: item).navigationBarTitleDisplayMode(.inline), label: {
                        NewsCell(item: item)
                    })

                    if index != mockData.count - 1 {
                        Divider()
                            .padding(.horizontal)
                    }
                }
            }
            .padding(.vertical)
        }
        .scrollIndicators(.hidden)
    }
}
