//
//  NamespaceView.swift
//  Toast1
//
//  Created by Hyeonsoo Kim on 2022/06/11.
//
//  Namespace...

import SwiftUI

struct NamespaceView: View {
    
    var namespace: Namespace.ID
    var imageName: String
    @Binding var isShow: Bool
    @Binding var selection: Int
    
    var body: some View {
        VStack {
            if !isShow {
                Button {
                    withAnimation(Animation.linear) {
                        isShow.toggle()
                        selection = Int(imageName)!
                    }
                } label: {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: imageName, in: namespace)
                        .frame(height: 100)
                        .mask({
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .matchedGeometryEffect(id: "\(imageName)rect", in: namespace)
                                .frame(width: 344, height: 100)
                        })
                        .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 2)
                }
            }
        }
    }
}

struct NameView: View {
    @Binding var isShow: Bool
    var namespace: Namespace.ID
    var imageName: String
    @Binding var isTop: Bool
    
    var body: some View {
        
        ZStack {
//            ScrollView {
                VStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: imageName, in: namespace)
                        .frame(height: 333)
                        .mask({
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .matchedGeometryEffect(id: "\(imageName)rect", in: namespace)
                                .frame(height: 333)
                        })
                    Spacer()
                }
//            }
            .background(.black)
        }
    }
}

struct NamespaceListView: View {
    
    @Namespace var namespace
    @State private var isShow: Bool = false
    @State private var selection: Int = 1
    @State private var isTop: Bool = false
    
    @State private var width = UIScreen.main.bounds.size.width
    @State private var height = UIScreen.main.bounds.size.height
    @State private var offset: CGSize = .zero //MARK: gogo
    
    var body: some View {
        let dragGesture = DragGesture()
//            .updating($offset) { dragValue, state, transaction in
//                state = dragValue.translation
//                print(state.height, offset.height)
//            }
            .onChanged { value in //onChanged는 바뀐 후에 호출된다.
                // Enforce minimum dimensions.
                offset = value.translation
                width = min(max(350, width - value.translation.height/2), UIScreen.main.bounds.size.width)
                height = min(max(700, height - value.translation.height/2), UIScreen.main.bounds.size.height)
            }
            .onEnded { _ in
                if height == 700 {
//                    width = UIScreen.main.bounds.size.width
//                    height = UIScreen.main.bounds.size.height
                    withAnimation(Animation.linear) {
                        isShow.toggle()
                    }
                } else {
                    width = UIScreen.main.bounds.size.width
                    height = UIScreen.main.bounds.size.height
                }
            }
        
        ZStack {
            ScrollView {
                if !isShow {
                    VStack(spacing: 15) {
                        ForEach(1...6, id: \.self) { i in
                            NamespaceView(namespace: namespace, imageName: "\(i)", isShow: $isShow, selection: $selection)
                        }
                    }
                }
            }
            if isShow {
                NameView(isShow: $isShow, namespace: namespace, imageName: "\(selection)", isTop: $isTop)
                    .frame(width: width, height: height + 50)
                    .mask(
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: width, height: height + 50)
                    )
                    .offset(x: 0, y: offset.height < 100 ? offset.height : 100)
                    .gesture(dragGesture)
                    .ignoresSafeArea()
            }
        }
    }
}

struct NamespaceListView_Previews: PreviewProvider {
    static var previews: some View {
        NamespaceListView()
    }
}
