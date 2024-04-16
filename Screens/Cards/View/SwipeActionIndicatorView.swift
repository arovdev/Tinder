//
//  SwipeActionIndicatorView.swift
//  Tinder
//
//  Created by Arthur Reshetnyak on 2024-03-22.
//

import SwiftUI

struct SwipeActionIndicatorView: View {
    @Binding var xOffset: CGFloat
    
    var body: some View {
        HStack {
            Text("LIKE")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.green)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.green, lineWidth: 2)
                        .frame(width: 100, height: 48)
                }
                .rotationEffect(.degrees(-35))
                .opacity(Double(xOffset / SizeConstants.screenCutoff))
            
            Spacer()
            
            Text("NOPE")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.red)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.red, lineWidth: 2)
                        .frame(width: 100, height: 48)
                }
                .rotationEffect(.degrees(35))
                .opacity(Double(xOffset / SizeConstants.screenCutoff) * -1)
        }
        .padding(40)
    }
}

struct SwipeActionIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeActionIndicatorView(xOffset: .constant(150))
    }
}
