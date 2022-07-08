//
//  Day16.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/07/08.
//

import SwiftUI

struct Day16: View {
    @State private var isShow: Bool = false
    var body: some View {
        Button {
            isShow.toggle()
        } label: {
            Text("Show FullScreenSheet")
        }
        .fullScreenCover(isPresented: $isShow) {
            FullScreenSheet()
        }
    }
}

struct Day16_Previews: PreviewProvider {
    static var previews: some View {
        Day16()
    }
}

struct FullScreenSheet: View {
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            OneView(selection: $selection).tag(0)
            TwoView(selection: $selection).tag(1)
            ThreeView(selection: $selection).tag(2)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .ignoresSafeArea()
    }
}

struct OneView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var selection: Int
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("취소").modifier(PinStepButton())
                    }
                    Button {
                        withAnimation {
                            selection = 1
                        }
                    } label: {
                        Text("다음 단계로").modifier(PinStepButton())
                    }
                }
            }
        }
    }
}

struct TwoView: View {
    @Binding var selection: Int
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Button {
                        withAnimation {
                            selection = 0
                        }
                    } label: {
                        Text("이전 단계로").modifier(PinStepButton())
                    }
                    Button {
                        withAnimation {
                            selection = 2
                        }
                    } label: {
                        Text("다음 단계로").modifier(PinStepButton())
                    }
                }
            }
        }
    }
}

struct ThreeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var selection: Int
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Button {
                        withAnimation {
                            selection = 1
                        }
                    } label: {
                        Text("이전 단계로").modifier(PinStepButton())
                    }
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("완료").modifier(PinStepButton())
                    }
                }
            }
        }
    }
}

struct PinStepButton: ViewModifier {
    func body(content: Content) -> some View {
         content
            .font(.title.bold())
            .foregroundColor(.blue)
            .frame(width: UIScreen.main.bounds.width / 2 - 30, height: 100)
            .background(Color.mint.frame(width: 180, height: 80))
    }
}
