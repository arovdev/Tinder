//
//  ImageScrollingOverlayView.swift
//  Tinder
//
//  Created by Arthur Reshetnyak on 2024-03-22.
//

import SwiftUI

struct ImageScrollingOverlayView: View {
    @Binding var currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack {
            Rectangle()
                .onTapGesture {
                    updateImageIndex(increment: false)
                }
            
            Rectangle()
                .onTapGesture {
                    updateImageIndex(increment: true)
                }
        }
        .foregroundStyle(.white.opacity(0.01))
    }
}

private extension ImageScrollingOverlayView {
    func updateImageIndex(increment: Bool) {
        if increment {
            guard currentImageIndex < imageCount - 1 else { return }
            currentImageIndex += 1
        } else {
            guard currentImageIndex > 0 else { return }
            currentImageIndex -= 1
        }
    }
}

struct ImageScrollingOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        ImageScrollingOverlayView(currentImageIndex: .constant(0), imageCount: 1)
    }
}
