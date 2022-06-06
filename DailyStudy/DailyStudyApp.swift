//
//  DailyStudyApp.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/06/06.
//

import SwiftUI

@main
struct DailyStudyApp: App {
    
    let day1ViewModel = Day1ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(day1ViewModel)
        }
    }
}
