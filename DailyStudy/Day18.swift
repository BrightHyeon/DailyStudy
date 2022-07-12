//
//  Day18.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/07/09.
//
//  Full screen scroll down

import SwiftUI

struct Day18: View {
    @State private var isShow: Bool = false
    
    var body: some View {
        Button {
            isShow.toggle()
        } label: {
            Text("show full screen")
        }
        .fullScreenCover(isPresented: $isShow) {
            HwanaFullSheet(isShow: $isShow)
        }
    }
}

struct Day18_Previews: PreviewProvider {
    static var previews: some View {
        Day18()
    }
}

struct HwanaFullSheet: View {
    @Binding var isShow: Bool
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack {
                Color.black.frame(height: 900)
            }
        }
        .ignoresSafeArea()
    }
}
