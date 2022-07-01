//
//  Day9.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/06/17.
//

import SwiftUI

struct Day9: View {
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Show Full Screen")
                    .fullScreenCover(isPresented: $isPresented) {
                        NextView(isPresented: $isPresented)
                }
                
                Button {
                    self.isPresented.toggle()
                } label: {
                    Text("Show Sheet")
                }
            }
        }
    }
}

struct Day9_Previews: PreviewProvider {
    static var previews: some View {
        Day9()
    }
}

struct NextView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationLink {
            NextView2(isPresented: $isPresented)
        } label: {
            Text("Go to Next")
        }
    }
}

struct NextView2: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationLink {
            NextView3(isPresented: $isPresented)
        } label: {
            Text("Go to Next")
        }
    }
}

struct NextView3: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        Button {
            self.isPresented.toggle()
        } label: {
            Text("")
        }
    }
}
