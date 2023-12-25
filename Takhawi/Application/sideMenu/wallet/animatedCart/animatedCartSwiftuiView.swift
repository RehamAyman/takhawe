//
//  animatedCartSwiftuiView.swift
//  Takhawi
//
//  Created by Mac on 21/12/2023.
//

import SwiftUI

struct animatedCartSwiftuiView : View {
    @State var currentIndex: Int = 0
    @Namespace var animation
 
    
    
    
    var body: some View {
      
       
        SnapCarousel(spacing: 15  , trialingSpace: 100, index: $currentIndex, items: CardModel.cards) { card in
            GeometryReader{proxy in
             //   let size = proxy.size
               
                CardItemView(colors: card.colors )
                   // .frame(width: size.width , height: size.height)
                    .matchedGeometryEffect(id: card.id, in: animation)
                

            } // END GR
        } // END SLIDER
        .padding(.top )
   
//        
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 0) {
//                ForEach(CardModel.cards) { card in
//                    VStack {
//                        GeometryReader { gee in
//        CardItemView(colors: card.colors)
//            .rotation3DEffect(.degrees(-Double(gee.frame(in: .global).minX / 15)), axis: (x: 0, y: 1, z: 0))
//                               
//                        }
//            .frame(width: 250, height: 250)
//                        
//                    }
//                }
//            }
//            .padding(.horizontal)
//            .padding(.top)
//        }
            
            
      
            .ignoresSafeArea(.keyboard, edges: .bottom)
        
        
        
        
    }
}



struct cardsModel : Identifiable {
    var id = UUID().uuidString
    var cardTitle: String
    
    
}


var dummyCards : [cardsModel] = [
    cardsModel(id: "1" , cardTitle: "title 2 " ) ,
    cardsModel(id: "2", cardTitle: "title 1 ") ,
    cardsModel(id: "3" , cardTitle: "title 2 " ) ,
    cardsModel(id: "4", cardTitle: "title 1 ")
    
    ]
