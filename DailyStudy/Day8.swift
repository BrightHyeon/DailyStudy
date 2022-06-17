//
//  Day8.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/06/17.
//
//  Keyboard 밀림현상

import SwiftUI

struct Day8: View {
    @State private var isPresented: Bool = false
    @State private var title: String = ""
    @State private var offset: CGSize = .zero
    var body: some View {
        Button {
            isPresented.toggle()
        } label: {
            Text("show sheet")
                .font(.largeTitle.bold())
        }
        .sheet(isPresented: $isPresented) {
            VStack {
                Spacer()
                
                TextField("Enter title", text: $title)
                    .textFieldStyle(.roundedBorder)
                
                Spacer()
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 200)
            }
            .ignoresSafeArea(.keyboard) //MARK: Tip
        }
    }
}

struct Day8_Previews: PreviewProvider {
    static var previews: some View {
        Day8()
    }
}
