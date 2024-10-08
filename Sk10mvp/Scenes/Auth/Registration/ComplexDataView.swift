//
//  ComplexDataView.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 08.10.2024.
//

import Foundation
import SwiftUI

struct ComplexDataView: View {

    @Binding var isOpen: Bool

    @State var errorMessage: String?

    @Binding var selectedComplex: String
    @Binding var selectedLiter: String
    @Binding var selectedAppart: String

    @FocusState var focused

    let complexes = ["ЖК Космос", "ЖК Пушкин", "ЖК Культура", "ЖК Малина Парк", "ЖК Грин Сайд", "ЖК Сезоны", "ЖК Ленина 46", "ЖК Соколова 68", "ЖК Царское Село", "ЖК Мечников", "ЖК Онегин", "ЖК West Side", "ЖК Северный Остров", "ЖК Левенцовский", "ЖК Соборный 98", "ЖК Гвардейский 2", "ЖК Гвардейский", "ЖК Вдохновение", "ЖК Военвед Сити", "Не выбрано"]
    let liters = ["1", "2", "3", "4", "5", "6", "7", "8"]

    var body: some View {
        VStack(spacing: 16) {
            VStack {
                Text("Выберите Ваш ЖК")
                    .font(.footnote)
                Picker("---", selection: $selectedComplex) {
                    ForEach(complexes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                .foregroundColor(.black)
            }
            VStack {
                Text("Выберите Ваш корпус")
                    .font(.footnote)
                Picker("---", selection: $selectedLiter) {
                    ForEach(liters, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.menu)
                .foregroundColor(.black)
            }
            VStack {
                Text("Введите номер квартиры")
                    .font(.footnote)
                BaseTextField(text: $selectedAppart, errorMessage: $errorMessage, type: .appart)
//                    .frame(width: 150)
                    .focused($focused)
            }
            BaseButton(buttonTitle: "Сохранить изменения", action: {
                if selectedComplex.isEmpty {
                    selectedComplex = complexes[0]
                }
                if selectedLiter.isEmpty {
                    selectedLiter = liters[0]
                }
                isOpen = false
            })
        }
        .onTapGesture {
            focused = false
        }
    }
}
