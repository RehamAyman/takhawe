//
//  animatedCartSwiftuiView.swift
//  Takhawi
//
//  Created by Mac on 21/12/2023.
//

import SwiftUI

struct animatedCartSwiftuiView : View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(CardModel.cards) { card in
                    VStack {
                        GeometryReader { gee in
                            CardItemView(colors: card.colors)
                                .rotation3DEffect(.degrees(-Double(gee.frame(in: .global).minX / 15)), axis: (x: 0, y: 1, z: 0))
                        }
                        .frame(width: 250, height: 250)
                    }
                }
            }
            .padding(.horizontal)
        }.ignoresSafeArea(.keyboard)
      
      
        
        
        
        
        
    }
}

#Preview {
    animatedCartSwiftuiView()
}
