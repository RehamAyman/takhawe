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
                  Image ( "Group 2 9")
                      .resizable()
                      .blur(radius: isAnimating ? 0 : 10)
                      .opacity(isAnimating ? 1 : 0)
                      .scaleEffect(isAnimating ? 1 : 0.5)
                      .animation(.easeOut(duration: 1), value: isAnimating)
                      .offset(x: imageOffset.width * -1)
                      .frame(width: 250 , height: 300)
                      //.rotationEffect(.degrees(10))
                      .padding(.leading , 70)

              
                  ZStack( alignment: .bottomTrailing) {
                      ZStack (alignment: .leading){
                          
                          
                          
                 
                          
                          Image("iPhone 2")
                              .resizable()
                              .scaledToFit()
                              .padding()
                              .shadow(radius: 20)
                              .opacity(isAnimating ? 1 : 0)
                              .animation(.easeOut(duration: 0.5), value: isAnimating)
                              .offset(x: tabselection == 2 ?  imageOffset.width : 0   , y: tabselection == 2 ? -imageOffset.width : 0  )
                              .animation(.easeOut(duration: 1), value: imageOffset)
                          

                          
                          
                          VStack {
                              Image ("Group 1000003062")
                                  .resizable()
                                  .frame(width: 180 , height: 180)
                                  .padding(.leading , -70)
                                  .padding(.top , 60 )
                              Spacer()
                              HStack {
                                  Image ( "coins-cash-svgrepo-com 1")
                                      .resizable()
                                      .frame(width: 100 , height: 110)
                                      .blur(radius: isAnimating ? 0 : 10)
                                      .opacity(isAnimating ? 1 : 0)
                                      .scaleEffect(isAnimating ? 1 : 0.5)
                                      .animation(.easeOut(duration: 1), value: isAnimating)
                                     // .offset(x: imageOffset.width * -1)
                                      .padding(.leading , -70)
                                  
                              }
                              
                          }
                          
                          
                          
                      }
                    
                      
                      // additional image
                      Image ( LocalizationManager.shared.getLanguage() == .Arabic ?  "onar" : "onen" )
                          .resizable()
                          .scaledToFit()
                          .frame(width: 80 , height: 60 )
                          .blur(radius: isAnimating ? 0 : 10)
                          .opacity(isAnimating ? 1 : 0)
                          .scaleEffect(isAnimating ? 1 : 0.5)
                          .animation(.easeOut(duration: 1), value: isAnimating)
                       //   .offset(x: imageOffset.width * -1)
                          .padding(.trailing , -60)
                      
                      
                      
                  }
                  
                  
              }
        
           
            
        
        
        
        
        
        
    }
}
struct nboardingSwiftuiView_Previews: PreviewProvider {
  static var previews: some View {
      onboardingSwiftuiView()
  }
}


