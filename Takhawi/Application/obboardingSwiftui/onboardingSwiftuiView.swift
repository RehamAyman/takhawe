//
//  onboardingSwiftuiView.swift
//  Takhawi
//
//  Created by Reham Ayman on 09/01/2024.
//

import SwiftUI

import SwiftUI

struct onboardingSwiftuiView : View {
  // MARK: - PROPERTY
  
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  
  @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
  @State private var buttonOffset: CGFloat = 0
  @State var isAnimating: Bool = false
  @State var imageOffset: CGSize = .zero
  @State private var indicatorOpacity: Double = 1.0
  @State private var textTitle: String = "Welcome to Takhawi"
  @State var tabSelection : Int = 0
  @State private var progress: CGFloat = 0.25
    
    
    
@GestureState var offset : CGFloat = 0
    
  let hapticFeedback = UINotificationFeedbackGenerator()
  
    
  // MARK: - BODY
  
  var body: some View {
    ZStack {
        Color.gray
        .ignoresSafeArea(.all, edges: .all)
      
      VStack(spacing: 20) {
   
          Spacer()
          

          SecSnapCarousel(index: $tabSelection  , imgOffset: $imageOffset, items: OnboardingModel.cards, content: { id  in
              firstOnboardingView(imageOffset: $imageOffset, isAnimating: $isAnimating  , indicatorOpacity: $indicatorOpacity , textTitle: $textTitle , tabselection: $tabSelection)
                  .tag(0)
              firstOnboardingView(imageOffset: $imageOffset, isAnimating: $isAnimating  , indicatorOpacity: $indicatorOpacity , textTitle: $textTitle , tabselection: $tabSelection)
                  .tag(1)
              VStack {
                      Color.red
                  }
              .tag(2)
              
          })
            
        
         
              
              
        
          
          
          
          
             
             
   
        .background(Color.gray)
       

            Spacer()
              
              VStack {
                  VStack(spacing: 0) {
                      Text(textTitle)
                          .font(.system(size: 30))
                          .fontWeight(.heavy)
                          .foregroundColor(.black)
                          .transition(.opacity)
                          .id(textTitle)
                          .padding(.top)
                          .padding(.bottom , 4 )
                      
                      Text("It's not how much we give but how much love we put into giving.")
                      .font(.system(size: 15))
                      .fontWeight(.light)
                      .foregroundColor(.black)
                      .multilineTextAlignment(.center)
                      .padding(.horizontal, 10)
                      
                     
                  } //: HEADER
                  .opacity(isAnimating ? 1 : 0)
                  .offset(y: isAnimating ? 0 : -40)
                  .animation(.easeOut(duration: 1), value: isAnimating)
                  
                  Spacer()
                  
                  // MARK: - FOOTER
                 
               
                      
                      ZStack {
                          CircularProgressView(progress: progress)
                                 .frame(width: 66, height: 66)
                          ZStack {
                              Circle()
                                  .fill(Color("MainColor"))
                            
                              Image(systemName: "chevron.right")
                                  .font(.system(size: 26, weight: .medium))
                                  .foregroundColor(.white)
                              
                              
                          }
                          .foregroundColor(.gray)
                          .frame(width: 50 , height: 50, alignment: .center)
                          
                          
                          
                          .offset(x: buttonOffset)
                         
                        
                          
                          Spacer()
                      } //: HSTACK
                      .onTapGesture {
                          withAnimation(Animation.easeOut(duration: 0.4)) {
                              
                              if self.progress == 0.75 {
                                  self.progress = progress + 0.25
                                  hapticFeedback.notificationOccurred(.success)
                                  playSound(sound: "chimeup", type: "mp3")
                                  
                              } else {
                                  self.progress = progress + 0.25
                              }
                                
                              
                          }
                      }
                  .frame(width: 80 , height: 80 , alignment: .center)
                  .padding()
                  .opacity(isAnimating ? 1 : 0)
                  .offset(y: isAnimating ? 0 : 40 )
                  .animation(.easeOut(duration: 1), value: isAnimating)
                  
              }
              
              
              .frame(maxWidth: .infinity)
              .frame(height:  UIScreen.main.bounds.height * 0.28)
              .background(Color.white.opacity(0.2))
       
          
          
             
             
      } //: VSTACK
    } //: ZSTACK
    .onAppear(perform: {
      isAnimating = true
        UIScrollView.appearance().bounces = false
        
    })
    .preferredColorScheme(.dark)
  }
}

// MARK: - PREVIEW
struct onboardingSwiftuiView_Previews: PreviewProvider {
  static var previews: some View {
      onboardingSwiftuiView()
  }
}


