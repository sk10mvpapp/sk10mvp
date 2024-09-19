//
//  TextFieldModifier.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 19.09.2024.
//

import Foundation
import SwiftUI

struct textFieldModifier: ViewModifier {
    var borderColor: Color
    func body(content: Content) -> some View {
        content
            .background(Color(.lightGray).opacity(0.25))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(borderColor, lineWidth: 1)
            )
    }
}
