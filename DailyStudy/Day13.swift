//
//  Day13.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/07/01.
//
//  onAppear test

import SwiftUI

struct Day13: View {
    @State private var isShow: Bool = false
    
    var body: some View {
        Button {
            isShow.toggle()
        } label: {
            Text("Hello, World!")
        }
        .onAppear(perform: {
            print("이 몸 등장~!")
        })
        .fullScreenCover(isPresented: $isShow) {
            VStack {
                Text("hello ~~~")
                Button {
                    isShow.toggle()
                } label: {
                    Text("Baam~!!!")
                }
            }
            .onAppear {
                print("Screen 등장~!")
            }
        }
    }
}

struct Day13_Previews: PreviewProvider {
    static var previews: some View {
        Day13()
    }
}
