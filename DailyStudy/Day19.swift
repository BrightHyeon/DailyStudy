//
//  Day19.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/07/10.
//

import SwiftUI

struct Day19: View {
    let title: String = "hello world!"
    
    var body: some View {
        Text(title.capitalizeFirstLetter())
    }
}

struct Day19_Previews: PreviewProvider {
    static var previews: some View {
        Day19()
    }
}

extension String {
    
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
}
