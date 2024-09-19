//
//  Sk10mvpApp.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 18.09.2024.
//

import SwiftUI

@main
struct Sk10mvpApp: App {

    @ObservedObject var coordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            if coordinator.isLoading {
                LoadingView()
            } else if coordinator.isNeedToShowTabBar {
                TabBarView()
            } else {
                AuthView()
            }
        }.environmentObject(coordinator)
    }
}
