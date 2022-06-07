//
//  Day3.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/06/08.
//
//  sheet(item:onDismiss:content:)

import SwiftUI

struct Day3: View {
    @State private var sheetDetail: InventoryItem?
    
    var body: some View {
        Button("Show Part Details") {
            sheetDetail = InventoryItem(
                id: "0123456789",
                partNumber: "Z-1234A",
                quantity: 100,
                name: "Widget")
        }
        .sheet(item: $sheetDetail, onDismiss: didDismiss) { detail in
            VStack(alignment: .leading, spacing: 20) {
                Text("Part Number: \(detail.partNumber)")
                Text("Name: \(detail.name)")
                Text("Quantity On-Hand: \(detail.quantity)")
                Button {
                    sheetDetail = InventoryItem(
                        id: "\((0...100).randomElement()!)",
                        partNumber: "Z-1234A",
                        quantity: 100,
                        name: "Widget")
                } label: {
                    Text("ID Random Change")
                }
            }
            .onTapGesture {
                sheetDetail = nil
            }
        }
    }
    
    func didDismiss() {
        //Handle the dismissing action.
        print("Dismiss!")
    }
}

struct Day3_Previews: PreviewProvider {
    static var previews: some View {
        Day3()
    }
}

//MARK: Sample Model
struct InventoryItem: Identifiable {
    var id: String
    let partNumber: String
    let quantity: Int
    let name: String
}

/*
 Summary
 
 1. 옵셔널 Source of Truth 형태로 데이터를 받음.
 2. 값이 nil이면 sheet이 올라오지않음.
 3. 값이 있으면 올라옴.
 4. 값이 변경되면, sheet가 dismiss되고 바로 새로운 sheet이 올라옴.
 5. onDismiss -> sheet가 dismiss될 때 호출되는 메서드.
 */
