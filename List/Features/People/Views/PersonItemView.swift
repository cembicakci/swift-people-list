//
//  PersonItemView.swift
//  List
//
//  Created by Cem Bıçakcı on 5.11.2023.
//

import SwiftUI

struct PersonItemView: View {
    
    let user: User
    
    var body: some View {
        VStack(spacing: .zero) {
            AsyncImage(url: .init(string: user.avatar)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 130)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                PillComponent(id: "\(user.id ?? 0)")
                
                Text("\(user.firstName ?? "") \(user.lastName ?? "")")
                    .foregroundColor(Theme.text)
                    .font(
                        .system(.body, design: .rounded)
                    )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Theme.detailBackground)
        }
        
        .clipShape(
            RoundedRectangle(
                cornerRadius: 12,
                style: .continuous
            )
        )
        
        .shadow(
            color: Theme.text.opacity(0.1),
            radius: 2,
            x: 0,
            y: 1
        )
    }
}

struct PersonItemView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        PersonItemView(user: User(id: 1, email: "test@gmail.com", firstName: "Cem", lastName: "Bicakci", avatar: "https://reqres.in/img/faces/1-image.jpg"))
            .frame(width: 250)
    }
}
