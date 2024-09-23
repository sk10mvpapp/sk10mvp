//
//  AuthView.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 19.09.2024.
//

import Foundation
import SwiftUI

struct AuthView: View {

    @EnvironmentObject var coordinator: AppCoordinator

    @State var phoneText: String = ""
    @State var passwordText: String = ""
    @State private var errorMessage: String?
    @FocusState var focused: Bool

    var body: some View {
        VStack(spacing: 20) {
            Text("Добро пожаловать!")
                .font(.title)
            PhoneNumberTextField(text: $phoneText, errorMessage: $errorMessage)
                .focused($focused)
            BaseTextField(text: $passwordText, errorMessage: $errorMessage, type: .password, isShowPassword: false)
                .focused($focused)
            CompactButton(title: "Забыли пароль?", action: {
                print("forget pass tap")
            })
            BaseButton(buttonTitle: "Войти", action: {
                print("auth tap")
                coordinator.openTabBar()
            })
        }
        .padding()
        .onTapGesture {
            focused = false
        }
    }
}
