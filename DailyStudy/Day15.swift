//
//  Day15.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/07/05.
//

import SwiftUI

struct Day15: View {
    var body: some View {
        Button {
            
        } label: {
            Image("love")
                .background(
                    Circle()
                        .stroke(.red,
                                style: StrokeStyle(
                                    lineWidth: 35,
                                    lineCap: .round,
                                    dash: [5, 30]
                                    //뭐지 이 의도치않은 꽃모양
                                )
                               )
                )
        }
    }
}

struct Day15_Previews: PreviewProvider {
    static var previews: some View {
        Day15()
    }
}
