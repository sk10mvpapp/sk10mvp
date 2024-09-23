//
//  BaseButton.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 19.09.2024.
//

import Foundation
import SwiftUI

struct BaseButton: View {

    private let buttonTitle: String
    private var isDisabled: Bool
    private var isLoading: Bool
    private let hideKeyboardOnTap: Bool
    private let image: Image?
    private let isOutlined: Bool
    private let action: () -> Void

    init(buttonTitle: String,
         isDisabled: Bool = false,
         isLoading: Bool = false,
         hideKeyboardOnTap: Bool = false,
         image: Image? = nil,
         isOutlined: Bool = false,
         action: @escaping () -> Void) {

        self.buttonTitle = buttonTitle
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.hideKeyboardOnTap = hideKeyboardOnTap
        self.image = image
        self.isOutlined = isOutlined
        self.action = action
    }

    var body: some View {
        Button(action: {
            self.action()
            if hideKeyboardOnTap {
//                hideKeyboard()
            }
        }, label: {
            ZStack {
                if isOutlined {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 1)
                        .background(Color.clear)
                        .frame(maxWidth: .infinity, maxHeight: 56)
                } else {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(isDisabled ? Color(.lightGray) : Color.blue)
                        .frame(maxWidth: .infinity, maxHeight: 56)
                }
                if !isLoading {
                    HStack {
                        if let image = image {
                            image
                        }
                        Text(self.buttonTitle)
                            .foregroundColor(isDisabled ? Color.gray : (!isOutlined ? .white : .black))
                    }
                } else {
                    Loader(loaderToUseFor: .button, colorLoaderType: .white)
                        .frame(width: 18, height: 18)
                }
            }
        })
        .disabled(self.isDisabled || self.isLoading)
    }
}
