//
//  CardView.swift
//  Tinder
//
//  Created by Arthur Reshetnyak on 2024-03-22.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var vm: CardsViewModel
    
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var currentImageIndex = 0
    @State private var showProfileSheet = false
    
    let model: CardModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(user.profileImageURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                    .overlay {
                        ImageScrollingOverlayView(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                
                CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount)
                    .padding(.vertical, 15)
                
                SwipeActionIndicatorView(xOffset: $xOffset)
                    .padding(.vertical, 25)
            }
            
            UserInfoView(showProfileSheet: $showProfileSheet, user: model.user)
        }
        .fullScreenCover(isPresented: $showProfileSheet) {
            UserProfileView(user: user)
        }
        .onReceive(vm.$buttonSwipeAction, perform: { action in
            onReciveSwipeAction(action)
        })
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.easeInOut, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChange)
                .onEnded(onDragEnded)
        )
    }
}

private extension CardView {
    var user: User {
        return model.user
    }
    
    var imageCount: Int {
        return user.profileImageURLs.count
    }
}

private extension CardView {
    func returnToCenter() {
        xOffset = 0
        degrees = 0
    }
    
    func swipeRight() {
        withAnimation(.easeInOut) {
            xOffset = 500
            degrees = 12
        }
               
        vm.removeCard(model)
    }
    
    func swipeLeft() {
        xOffset = -500
        degrees = -12
        
        vm.removeCard(model)
    }
    
    func onReciveSwipeAction(_ action: SwipeAction?) {
        guard let action else { return }
        
        let topCard = vm.cardModels.last
        
        if topCard == model {
            switch action {
            case .reject:
                swipeLeft()
            case .like:
                swipeRight()
            }
        }
    }
}

private extension CardView {
    func onDragChange(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            returnToCenter()
            return
        }
        
        if width >= SizeConstants.screenCutoff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            vm: CardsViewModel(service: CardService()),
            model: CardModel(user: MockData.users[0])
        )
    }
}
