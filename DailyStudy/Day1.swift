//
//  Day1.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/06/06.
//
// MARK: ViewModel -> ParentView -> SubView의 뷰 렌더링 흐름 파악하기.

import SwiftUI

struct Day1: View {
    @EnvironmentObject var viewModel: Day1ViewModel
    
    var body: some View {
        VStack {
            ForEach(viewModel.models) {
                Day1Cell(model: $0)
            }
        }
    }
}

struct Day1_Previews: PreviewProvider {
    static var previews: some View {
        Day1()
            .environmentObject(Day1ViewModel())
    }
}

struct Day1Cell: View {
    @EnvironmentObject var viewModel: Day1ViewModel
    var model: Day1Model
    var modelIndex: Int {
        viewModel.models.firstIndex {
            $0.id == model.id
        }!
    }
    
    var body: some View {
        HStack {
            Text(model.name)
                .foregroundColor(model.isMan ? .red : .green)
                .scaleEffect(model.isMan ? 1.5 : 1)
            
            Spacer()
            
            Text("\(model.age)")
                .onChange(of: model.age) { newValue in
                    print(model.age, newValue)
                }
            
            Button {
                withAnimation(Animation.spring()) {
                    cellControl(modelIndex)
                }
                print(model.isMan)
            } label: {
                Image(systemName: "arrowtriangle.up.circle")
                    .foregroundColor(model.isMan ? .mint : .white)
                    .scaleEffect(model.isMan ? 1 : 0)
            }
        }
        .font(.title.bold())
        .foregroundColor(.white)
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 10)
        )
        .padding()
    }
    
    func cellControl(_ index: Int) {
        viewModel.models[index].age += 1
        viewModel.models[index].isMan.toggle()
    }
}

final class Day1ViewModel: ObservableObject {
    @Published var models: [Day1Model] = [
        Day1Model(name: "Tamna", age: 26, isMan: true),
        Day1Model(name: "Bigsun", age: 28, isMan: true),
        Day1Model(name: "Antony", age: 27, isMan: true),
        Day1Model(name: "Joon", age: 23, isMan: true),
        Day1Model(name: "K", age: 99, isMan: true),
        Day1Model(name: "Louie", age: 35, isMan: false)
    ]
}

struct Day1Model: Identifiable {
    let id = UUID()
    var name: String
    var age: Int
    var isMan: Bool
}

/*
 Day1_Summary
 
 @Binding으로 넘기지 않더라도, viewModel의 값을 바꿔주면 상위 뷰가 달라진 데이터를 기반으로 다시 뷰를 렌더링하기때문에 하위뷰인 Day1Cell의 Text값도 새로 넘겨지며 그려지게된다.
 
 @State - @Binding 관계는 단지 보다 상위뷰의 데이터를 하위뷰에서 조작이 가능하도록 한 것이다.
 */
