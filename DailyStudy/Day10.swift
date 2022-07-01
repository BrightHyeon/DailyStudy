//
//  Day10.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/06/25.
//

import SwiftUI

struct Day10: View {
    @State private var isSelected: Bool = false
    
    var body: some View {
        VStack {
            Button {
                withAnimation {
                    isSelected.toggle()
                }
            } label: {
                Text("hihi")
                    .frame(width: 50, height: 50)
                    .buttonStyle(AButton())
            }
        }
    }
}

struct AButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .contentShape(Circle())
            .background(
                Circle()
                    .fill(.black)
            )
    }
}

struct Day10_Previews: PreviewProvider {
    static var previews: some View {
        Day10()
    }
}
