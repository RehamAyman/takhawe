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
                  CircleGroupView(ShapeColor: Color( "MainColor"), ShapeOpacity: 0.2)
                      .offset(x: imageOffset.width * -1)
                      .blur(radius: abs(imageOffset.width / 5))
                      .animation(.easeOut(duration: 1), value: imageOffset)
                  
            
                  
                  RoundedRectangle(cornerRadius: 25)
                      .foregroundColor(.white)
                      .shadow(radius: 20)
                      .frame(   height: 250)
                      .opacity(isAnimating ? 1 : 0)
                      .animation(.easeOut(duration: 0.5), value: isAnimating)
                      .offset(x: imageOffset.width * 1.2, y: 0)
                      .animation(.easeOut(duration: 1), value: imageOffset)
                      .padding(15)
                     
                  
                  
                  
                  Image("Frame 1000003134")
                      .resizable()
                      .scaledToFit()
                      .padding()
                
                     // .fill(Color.white)
                      .shadow(radius: 20)
                      .frame(   height: 250)
                  
                      .padding()
                      .opacity(isAnimating ? 1 : 0)
                      .animation(.easeOut(duration: 0.5), value: isAnimating)
                      .offset(x: imageOffset.width * 1.2, y: 0)     //imageOffset.height * 1.2  )
                      .rotationEffect(.degrees(Double(imageOffset.width / 20 )))

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


