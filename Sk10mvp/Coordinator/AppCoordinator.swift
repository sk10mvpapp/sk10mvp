//
//  AppCoordinator.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 19.09.2024.
//

import Foundation
import SwiftUI

class AppCoordinator: ObservableObject {

    @Published var path = NavigationPath()

    @Published var isAuthenticated = false
    @Published var isLoading = true
    @Published var isNeedToShowTabBar = false

    func openTabBar() {
        isAuthenticated = false
        isNeedToShowTabBar = true
    }

    func loginSuccess() {
        isAuthenticated = true
    }

    func logout() {
        isLoading = false
        isAuthenticated = false
    }

    func finishLoading() {
        isLoading = false
    }

    @MainActor
    func gotoRoot() {
        path.removeLast(path.count)
    }

    @MainActor
    func goBack() {
        path.removeLast()
    }
}
