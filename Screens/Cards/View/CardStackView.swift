//
//  CardStackView.swift
//  Tinder
//
//  Created by Arthur Reshetnyak on 2024-03-22.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var vm = CardsViewModel(service: CardService())
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                ZStack {
                    ForEach(vm.cardModels) { card in
                        CardView(vm: vm, model: card)
                    }
                }
                
                if !vm.cardModels.isEmpty {
                    SwipeActionButtonsView(vm: vm)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("tinder")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100)
                }
            }
        }
    }
}

struct CardStackView_Previews: PreviewProvider {
    static var previews: some View {
        CardStackView()
    }
}
