//
//  thirdOnboardingView.swift
//  Takhawi
//
//  Created by Reham Ayman on 16/01/2024.
//

import SwiftUI
// Group 200


struct thirdOnboardingView: View {
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
                  
                     
//                  RoundedRectangle(cornerRadius: 25)
//                      .fill(Color.white)
//                      .shadow(radius: 10)
//                      .frame( width: 200 , height: 400)
//                      .padding()
//
                   Image("Group 200")
                   .resizable()
                    .scaledToFit()
                    .padding()
                    .shadow(radius: 20)
                      .opacity(isAnimating ? 1 : 0)
                      .animation(.easeOut(duration: 0.5), value: isAnimating)
                      .offset(x: imageOffset.width * 1.2, y: 0)     //imageOffset.height * 1.2  )
                      .rotationEffect(.degrees(Double(imageOffset.width / 90 )))
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
              
              
        
        
        
        
        
        
        
    }
}
struct nboardingSwiftuiView_Previews: PreviewProvider {
  static var previews: some View {
      onboardingSwiftuiView()
  }
}


