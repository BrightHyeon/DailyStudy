//
//  Day20.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/07/11.
//

import SwiftUI

struct Day20: View {
    let shape = Triangle()

    var body: some View {
        VStack {
            Button {
                print("Tapped: \(Date.now.timeIntervalSince1970)")
            } label: {
                shape
                    .stroke(Color.red, lineWidth: 10)
                    .frame(width: 200, height: 200)
            }
            .buttonStyle(TriButtonStyle())
        }
        .padding(32)
    }
}

struct Day20_Previews: PreviewProvider {
    static var previews: some View {
        Day20()
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}

struct TriangleButtonStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(configuration)
            .contentShape(Triangle())
    }
}
//MARK: 위 아래 둘다 가능. 터치 반경 조절.
struct TriButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .rotation3DEffect(.degrees(90), axis: (0, 0, 0))
            .opacity(configuration.isPressed ? 0.3 : 1)
            .contentShape(Triangle())
    }
}
