//
//  CompactButton.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 19.09.2024.
//

import Foundation
import SwiftUI

struct CompactButton: View {

    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .padding(.horizontal, 8)
                .frame(height: 36)
                .foregroundColor(.blue)
                .background(Color(.lightGray).opacity(0.25))
                .cornerRadius(8)
        })
    }
}
