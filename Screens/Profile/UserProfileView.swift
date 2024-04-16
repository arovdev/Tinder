//
//  UserProfileView.swift
//  Tinder
//
//  Created by Arthur Reshetnyak on 2024-03-23.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentImageIndex = 0
    
    let user: User
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                Image(user.profileImageURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: 450)
                    .overlay {
                        ImageScrollingOverlayView(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                    .overlay {
                        ImageScrollingOverlayView(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                
                CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount)
                    .padding(.vertical, 15)
            }
            .frame(width: SizeConstants.cardWidth, height: 450)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack {
                Text(user.fullname)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("\(user.age)")
                    .font(.title2)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.down.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundColor(.pink)
                }
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading) {
                    title(title: "Bio")
                    
                    if let bio = user.bio {
                        Text(bio)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
                
                VStack(alignment: .leading, spacing: 12) {
                    title(title: "Essentials")
                    
                    info(icon: "person", text: user.gender.name)
                    info(icon: "arrow.down.forward.and.arrow.up.backward.circle", text: "None")
                    info(icon: "book", text: "None")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

private extension UserProfileView {
    func title(title: String) -> some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
    }
    
    func info(icon: String, text: String) -> some View {
        HStack {
            Image(systemName: icon)
            Text(text)
        }
    }
}

private extension UserProfileView {
    private var imageCount: Int {
        return user.profileImageURLs.count
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(user: MockData.users[0])
    }
}
