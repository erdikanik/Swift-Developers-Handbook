//
//  QuestionPagingView.swift
//  SwiftDevelopersHandbook
//
//  Created by Erdi Kanık on 27.02.2023.
//

import SwiftUI

struct QuestionPagingView: View {

    let totalPageNumber: Int
    @Binding var currentPage: Int

    var body: some View {
        HStack {
            ForEach(0..<totalPageNumber, id: \.self) { index in
                Image(systemName: index == currentPage ? "circle.fill" : "circle")
                    .resizable()
                    .frame(width: 20, height: 20)
            }.id(UUID())
        }.frame(height: 40)
    }
}

struct QuestionPagingView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            QuestionPagingView(totalPageNumber: 10, currentPage: .constant(2))
                .frame(width: .infinity)
        }
    }
}
