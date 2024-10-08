//
//  RegistrationView.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 08.10.2024.
//

import Foundation
import SwiftUI

struct RegistrationView: View {

    @Binding var isOpen: Bool
    @State var phoneText = ""
    @State var errorMessage: String?

    @State var complexDataViewOpen = false

    @State var selectedComplex: String = ""
    @State var selectedLiter: String = ""
    @State var appartNumber: String = ""

    @State var passwordText = ""
    @State var confirmPasswordText = ""

    @FocusState var focused

    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                isOpen = false
            }, label: {
                Text("Закрыть")
            })
        }
        VStack(spacing: 16) {
            Image(.skLogo)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Регистрация")
                .font(.title)
            PhoneNumberTextField(text: $phoneText, errorMessage: $errorMessage)
                .focused($focused)

            HStack {
                VStack {
                    Text("Жилой комплекс")
                    Text("Корпус/секция")
                    Text("Номер квартиры")
                }
                .font(.footnote)

                Spacer()

                if selectedComplex.isEmpty || selectedLiter.isEmpty || appartNumber.isEmpty {
                    BaseButton(buttonTitle: "Внести данные", action: {
                        focused = false
                        complexDataViewOpen = true
                    })
                    .offset(x: 16)
                } else {
                    VStack {
                        Text(selectedComplex)
                        Text(selectedLiter)
                        Text(appartNumber)
                    }
                    .font(.footnote)
                }
            }
            .padding(.horizontal, 16)

            BaseTextField(text: $passwordText, errorMessage: $errorMessage, type: .password, isShowPassword: false)
                .focused($focused)
            BaseTextField(text: $confirmPasswordText, errorMessage: $errorMessage, type: .confirmPassword, isShowPassword: false)
                .focused($focused)

            BaseButton(buttonTitle: "Зарегистрироваться", isDisabled: registerButtonDisabled(), action: {
                isOpen = false
                print("Success registration")
            })
        }
        .sheet(isPresented: $complexDataViewOpen, content: {
            ComplexDataView(isOpen: $complexDataViewOpen, selectedComplex: $selectedComplex, selectedLiter: $selectedLiter, selectedAppart: $appartNumber)
        })
        .onTapGesture {
            focused = false
        }
    }

    func registerButtonDisabled() -> Bool {
        if phoneText.isEmpty || selectedComplex.isEmpty || selectedLiter.isEmpty || appartNumber.isEmpty || passwordText.isEmpty || confirmPasswordText.isEmpty {
            if passwordText != confirmPasswordText {
                return true
            }
            return true
        } else {
            return false
        }
    }
}
