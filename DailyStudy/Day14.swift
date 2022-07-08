//
//  Day14.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/07/05.
//
//  Make TabView Indicator.

import SwiftUI

//struct Day14: View {
//    @State private var selection: Int = 0
//
//    init() {
//        UIPageControl.appearance().backgroundStyle = .minimal
//        UIPageControl.appearance().currentPageIndicatorTintColor = .systemPink
//        UIPageControl.appearance().hidesForSinglePage = true
//        UIPageControl.appearance().pageIndicatorTintColor = .secondaryLabel
//        UIPageControl.appearance().numberOfPages = 5
//    }
//
//    var body: some View {
//        TabView(selection: $selection) {
//            ForEach(0..<20, id: \.self) { num in
//                Text("\(num)")
//                    .tag(num)
//                    .frame(width: 300, height: 200)
//                    .background(.mint)
//            }
//            .mask(RoundedRectangle(cornerRadius: 10))
//            .aspectRatio(1.4, contentMode: .fit)
//        }
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//        .background(.gray)
//    }
//}

struct Day14_Previews: PreviewProvider {
    static var previews: some View {
        Day14()
    }
}

struct Day14: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 40)
                .padding()
                .overlay(
                    Text("작성완료")
                        .foregroundColor(.white)
                        .bold()
                        .padding(10)
                )
            Text("4")
                .font(.footnote.bold())
                .padding(8)
                .background(
                    Circle()
                        .foregroundColor(.mint)
                )
        }
    }
}
