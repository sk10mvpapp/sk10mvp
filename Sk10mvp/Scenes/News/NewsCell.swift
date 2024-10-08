//
//  NewsCell.swift
//  Sk10mvp
//
//  Created by Владислав Гуденко on 08.10.2024.
//

import Foundation
import SwiftUI

struct NewsItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
}

struct NewsCell: View {

    let item: NewsItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topLeading) {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .cornerRadius(12)

                if !item.title.isEmpty {
                    Text(item.title)
                        .font(.headline)
                        .padding(8)
                        .background(Color.black.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(8)
                        .multilineTextAlignment(.leading)
                }
            }

            Text(item.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(2)
                .truncationMode(.tail)
                .multilineTextAlignment(.leading)
        }
        .padding(.horizontal, 16)
    }
}

let mockData: [NewsItem] = [
    NewsItem(title: "Первые апартаменты с готовым ремонтом в Ростове - ЖК КОСМОС", description: "Космос - не просто недвижимость. Это возможность покорить новые высоты. Далее идет просто длинное описание которое можно передать на детальный экран. Далее идет просто длинное описание которое можно передать на детальный экран. Далее идет просто длинное описание которое можно передать на детальный экран", imageName: "kosmos"),
    NewsItem(title: "Ипотека 0,01% во всех ЖК от СК10", description: "Успейте приобрести квартиру по сниженной процентной ставке. Далее идет просто длинное описание которое можно передать на детальный экран. Далее идет просто длинное описание которое можно передать на детальный экран. Далее идет просто длинное описание которое можно передать на детальный экран", imageName: "ipoteka"),
    NewsItem(title: "ЖК ГРИНСАЙД - Квартиры с ремонтом от 7 000 рублей/месяц!", description: "Крупнейший жилой квартал в центре Ростова. Расположен в границах трех улиц - Ленина, Нансена и Нагибина. Далее идет просто длинное описание которое можно передать на детальный экран. Далее идет просто длинное описание которое можно передать на детальный экран", imageName: "greenside"),
    NewsItem(title: "ЖК Малина Парк - Квартиры с ремонтом от 6 300 рублей/месяц!", description: "Современный комплекс с собственной инфраструктурой в центре Западного микрорайона. Далее идет просто длинное описание которое можно передать на детальный экран. Далее идет просто длинное описание которое можно передать на детальный экран", imageName: "malina"),
    NewsItem(title: "ЖК Пушкин - Премиум-класс на Пушкинской", description: "Дом премиум-класса расположен рядом с парком Горького - в границах Пушкинской, Семашко, Горького и Газетного. Четыре малоэтажные секции, высокие потолки, малое количество квартир на этаже и просторный подземный паркинг", imageName: "pushkin"),
    NewsItem(title: "", description: "Первые апартаменты в Ростове от 5 млн рублей", imageName: "aparti"),
    NewsItem(title: "", description: "Рассрочка 0% в СК10", imageName: "rassrochka"),
    NewsItem(title: "", description: "Скидка 7 000 р/м2 в ЖК Культура", imageName: "skidka"),
    NewsItem(title: "", description: "IT-ипотека со скидкой 3%", imageName: "skidkait")
]
