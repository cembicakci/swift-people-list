//
//  PillComponent.swift
//  List
//
//  Created by Cem Bıçakcı on 5.11.2023.
//

import SwiftUI

struct PillComponent: View {
    
    let id: String
    
    var body: some View {
        Text("#\(id)")
            .font(
                .system(.caption, design: .rounded)
                .bold()
            )
            .foregroundColor(.white)
            .padding(.horizontal, 6)
            .padding(.vertical, 4)
            .background(Theme.pill, in: Capsule())
    }
}

struct PillComponent_Previews: PreviewProvider {
    static var previews: some View {
        PillComponent(id: "0")
    }
}
