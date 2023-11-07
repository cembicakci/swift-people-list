//
//  CheckmarkPopover.swift
//  List
//
//  Created by Cem Bıçakcı on 7.11.2023.
//

import SwiftUI

struct CheckmarkPopover: View {
    var body: some View {
        Symbols.checkmark
            .font(.system(.largeTitle, design: .rounded).bold())
            .padding()
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct CheckmarkPopover_Previews: PreviewProvider {
    static var previews: some View {
        CheckmarkPopover()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(.blue)
    }
}
