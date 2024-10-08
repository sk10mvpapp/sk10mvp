//
//  PhoneNumberTextField.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 19.09.2024.
//

import Foundation
import SwiftUI

struct PhoneNumberTextField: View {
    @Binding var text: String
    @Binding var errorMessage: String?
    @FocusState var isActive

    init(text:  Binding<String>, errorMessage: Binding<String?>) {
        _text = text
        _errorMessage = errorMessage
    }

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                HStack(spacing: 0) {
                    Button(action: {
                        print("---")
                    }, label: {
                        HStack {
                            Image(.rusFlag)
                            Text("+7")
                                .foregroundStyle(Color.black)
                        }
                        .padding(.horizontal, 12)
                    })
                    Rectangle()
                        .foregroundColor(Color(.lightGray))
                        .frame(width: 1, height: 24)
                    TextField("", text: $text)
                        .keyboardType(.numberPad)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .focused($isActive)
                        .padding(.leading, 12)
                        .animation(.spring, value: isActive)
                        .onChange(of: text, perform: { oldValue in
                            text = format(with: "XXX XXX XX XX", phone: oldValue)
                        })
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

    private func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex

        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }

    private func getBorderColor() -> Color {
        if errorMessage == nil {
            isActive ? .blue : .gray
        } else {
            .red
        }
    }
}
