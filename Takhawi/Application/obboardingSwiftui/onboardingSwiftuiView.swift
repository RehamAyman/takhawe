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
    @State private var textTitle: String = "Whenever you go, You will find a friend".localize
  @State var tabSelection : Int = 0
  @State private var progress: CGFloat = 0.25
  @State var doAction : Bool = false
    var GotoPhoneAction: (() -> Void)?
    @State var langIcon : String = "Frame 1000003388"
    
@GestureState var offset : CGFloat = 0
    
  let hapticFeedback = UINotificationFeedbackGenerator()
  
    
  // MARK: - BODY
  
  var body: some View {
    ZStack {
        Color ( "BackGroundColor")
        .ignoresSafeArea(.all, edges: .all)
        
      
       
      VStack(spacing: 20) {
          HStack {
              Image ( "logo 1")
                  .resizable()
                  .frame(width: 45 , height: 40)
              Spacer()
              Image (langIcon)
                  .resizable()
                  .frame(width: 80 , height: 50)
                  .onTapGesture {
                      print("change language ")
                      
                      if LocalizationManager.shared.getLanguage() == .Arabic {
                          LocalizationManager.shared.setLanguage(language: .English)
                          self.langIcon = "Frame 1000003388"
                      } else {
                          LocalizationManager.shared.setLanguage(language: .Arabic)
                         
                          self.langIcon = "Frame 1000003387"
                      }
                      
                    
                  }
          }
          .padding(.horizontal)
          
          Spacer()
          
//          TabView(selection: $tabSelection ,
//                  content:  {
//            
      
          
          SecSnapCarousel(index: $tabSelection  , doAction: $doAction, imgOffset: $imageOffset, items: OnboardingModel.cards, content: { id  in
              
              firstOnboardingView(imageOffset: $imageOffset, isAnimating: $isAnimating  , indicatorOpacity: $indicatorOpacity , textTitle: $textTitle , tabselection: $tabSelection)
                  .tag(0)
                  .id(0)
              
              secOnboardingView(imageOffset: $imageOffset, isAnimating: $isAnimating  , indicatorOpacity: $indicatorOpacity , textTitle: $textTitle , tabselection: $tabSelection)
                  .tag(1)
                  .id(1)
              thirdOnboardingView(imageOffset: $imageOffset, isAnimating: $isAnimating  , indicatorOpacity: $indicatorOpacity , textTitle: $textTitle , tabselection: $tabSelection)
                  .tag(2)
                  .id(2)
              
              forthOnboardingView(imageOffset: $imageOffset, isAnimating: $isAnimating  , indicatorOpacity: $indicatorOpacity , textTitle: $textTitle , tabselection: $tabSelection)
                  .tag(3)
                  .id(3)
              
              
              //  })
          })
      
           
   
        .background( Color ( "BackGroundColor"))
       

           // Spacer()
              
          VStack {
              
        
                  VStack(spacing: 0) {
                      Text( tabSelection == 0 ? textTitle : tabSelection == 1 ? "We connect you with someone who understands you".localize : tabSelection == 2 ? "Increase your income on your way".localize : "Start creating your Trip now".localize )
                          .foregroundColor(.black)
                          .transition(.opacity)
                          .multilineTextAlignment(.center)
                          .id(textTitle)
                          .frame( height: 70 )
                          .padding()
                          .font(.custom( LocalizationManager.shared.getLanguage() == .Arabic ?  AppFont.arMedium.rawValue :  AppFont.Bold.rawValue , size: 26))
                         
                      HStack ( spacing: 10) {
                          ForEach((0...3), id: \.self) { item in
                              if item == tabSelection {
                                  Capsule()
                                      .frame(width: 25 , height: 10 , alignment: .center)
                                      .foregroundStyle(Color( "MainColor"))
                                  
                              } else {
                                  Circle()
                                      .frame(width: 10 , height: 10 , alignment: .center)
                                      .foregroundColor(   Color("secFavSeg") )
                              }
                          }
                          
                      }

                  }
                  .opacity(isAnimating ? 1 : 0)
                  .offset(y: isAnimating ? 0 : -40)
                  .animation(.easeOut(duration: 1), value: isAnimating)
                  
                  
                  // MARK: - FOOTER
    
                      ZStack {
                          CircularProgressView(progress: progress)
                                 .frame(width: 66, height: 66 )
                          ZStack {
                            
                              Image("Icon_arrow")
                                  .resizable()
                                  .frame(width: 50, height: 50, alignment: .center)
                    }
                          .foregroundColor(.gray)
                          .frame(width: 50 , height: 50, alignment: .center)
                          
                          
                          
                          .offset(x: buttonOffset)
                         
                        
                          
                          Spacer()
                      } //: HSTACK
                    
                      .onTapGesture {
                         
                        isAnimating = false
                          withAnimation {
                              if self.tabSelection < 3 {
                                  
                                  self.doAction = true
                                  self.tabSelection += 1
                                  isAnimating = true
                                 
                              } else if self.tabSelection == 3  {
                                  print("now we done intro go to add phone  ")
                                 // playSound(sound: "chimeup", type: "mp3")
                                  self.GotoPhoneAction?()
                              }
                          }
                         
                      }
                      .onChange(of: tabSelection ) { newValue in
                                  
                          if newValue == 0 {
                              self.progress = 1/4
                          } else if newValue == 1 {
                              self.progress = 2/4
                          } else if newValue == 2 {
                              self.progress = 3/4
                          } else {
                            //  playSound(sound: "chimeup", type: "mp3")
                              self.progress = 1
                              
                              
                            //  hapticFeedback.notificationOccurred(.success)
//                              playSound(sound: "chimeup", type: "mp3")
                          }
                        
                         
                                 }
                  

                  .frame(width: 80 , height: 80 , alignment: .center)
                  .padding()
                  .opacity(isAnimating ? 1 : 0)
                  .offset(y: isAnimating ? 0 : 40 )
                  .animation(.easeOut(duration: 1), value: isAnimating)
                  
              }
              
              
              .frame(maxWidth: .infinity )
              .frame(height:  UIScreen.main.bounds.height * 0.26)
              .background(Color.white.opacity(0.2))
       
          
          
             
             
      } //: VSTACK
      .environment(\.layoutDirection,  .leftToRight  )
      
    } //: ZSTACK
    .navigationBarTitle("")
    .navigationBarHidden(true)

    .onAppear(perform: {
      isAnimating = true
        
        if LocalizationManager.shared.getLanguage() == .Arabic {
            self.langIcon = "Frame 1000003387"
        } else {
            self.langIcon = "Frame 1000003388"
        }
        UIScrollView.appearance().bounces = false
        
        
    })
  //  .preferredColorScheme(.dark)
  }
        
}

// MARK: - PREVIEW
struct onboardingSwiftuiView_Previews: PreviewProvider {
  static var previews: some View {
      onboardingSwiftuiView()
  }
}


