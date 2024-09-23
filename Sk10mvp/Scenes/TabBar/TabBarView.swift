//
//  TabBarView.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 19.09.2024.
//

import Foundation
import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @State private var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                firstView
                    .tabItem {
                        Image(systemName: selectedTab == 0 ? "person.crop.circle" : "person.crop.circle.fill")
                        Text("first")
                    }.tag(0)

                secondView
                    .tabItem {
                        Image(systemName: selectedTab == 1 ? "folder" : "folder.fill")
                        Text("second")
                    }.tag(1)

                thirdView
                    .tabItem {
                        Image(systemName: selectedTab == 1 ? "doc" : "doc.fill")
                        Text("third")
                    }.tag(2)
            }
            .toolbarBackground(Color.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .accentColor(.blue)
    }

    // MARK: -  Dasboard
    var firstView: some View {
        NavigationView {
            Text("first")
                .navigationTitle("first")
        }
    }

    // MARK: -  Billing
    var secondView: some View {
        NavigationView {
            Text("second")
                .navigationTitle("second")
        }
    }

    // MARK: -  Support
    var thirdView: some View {
        NavigationView {
            Text("third")
                .navigationTitle("third")
        }
    }
}
