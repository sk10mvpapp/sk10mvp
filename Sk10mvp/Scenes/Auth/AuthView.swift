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

    @State var registrationViewOpen = false

    var body: some View {
        VStack(spacing: 16) {
            Image(.skLogo)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Добро пожаловать!")
                .font(.title)
            PhoneNumberTextField(text: $phoneText, errorMessage: $errorMessage)
                .focused($focused)
            BaseTextField(text: $passwordText, errorMessage: $errorMessage, type: .password, isShowPassword: false)
                .focused($focused)

            HStack {
                CompactButton(title: "Забыли пароль?", action: {
                    print("forget pass tap")
                })
                CompactButton(title: "Регистрация", action: {
                    registrationViewOpen = true
                })
            }

            BaseButton(buttonTitle: "Войти", isDisabled: enableButton(), action: {
                print("auth tap")
                coordinator.openTabBar()
            })
            Text("")
        }
        .onTapGesture {
            focused = false
        }
        .fullScreenCover(isPresented: $registrationViewOpen, content: {
            RegistrationView(isOpen: $registrationViewOpen)
        })
    }

    func enableButton() -> Bool {
        !phoneText.isEmpty && !passwordText.isEmpty ? false : true
    }
}
