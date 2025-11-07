//
//  ContentView.swift
//  propeller
//
//  Created by alex on 11/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                HomeView()
            }
            Tab("History", systemImage: "rectangle.stack.fill") {
                HistoryView()
            }
            Tab("Creators", systemImage: "person.3.fill") {
                CreatorsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
