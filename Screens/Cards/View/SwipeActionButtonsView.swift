//
//  SwipeActionButtonsView.swift
//  Tinder
//
//  Created by Arthur Reshetnyak on 2024-03-23.
//

import SwiftUI

struct SwipeActionButtonsView: View {
    @ObservedObject var vm: CardsViewModel
    
    var body: some View {
        HStack(spacing: 32) {
            Button {
                vm.buttonSwipeAction = .reject
            } label: {
                Image(systemName: "xmark")
                    .fontWeight(.heavy)
                    .foregroundColor(.red)
                    .background(
                        Circle().fill(.white)
                            .frame(width: 48, height: 48)
                            .shadow(radius: 6)
                    )
            }
            .frame(width: 48, height: 48)
            
            Button {
                vm.buttonSwipeAction = .like
            } label: {
                Image(systemName: "heart.fill")
                    .fontWeight(.heavy)
                    .foregroundColor(.green)
                    .background(
                        Circle().fill(.white)
                            .frame(width: 48, height: 48)
                            .shadow(radius: 6)
                    )
            }
            .frame(width: 48, height: 48)
        }
    }
}

struct SwipeActionButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeActionButtonsView(vm: CardsViewModel(service: CardService()))
    }
}
