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
    
    var body: some View {
        HStack {
            Text(model.name)
            
            Spacer()
            
            Text("\(model.age)")
                .onChange(of: model.age) { newValue in
                    print(model.age, newValue)
                }
            
            Button {
                viewModel.models[4].age += 1
            } label: {
                Image(systemName: "arrowtriangle.up.circle")
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
}

final class Day1ViewModel: ObservableObject {
    @Published var models: [Day1Model] = [
        Day1Model(name: "Tamna", age: 26),
        Day1Model(name: "Bigsun", age: 28),
        Day1Model(name: "Antony", age: 27),
        Day1Model(name: "Joon", age: 23),
        Day1Model(name: "K", age: 99),
        Day1Model(name: "Louie", age: 35)
    ]
}

struct Day1Model: Identifiable {
    let id = UUID()
    var name: String
    var age: Int
}

/*
 Day1_Summary
 
 @Binding으로 넘기지 않더라도, viewModel의 값을 바꿔주면 상위 뷰가 달라진 데이터를 기반으로 다시 뷰를 렌더링하기때문에 하위뷰인 Day1Cell의 Text값도 새로 넘겨지며 그려지게된다.
 
 @State - @Binding 관계는 단지 보다 상위뷰의 데이터를 하위뷰에서 조작이 가능하도록 한 것이다.
 */
