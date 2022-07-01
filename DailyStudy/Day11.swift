//
//  Day11.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/06/26.
//

import SwiftUI

struct Day11: View {
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.2)
            
            VStack {
                
//                Button {} label: {
//                    CircleView(imageName: "star", size: 70, font: .largeTitle)
//                }
//
//                Button {} label: {
//                    FirstTry(Circle()) {
////                        Image(systemName: "star")
////                            .font(.body)
//                        Text("Hello, World~!")
//                    }
//                }
//
//                Button {} label: {
//                    SecondTry(RoundedRectangle(cornerRadius: 20)) {
////                        Image(systemName: "star")
////                            .font(.body)
//                        Text("Hello, World~!")
//                            .font(.largeTitle)
//                    }
                //                }
                
                HStack {
                    Button {} label: {
                        WhiteBackground(RoundedRectangle(cornerRadius: 10), w: .infinity, h: UIScreen.w) {
                            HStack {
                                Text("My France Trip")
                                    .font(.title.bold())
                                Spacer()
                                Image(systemName: "star")
                            }.padding()
                        }
                    }

                    
                    Button {} label: {
                        WhiteBackground(RoundedRectangle(cornerRadius: 10), w: UIScreen.w, h: UIScreen.w) {
                            Image(systemName: "plus")
                                .font(.title.bold())
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding()
                
                HStack(spacing: 15) {
                    Button {} label: {
                        WhiteBackground(Circle(), w: UIScreen.w, h: UIScreen.w) {
                            Image(systemName: "location.fill")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Button {} label: {
                        WhiteBackground(Circle(), w: UIScreen.w*1.5, h: UIScreen.w*1.5) {
                            Image(systemName: "xmark")
                                .font(.largeTitle)
                                .frame(width: 35, height: 35)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Button {} label: {
                        WhiteBackground(Circle(), w: UIScreen.w, h: UIScreen.w) {
                            Image(systemName: "map.fill")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}

struct WhiteBackground<S: Shape, Content: View>: View {
    var shape: S
    var width: CGFloat
    var height: CGFloat
    var content: () -> Content

    init(_ shape: S, w width: CGFloat, h height: CGFloat, @ViewBuilder content: @escaping () -> Content) {
        self.shape = shape
        self.width = width
        self.height = height
        self.content = content
    }
    var body: some View {
        content()
            .maxFrame(width, height)
            .background(
                shape
                    .foregroundColor(.white)
                    .weakShadow()
            )
    }
}

struct Day11_Previews: PreviewProvider {
    static var previews: some View {
        Day11()
    }
}

//sol1. Circle의 크기와 위에 올라오는 요소의 크기까지 받아야하는 불편함. 그리고 Circle한정임.
struct CircleView: View { //location, pin, map buttons...etc...
    var imageName: String
    var size: CGFloat
    var font: Font
    
    var body: some View {
        Circle()
            .frame(width: size, height: size)
            .foregroundColor(.white)
            .weakShadow()
            .overlay(
                Image(systemName: imageName)
                    .font(font)
                    .foregroundColor(.black)
            )
    }
}

//sol2. shape가 아랫단에 있기에 그 위의 content가 그 안에서만 논다는 장점이 있으나, 크기 지정해줘야함.
struct FirstTry<S: Shape, Content: View>: View {
    var shape: S
    var content: () -> Content
    
    init(_ shape: S, @ViewBuilder content: @escaping () -> Content) {
        self.shape = shape
        self.content = content
    }
    
    var body: some View {
        shape
            .frame(width: 70, height: 70)
            .foregroundColor(.white)
            .weakShadow()
            .overlay(
                content()
            )
    }
}


//sol3. 이런식으로하는것이 터치반경이 딱 동그라미에 알맞게된다. 단 text는 circle과는 맞지않음.
struct SecondTry<S: Shape, Content: View>: View {
    var shape: S
    var content: () -> Content
    
    init(_ shape: S, @ViewBuilder content: @escaping () -> Content) {
        self.shape = shape
        self.content = content
    }
    
    var body: some View {
        content()
            .padding()
            .background(
                shape
                    .foregroundColor(.white)
                    .weakShadow()
            )
    }
}

extension UIScreen {
    static let w = UIScreen.main.bounds.width / 9
}

extension View {
    func weakShadow() -> some View { //MainView components들의 shadow.
        self
            .shadow(color: .black.opacity(0.1), radius: 2, x: 0.5, y: 0.5)
    }
    
    func maxFrame(_ width: CGFloat, _ height: CGFloat) -> some View {
        self
            .frame(maxWidth: width, maxHeight: height)
    }
}
