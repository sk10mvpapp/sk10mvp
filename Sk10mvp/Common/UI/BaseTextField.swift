//
//  BaseTextField.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 19.09.2024.
//

import Foundation
import SwiftUI
import Combine
enum TextFieldType {
    case email
    case password
    case name
    case appart
    case confirmPassword
}

struct BaseTextField: View {
    @Binding var text: String
    @Binding var errorMessage: String?
    @FocusState var isActive
    @State var isShowPassword: Bool = true
    @State private var cancellable: AnyCancellable? = nil

    private let type: TextFieldType
    private var placeholder: String = ""

    init(text:  Binding<String>, errorMessage: Binding<String?>, type: TextFieldType, isShowPassword: Bool = true) {
        _text = text
        _errorMessage = errorMessage
        self.isShowPassword = isShowPassword
        self.type = type
        getPlaceholder()
    }

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                Text(placeholder)
                    .padding(.leading, 12)
                    .offset(y: (isActive || !text.isEmpty) ? -10 : 0)
                    .foregroundStyle(Color(.lightGray))
                    .animation(.spring, value: isActive)
                HStack {
                    _textField()
                        .keyboardType(getKeyboardType())
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .focused($isActive)
                        .padding(.leading, 12)
                        .offset(y: (isActive || !text.isEmpty) ? 10 : 0)
                        .animation(.spring, value: isActive)

                    Button(action: {
                        isShowPassword.toggle()
                    }) {
                        Image(systemName: isShowPassword ? "eye" : "eye.slash")
                            .foregroundColor(.gray)
                    }
                    .isShow(type == .password || type == .confirmPassword)
                    .padding(.trailing, 12)
                }

            }
            .modifier(textFieldModifier(borderColor: getBorderColor() ))
            .padding(.horizontal, 16)
            if let errorText = errorMessage {
                Text(errorText)
                    .foregroundStyle(Color.red)
                    .padding(.top, 0.5)
                    .padding(.bottom, 4)
            }
        }
    }

    @ViewBuilder
    private func _textField() -> some View {
        ZStack {
            TextField("", text: $text, onEditingChanged: { state in
                switch type {
                case .email:
                    break
                default: break
                }
            })
            .autocapitalization(type == .email ? .none : .sentences)
            .onChange(of: text) { _ in
                self.errorMessage = nil
            }
            .opacity(isShowPassword ? 1 : 0)
            SecureField("", text: $text)
                .opacity(isShowPassword ? 0 : 1)
        }
    }

    private func getKeyboardType() -> UIKeyboardType {
        switch type {
        case .email:
                .emailAddress
        case .appart:
                .numberPad
        default: .default
        }
    }

    private mutating func getPlaceholder() {
        switch type {
        case .email:
            placeholder = "Email"
        case .password:
            placeholder = "Пароль"
        case .name:
            placeholder = "Имя"
        case .appart:
            placeholder = "Номер квартиры"
        case .confirmPassword:
            placeholder = "Подтвердите пароль"
        }
    }

    private func getBorderColor() -> Color {
        if errorMessage == nil {
            isActive ? .blue : .gray
        } else {
            .red
        }
    }
}
