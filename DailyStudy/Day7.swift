//
//  Day7.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/06/14.
//

import SwiftUI

struct Day7: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
