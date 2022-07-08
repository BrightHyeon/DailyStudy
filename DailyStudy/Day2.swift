//
//  Day2.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/06/06.
//
//  Study SwiftUIPager. MIT License

import SwiftUI
import SwiftUIPager

struct Day2: View {
    @StateObject private var pageIndex: Page = .first()
    var pages: [Int] = [1,2,3,4,5]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Pager(page: pageIndex, data: pages, id: \.self) {
                Day2SubView(page: $0)
            }
            .onPageChanged({ index in
                print(index)
            })
            .horizontal()
            .alignment(.center)
            .itemSpacing(10)
            .interactive(rotation: true)
            .preferredItemSize(CGSize(width: 300, height: 200))
            .frame(height: 220)
        }
        .ignoresSafeArea()
    }
}
struct Day2SubView: View {
    var page: Int
    
    var body: some View {
        ZStack {
            Color.mint
            
            VStack {
                Button {
                    print()
                } label: {
                    Image(systemName: "star.fill")
                        .font(.largeTitle.bold())
                }

                Text("Page: \(page)")
                    .font(.largeTitle)
                .bold()
            }
        }
        .cornerRadius(20)
        .shadow(color: .black, radius: 5)
    }
}

struct Day2_Previews: PreviewProvider {
    static var previews: some View {
        Day2()
    }
}

/*
 MARK: Modifiers
 
 1. * alignment - 컨테이너에서 페이지의 위치를 변경가능.
    center: 중앙, start(CGFloat): 좌측으로부터 얼마나 떨어뜨릴지. end(CGFloat): 우측으로부터.
 
 2. * itemSpacing - 요소 사이의 공간을 제공.
 
 3. * itemAspectRatio - 사용 가능한 공간과 이 너비/높이 비율에 따라 페이지의 크기를 구성.
 
 4. pageOffset: Pager 오프셋을 동적으로 변경.
 
 5. padding(CGFloat): 크기 조절용. -> frame(height:)와 비율의 조합으로 크기조절하는게 더편함.
 
 6. * interactive(CGFloat): 선택된 것 이외 셀들 크기비율.
 
 7. * interactive(rotation: Bool): 3D로 접혀있는 느낌 줄 것인지.
 
 8. * horizontal() & vertical(): 스크롤 방향 지정.
 
 9. * onPageChanged({ index in
          //do something
      })
 
 MARK: Summary
 
 함수 형태말고도 다른 뷰에 넣어서 사용도 가능하다.
 */

