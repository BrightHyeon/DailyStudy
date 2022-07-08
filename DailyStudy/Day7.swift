//
//  Day7.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/06/14.
//

import SwiftUI

struct Day7: View {
    @State private var isUp: Bool = false
    var body: some View {
        VStack(spacing: 100) {
//            Button {
//                withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
//                    isUp.toggle()
//                }
//            } label: {
//                Circle().frame(width: 50, height: 50)
//            }
            
            Circle()
                .fill(.black.opacity(isUp ? 0.2 : 0.3))
                .blur(radius: 2)
                .frame(width: isUp ? 15 : 25, height: isUp ? 15 : 25)
                .overlay(
                    Image("purplepin")
                        .resizable()
                        .frame(width: 36, height: isUp ? 44 : 38)
                        .offset(y: isUp ? -40 : -20)
                )
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                        isUp.toggle()
                    }
                }
        }
    }
}

struct Day7_Previews: PreviewProvider {
    static var previews: some View {
        Day7()
    }
}

struct SomeButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 1 : 1)
    }
}
