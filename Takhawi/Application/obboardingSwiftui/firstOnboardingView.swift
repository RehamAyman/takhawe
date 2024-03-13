//
//  firstOnboardingView.swift
//  Takhawi
//
//  Created by Reham Ayman on 12/01/2024.
//

import SwiftUI

struct firstOnboardingView: View {
    @Binding var imageOffset: CGSize 
    @Binding  var isAnimating: Bool
    @Binding var indicatorOpacity: Double
    @Binding var textTitle: String 
    @Binding var tabselection : Int
    
    var body: some View {
      



              ZStack {
//                  CircleGroupView(ShapeColor: Color( "MainColor"), ShapeOpacity: 0.2)
//                      .offset(x: imageOffset.width * -1)
//                      .blur(radius: abs(imageOffset.width / 5))
//                      .animation(.easeOut(duration: 1), value: imageOffset)
//                  
                  
                  Image ( "onboarding 1")
                      .resizable()
                     
                      .blur(radius: isAnimating ? 0 : 10)
                      .opacity(isAnimating ? 1 : 0)
                      .scaleEffect(isAnimating ? 1 : 0.5)
                      .animation(.easeOut(duration: 1), value: isAnimating)
                      .offset(x: imageOffset.width * -1)
                      
                      
                     
//                  RoundedRectangle(cornerRadius: 25)
//                      .fill(Color.white)
//                      .shadow(radius: 10)
//                      .frame( width: 200 , height: 400)
//                      .padding()
//                  
                   Image("iPhone")
                   .resizable()
                    .scaledToFit()
                    .padding()
                    .padding(.top)
                    .shadow(radius: 20)
                  //  .rotationEffect(.degrees( Double( imageOffset.width / 2)  ))
                      .opacity(isAnimating ? 1 : 0)
                      .animation(.easeOut(duration: 0.5), value: isAnimating)
                      .offset(x: imageOffset.width * 1.2, y: imageOffset.height  )     //imageOffset.height * 1.2  )
                    // .rotationEffect(.degrees(Double(imageOffset.width / 20 )))
//                      .gesture(
//                        DragGesture()
//                            .onChanged { gesture in
//                                if abs(imageOffset.width) <= 150 {
//                                    print("iam here imageOffset.width) <= 150  ")
//                                    
//                                    imageOffset = gesture.translation
//                                    
//                                    withAnimation(.linear(duration: 0.25)) {
//                                        indicatorOpacity = 0
//                                        textTitle = "Give."
//                                    }
//                                }
//                            }
//                            .onEnded { _ in
//                                print("iam here on end ")
//                                imageOffset = .zero
//                                
//                                withAnimation(.linear(duration: 0.25)) {
//                                    indicatorOpacity = 1
//                                    textTitle = "Share."
////                                    self.tabselection = 1
//                                }
//                                
//                                
//                            }
//                      ) //: GESTURE
                      .animation(.easeOut(duration: 1), value: imageOffset)
              } //: CENTER
              //
              .padding(.trailing , 20)
              
        
        
        
        
        
        
        
    }
}
struct oonboardingSwiftuiView_Previews: PreviewProvider {
  static var previews: some View {
      onboardingSwiftuiView()
  }
}


