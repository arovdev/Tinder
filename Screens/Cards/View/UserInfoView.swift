//
//  UserInfoView.swift
//  Tinder
//
//  Created by Arthur Reshetnyak on 2024-03-22.
//

import SwiftUI

struct UserInfoView: View {
    @Binding var showProfileSheet: Bool
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(user.fullname)")
                    .font(.title)
                    .fontWeight(.heavy)
                    .lineLimit(1)
                
                Text("\(user.age)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    showProfileSheet.toggle()
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                }
            }
            
            if let bio = user.bio {
                Text(bio)
                    .font(.subheadline)
                    .lineLimit(2)
            }
        }
        .foregroundColor(.white)
        .padding(.vertical, 35)
        .padding(.horizontal, 30)
        .background {
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        }
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(showProfileSheet: .constant(false), user: MockData.users[0])
    }
}
