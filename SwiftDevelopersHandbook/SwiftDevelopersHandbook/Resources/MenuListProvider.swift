//
//  MenuListProvider.swift
//  SwiftDevelopersHandbook
//
//  Created by Erdi Kanık on 28.12.2022.
//

import Foundation

struct MenuListItem: Identifiable {

    let id: String
    let name: String
    let iconName: String
}

final class MenuListProvider {

    private enum PlistKeys {

        static let name = "name"
        static let iconName = "iconName"
        static let items = "items"
    }

    lazy var listItems: [MenuListItem] = {
        var items: [MenuListItem] = []

        guard let path = Bundle.main.path(forResource: "Menu", ofType: "plist"),
              let plistDictionary = NSDictionary(contentsOfFile: path),
              let menuItems = plistDictionary[PlistKeys.items] as? [[String: String]] else {
            return items
        }

        items = menuItems.compactMap({ dict in
            guard let name = dict[PlistKeys.name], let iconName = dict[PlistKeys.iconName] else {
                return nil
            }

            return MenuListItem(id: UUID().uuidString, name: name, iconName: iconName)
        })

        return items
    }()
}
