//
//  MainView.swift
//  SwiftDevelopersHandbook
//
//  Created by Erdi Kanık on 27.12.2022.
//

import SwiftUI

struct MainView: View {

    @State private var showSideMenu = false
    @State private var selectedIndex = 0

    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader { geometry in
                    MenuView(selectedIndex: $selectedIndex, showSideMenu: $showSideMenu)
                        .frame(width: geometry.size.width / 1.5)
                        .transition(.move(edge: .leading))
                        .offset(x: showSideMenu ? 0 : -geometry.size.width / 1.5)
                        .padding(.top, 20)
                        .zIndex(1)
                }

                VStack {
                    
                }
                .navigationBarTitle("Dashboard", displayMode: .inline)
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            self.showSideMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                ))
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
