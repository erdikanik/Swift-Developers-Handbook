//
//  QuestionView.swift
//  SwiftDevelopersHandbook
//
//  Created by Erdi Kanık on 17.01.2023.
//

import SwiftUI
import LoremSwiftum

struct QuestionView: View {
    var body: some View {
        VStack {
            QuestionPagingView(totalPageNumber: 10, currentPage: .constant(1))
            Spacer()
            Circle().fill(Color.clear)
                .frame(width: 250, height: 250)
                .overlay(
                    Circle()
                        .stroke(.gray, lineWidth: 10)
                )
                .overlay {
                    Text("123").bold().font(.largeTitle)
                }
                .overlay(Circle().trim(from: 0, to: 0.5)
                            .stroke(
                                style: StrokeStyle(
                                    lineWidth: 12,
                                    lineCap: .round,
                                    lineJoin: .round)
                            )
                                .rotation(Angle(degrees: -90))
                                .foregroundColor(.red)
                )
            Spacer()
            MultipleChoiceView(
                selectedIndex: .constant(0),
                question: Lorem.tweet,
                choices: [Lorem.word, Lorem.word, Lorem.word, Lorem.word]
            )
        }.padding(.top, 20)
            .padding(.bottom, 20)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
