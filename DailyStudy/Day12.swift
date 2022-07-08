//
//  Day12.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/07/01.
//

import SwiftUI

struct Day12: View {
    @State private var isShowingAlert: Bool = false
    @State private var deleteAlert: Bool = false
    
    var body: some View {
        VStack {
            Button {
                isShowingAlert.toggle()
            } label: {
                Text("showing alert")
            }
            
            Button {
                deleteAlert.toggle()
            } label: {
                Text("Delete alert")
            }
        }
        .alert("정말 삭제하시겠습니까", isPresented: $deleteAlert) {
            //cancel과 destructive를 명시적으로 써주면 지정한 "취소", "삭제" 텍스트나옴.
            //desturctive만 쓰면 자동으로 취소버튼이 생성되지만 "cancel"이라고 영어로 나옴.
            Button(role: .cancel) {

            } label: {
                Text("취소")
            }
            Button(role: .destructive) {

            } label: {
                Text("삭제")
            }
        } message: {
            Text("모든 기록이 삭제될 것입니다.")
        }
    }
}

struct Day12_Previews: PreviewProvider {
    static var previews: some View {
        Day12()
    }
}

struct LocationAlert: ViewModifier {
    @Binding var locationServiceEnabled: Bool
    @Binding var locationWhenInUseEnabled: Bool
    func body(content: Content) -> some View {
        content
            .alert("위치 서비스", isPresented: $locationServiceEnabled) {
                Button(role: .cancel) {} label: { Text("취소") }
                Button {
                    //설정창으로 이동
                } label: {
                    Text("설정")
                }
            } message: {
                Text("위치 서비스가 켜져있어야 사용가능한 기능입니다.")
            }
            .alert("위치 접근 권한", isPresented: $locationWhenInUseEnabled) {
                Button(role: .cancel) {} label: { Text("취소") }
                Button {
                    //설정창으로 이동
                } label: {
                    Text("설정")
                }
            } message: {
                Text("위치 접근 권한을 앱을 사용할 때 허용으로 변경해주십시오.")
            }
    }
}
