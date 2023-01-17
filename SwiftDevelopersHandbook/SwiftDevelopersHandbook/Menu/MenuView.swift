//
//  MenuView.swift
//  SwiftDevelopersHandbook
//
//  Created by Erdi Kanık on 27.12.2022.
//

import SwiftUI

struct MenuView: View {

    let provider = MenuListProvider()
    @Binding var selectedIndex: Int
    @Binding var showSideMenu: Bool

    var body: some View {
        let drag = DragGesture().onEnded { event in
          if event.location.x < 200 &&
                abs(event.translation.height) < 50 &&
                abs(event.translation.width) > 50 {
            withAnimation {
              showSideMenu = event.translation.width > 0
            }
          }
        }

        VStack {
            let items = provider.listItems
            List {
                ForEach(0..<items.count, id: \.self) { index in
                    HStack {
                        let item = items[index]
                        Image(systemName: item.iconName)
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text(item.name)
                        Spacer()
                        Image(systemName: "chevron.forward")
                    }
                    .onTapGesture(perform: {
                        selectedIndex = index
                    })
                    .foregroundColor(selectedIndex == index ? .blue : .black)
                    .padding(.leading, 10)
                    .padding(.bottom, 10)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .gesture(drag)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(selectedIndex: .constant(0), showSideMenu: .constant(false))
    }
}
