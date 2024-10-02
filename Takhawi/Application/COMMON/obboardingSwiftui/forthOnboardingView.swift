//
//  forthOnboardingView.swift
//  Takhawi
//
//  Created by Reham Ayman on 19/02/2024.
//

import Foundation
import SwiftUI
// Group 200


struct forthOnboardingView: View {
    @Binding var imageOffset: CGSize
    @Binding  var isAnimating: Bool
    @Binding var indicatorOpacity: Double
    @Binding var textTitle: String
    @Binding var tabselection : Int
    
    var body: some View {
      



              ZStack {
                  Image ( "Group 1000003063")
                      .resizable()
                      .scaledToFit()
                      .blur(radius: isAnimating ? 0 : 10)
                      .opacity(isAnimating ? 1 : 0)
                      .scaleEffect(isAnimating ? 1 : 0.4)
                      .animation(.easeOut(duration: 1), value: isAnimating)
                      .offset(x: imageOffset.width * -1)
                     
                     
                      .padding()

                  
                  
                  
                  
                  ZStack (alignment: .leading){
                    
                      Image("iPhone 3")
                          .resizable()
                          .scaledToFit()
                          .padding()
                          .shadow(radius: 20)
                          .opacity(isAnimating ? 1 : 0)
                          .animation(.easeOut(duration: 0.5), value: isAnimating)
                       
                          .offset(x: tabselection == 3 ?  imageOffset.width : 0   , y: tabselection == 3 ? -imageOffset.width : 0  )
                          .animation(.easeOut(duration: 1), value: imageOffset)
                      
                      
                      
                      
                      
                      
                    
                          
                  }
              } //: CENTER
              //
              
              
        
        
        
        
        
        
        
    }
}
struct forthOnboardingView_Previews: PreviewProvider {
  static var previews: some View {
      onboardingSwiftuiView()
  }
}


