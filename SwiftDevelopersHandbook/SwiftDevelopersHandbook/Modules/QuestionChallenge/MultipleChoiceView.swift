//
//  MultipleChoiceView.swift
//  SwiftDevelopersHandbook
//
//  Created by Erdi Kanık on 17.01.2023.
//

import SwiftUI
import LoremSwiftum

struct MultipleChoiceView: View {

    private let columns = Array(repeating: GridItem(.flexible()), count: 2)

    @Binding var selectedIndex: Int

    let question: String
    let choices: [String]

    var body: some View {
        VStack {
            VStack {
                Text(question)
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(0..<choices.count, id: \.self) { index in
                        let choice = choices[index]
                        VStack {
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .fill(selectedIndex == index ? .green : .white)
                                .frame(height: 40)
                                .overlay {
                                    Text(choice)
                                }.overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.black, lineWidth: 1)
                                )

                        }.padding(.all, 6)
                            .onTapGesture {
                            selectedIndex = index
                        }
                    }
                    .id(UUID())
                }
            }
        }
        .padding()
    }
}

struct MultipleChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleChoiceView(
            selectedIndex: .constant(0),
            question: Lorem.tweet,
            choices: [Lorem.word, Lorem.word, Lorem.word, Lorem.word])
    }
}
