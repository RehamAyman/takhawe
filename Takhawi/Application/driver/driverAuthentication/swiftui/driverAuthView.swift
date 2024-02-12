//
//  driverAuthView.swift
//  Takhawi
//
//  Created by Reham Ayman on 24/01/2024.
//

import SwiftUI
import Neumorphic


struct driverAuthView: View {
    @State var tabSelection : Int = 1
    var action: (() -> Void)?
    var BackAction: (() -> Void)?
    
    
    
    var IsArabicLang : Bool {
        if LocalizationManager.shared.getLanguage() == .Arabic    {
            return true
        } else {
            return false
        }
    }

    
    var body: some View {
        
        VStack ( alignment: .center ){
            HStack {
                Button(action: { self.BackAction?() }, label: {
                    Image("Group 25")
                })

                Spacer()
            }
            .padding(.horizontal)
            .padding(.top , 50 )
            
            Text ("Driver Profile")
                .foregroundStyle(Color( "MainColor"))
                .font(.custom(  (IsArabicLang ? AppFont.arBold : AppFont.Bold).rawValue , size: 28))
  
            
            TabView ( selection: $tabSelection ) {
                tab1UploadIdView()
                .tag(1)
                tab2DrivingLicenseView()
                .tag(2)
                tab3authDriver()
                .tag(3)
                tab4DriverAuthView()
                .tag(4)
                tab5DriverAuth()
                .tag(5)
                tab6DriverAuth()
                .tag(6)
                tab7DriverAuth()
                .tag(7)
                tab8DriverView()
                .tag(8)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))

            Spacer()

            VStack {
                HStack ( spacing: 10) {
                    ForEach((1...8), id: \.self) { item in
                        Circle()
                            .fill( item == tabSelection ? Color( "MainColor") : Color.Neumorphic.main   ).softOuterShadow()
                        
                            .frame(width: 15 , height: 15 , alignment: .center)
                    }
                }
                .padding()
                
                Button {
                    if self.tabSelection == 8 {
                        self.action?()
                    } else if self.tabSelection < 8 {
                        withAnimation {
                            self.tabSelection += 1
                        }
                    }
                } label: {
                    Text( tabSelection == 8 ? "Create Account" : "Next")
                        .font(.custom(IsArabicLang ? AppFont.arBold.rawValue : AppFont.Bold.rawValue , size: 20))
                        .foregroundColor(.white)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color("MainColor"))
                        .cornerRadius(27.5)
                        .padding(25)
                        .padding(.bottom , 30 )
                        .shadow(color: Color("MainColor").opacity(0.6), radius: 3 , x: 0 , y: 3)
                }
            }
            .ignoresSafeArea(.keyboard)
            
  
        }
      //  .frame(maxWidth: .infinity , maxHeight: .infinity , alignment: .center)
        .background(Color ("BackGroundColor" ))
        
      
      
      
    
    }
}

#Preview {
    driverAuthView( BackAction: {})
}


