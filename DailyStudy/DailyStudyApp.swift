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
    let day5ViewModel = Day5ViewModel()
    
    var body: some Scene {
        WindowGroup {
            Day14()
                .environmentObject(day1ViewModel)
                .environmentObject(day5ViewModel)
        }
    }
}
