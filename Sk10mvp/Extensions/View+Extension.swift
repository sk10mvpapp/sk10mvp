//
//  View+Extension.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 19.09.2024.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func isShow(_ shouldShow: Bool) -> some View {
        switch shouldShow {
        case true:
            self
        case false:
            EmptyView()
        }
    }
}
