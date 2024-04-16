//
//  CardImageIndicatorView.swift
//  Tinder
//
//  Created by Arthur Reshetnyak on 2024-03-22.
//

import SwiftUI

struct CardImageIndicatorView: View {
    let currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack {
            ForEach(0 ..< imageCount, id: \.self) { index in
                Capsule()
                    .foregroundStyle(currentImageIndex == index ? .white : .black.opacity(0.15))
                    .frame(width: imageIndicatorWidth, height: 4)
            }
        }
    }
}

private extension CardImageIndicatorView {
    var imageIndicatorWidth: CGFloat {
        return SizeConstants.cardWidth / CGFloat(imageCount) - 20
    }
}

struct CardImageIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        CardImageIndicatorView(currentImageIndex: 0, imageCount: 3)
    }
}
