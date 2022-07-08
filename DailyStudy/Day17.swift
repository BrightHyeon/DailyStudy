//
//  Day17.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/07/08.
//

import SwiftUI

struct Day17: View {
    @StateObject var sm: StateManager = StateManager()
    
    var body: some View {
        Button {
            sm.isShowFullScreenSheet.toggle()
            sm.fullScreenType = .first
        } label: {
            Text("show full screen")
        }
        .fullScreenCover(isPresented: $sm.isShowFullScreenSheet) {
            switch sm.fullScreenType {
            case .first:
                FirstView(sm: sm)
            case .second:
                SecondView(sm: sm)
            case .third:
                ThirdView(sm: sm)
            }
        }
    }
}

struct Day17_Previews: PreviewProvider {
    static var previews: some View {
        Day17()
    }
}

final class StateManager: ObservableObject {
    
    @Published var isShowFullScreenSheet: Bool = false
    @Published var fullScreenType: FullScreenType = .first
    
}

enum FullScreenType {
    case first, second, third
}


struct FirstView: View {
    @ObservedObject var sm: StateManager
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Button {
                        sm.isShowFullScreenSheet = false
                    } label: {
                        Text("취소").modifier(PinStepButton())
                    }
                    Button {
                        withAnimation {
                            sm.fullScreenType = .second
                        }
                    } label: {
                        Text("다음 단계로").modifier(PinStepButton())
                    }
                }
            }
        }
    }
}

struct SecondView: View {
    @ObservedObject var sm: StateManager
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Button {
                        withAnimation {
                            sm.fullScreenType = .first
                        }
                    } label: {
                        Text("이전 단계로").modifier(PinStepButton())
                    }
                    Button {
                        withAnimation {
                            sm.fullScreenType = .third
                        }
                    } label: {
                        Text("다음 단계로").modifier(PinStepButton())
                    }
                }
            }
        }
    }
}

struct ThirdView: View {
    @ObservedObject var sm: StateManager
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Button {
                        withAnimation {
                            sm.fullScreenType = .second
                        }
                    } label: {
                        Text("이전 단계로").modifier(PinStepButton())
                    }
                    Button {
                        sm.isShowFullScreenSheet = false
                    } label: {
                        Text("완료").modifier(PinStepButton())
                    }
                }
            }
        }
    }
}
