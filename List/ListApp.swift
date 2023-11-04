//
//  ListApp.swift
//  List
//
//  Created by Cem Bıçakcı on 4.11.2023.
//

import SwiftUI

@main
struct ListApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                PeopleView()
                    .tabItem {
                        Symbols.person
                        Text("Home")
                    }
            }
        }
    }
}
