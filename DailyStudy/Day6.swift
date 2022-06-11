//
//  NamespaceView.swift
//  Toast1
//
//  Created by Hyeonsoo Kim on 2022/06/11.
//
//  Namespace...

import SwiftUI

struct NamespaceView: View {
    
    @Namespace var namespace
    @State private var isShow: Bool = false
    
    var body: some View {
        VStack {
            if !isShow {
                Text("hellodfasf")
                Image("1")
                    .matchedGeometryEffect(id: "rect", in: namespace)
                    .mask({
                        RoundedRectangle(cornerRadius: 20)
                            .matchedGeometryEffect(id: "r", in: namespace)
                            .frame(width: 300, height: 50)
                    })
                    .frame(width: 300, height: 50)
                    .onTapGesture {
                        withAnimation {
                            isShow.toggle()
                        }
                    }
            } else {
                NameView(isShow: $isShow, namespace: namespace)
                    .ignoresSafeArea()
            }
        }
    }
}

struct NamespaceView_Previews: PreviewProvider {
    static var previews: some View {
        NamespaceView()
    }
}

struct NameView: View {
    @Binding var isShow: Bool
    var namespace: Namespace.ID
    
    var body: some View {
        VStack {
            Image("1")
                .matchedGeometryEffect(id: "rect", in: namespace)
                .mask({
                    RoundedRectangle(cornerRadius: 20)
                        .matchedGeometryEffect(id: "r", in: namespace)
                        .frame(width: .infinity, height: 500)
                })
                .frame(width: .infinity, height: 500)
                .onTapGesture {
                    withAnimation {
                        isShow.toggle()
                    }
                }
            Spacer()
        }
    }
}
