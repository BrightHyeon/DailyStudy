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
                NavigationLink(destination: Day3()) {
                    Text("Day3")
                }
                NavigationLink(destination: Day4()) {
                    Text("Day4")
                }
                NavigationLink(destination: Day5()) {
                    Text("Day5")
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

/*
 WWDC 22 이후 주요 SwiftUI 변화
 
 1. NavigationView -> NavigationStack (data와 root)
 2. sheet detents Modes 설정가능
 3. import Charts
 4. URLSession BackgroundTask ???
 5. scrollDisabled
 6. widget관련 메서드 다수.
 7. imageRenderer
 8. RenameButtn
 9. ShareLink
 10. MultiDatePicker
 */

/*
 해볼만한 것들
 1. GestureMask - 하위 뷰의 제스처를 차단.
 */
