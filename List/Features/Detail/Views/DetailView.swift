//
//  DetailView.swift
//  List
//
//  Created by Cem Bıçakcı on 5.11.2023.
//

import SwiftUI

struct DetailView: View {
    
    @State private var userInfo: UserDetailResponse?
    
    var body: some View {
        ZStack {
            background
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 18) {
                    avatar
                    general
                    
                }
                .padding()
                
            }
        }
        .navigationTitle("Details")
        .onAppear {
            do {
                userInfo = try StaticJSONMapper.decode(file: "SingleUserData", type: UserDetailResponse.self)
            } catch {
                // TODO: Error
                print(error)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView()
        }
    }
}

private extension DetailView {
    var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .top)
    }
    
    @ViewBuilder
    var avatar: some View {
        if let avatarString = userInfo?.data?.avatar,
            let avatarUrl = URL(string: avatarString) {
            
            AsyncImage(url: avatarUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            
        }
    }
}

private extension DetailView {

    var general: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            PillComponent(id: userInfo?.data?.id ?? 0)
            
            Group {
                firstname
                lastname
                email
            }
            .foregroundColor(Theme.text)
            
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 18)
        .background(Theme.detailBackground, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
    
    @ViewBuilder
    var firstname: some View {
        Text("First Name")
            .font(
                .system(.body, design: .rounded)
                .weight(.semibold)
            )
        
        Text(userInfo?.data?.firstName ?? "-")
            .font(
                .system(.subheadline, design: .rounded)
            )
        
        Divider()
    }
    
    @ViewBuilder
    var lastname: some View {
        Text("Last Name")
            .font(
                .system(.body, design: .rounded)
                .weight(.semibold)
            )
        
        Text(userInfo?.data?.lastName ?? "-")
            .font(
                .system(.subheadline, design: .rounded)
            )
        
        Divider()
    }
    
    @ViewBuilder
    var email: some View {
        Text("Email")
            .font(
                .system(.body, design: .rounded)
                .weight(.semibold)
            )
        
        Text(userInfo?.data?.email ?? "-")
            .font(
                .system(.subheadline, design: .rounded)
            )
        
        Divider()
    }
}
