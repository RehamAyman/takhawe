//
//  secOnboardingView.swift
//  Takhawi
//
//  Created by Reham Ayman on 14/01/2024.
//

import SwiftUI

struct secOnboardingView: View {
    @Binding var imageOffset: CGSize
    @Binding  var isAnimating: Bool
    @Binding var indicatorOpacity: Double
    @Binding var textTitle: String
    @Binding var tabselection : Int
    
    var body: some View {
      



              ZStack {
                  // onboarding 2
                  Image ( "onboarding 2")
                      .resizable()
                      .blur(radius: isAnimating ? 0 : 10)
                      .opacity(isAnimating ? 1 : 0)
                      .scaleEffect(isAnimating ? 1 : 0.5)
                      .animation(.easeOut(duration: 1), value: isAnimating)
                      .offset(x: imageOffset.width * -1)
                  
                  
                     
                   
                  
                  
                  Image("iPhone 1")
                      .resizable()
                      .scaledToFit()
                      .padding()
                      .shadow(radius: 20)
                      .padding()
                      .opacity(isAnimating ? 1 : 0)
                      .animation(.easeOut(duration: 0.5), value: isAnimating)
                      .offset(x: tabselection == 1 ?  imageOffset.width : 0   , y: tabselection == 1 ? -imageOffset.width : 0  )
                      .animation(.easeOut(duration: 1), value: imageOffset)
                  
                  
              } //: CENTER
              //
              
           
        
        
        
        
        
        
    }
}
struct secnboardingSwiftuiView_Previews: PreviewProvider {
  static var previews: some View {
      onboardingSwiftuiView()
  }
}


