//
//  ContentView.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/06/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                NavigationLink(destination: Day1()) {
                    Text("Day1")
                }
                NavigationLink(destination: Day2()) {
                    Text("Day2")
                }
            }
            .navigationTitle("DailyStudy")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
