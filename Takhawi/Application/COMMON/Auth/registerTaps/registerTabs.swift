//
//  registerTabs.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//

import SwiftUI






struct registerTabs: View {
  
    
    @State var tabSelection = 1
    @State var test : String = ""
    @State var imageData : Data?
    @State var email : String = ""
    @State var password : String = ""
    @State var confirmPassword : String = ""
    @State var genderIndex : Int = 0
    @State var fullName : String = ""
    
    var phone : String = ""

    
    var action: (_ name : String , _ email : String , _ password : String , _ phone : String , _ genderIndex : Int ) -> Void
    var BackAction: () -> Void
    var showTermsaction: (() -> Void)?
    var IsArabicLang : Bool {
        if LocalizationManager.shared.getLanguage() == .Arabic {
            return true
        } else {
            return false
        }
    }
    
  
    var body: some View {
       
        ScrollView( showsIndicators: false )  {
            
                HStack {
                    Image( "Group 25")
                        .resizable()
                        .frame(width: 40  , height : 40  )
                        .onTapGesture {
                            self.BackAction()
                        }
                    Spacer()
                }.padding(.leading)
                .padding(.trailing)
                .padding(.top)
             

            Text ("Signup".localize)
                
                .font(.custom( IsArabicLang ? AppFont.arBold.rawValue : AppFont.Bold.rawValue, size: 33))
                .foregroundColor(Color("MainColor"))
                .padding(8)

            Group {
                Text("Please ".localize)
                    .font(.custom(IsArabicLang ? AppFont.arRegular.rawValue : AppFont.Regular.rawValue , size: 18))
                +
                Text("provide following details ".localize)
                    .font(.custom(IsArabicLang ? AppFont.arBold.rawValue : AppFont.Bold.rawValue , size: 18))
                +
                Text("for your new account".localize)
                    .font(.custom(IsArabicLang ? AppFont.arRegular.rawValue : AppFont.Regular.rawValue , size: 18))
                    
                }
                
                .fixedSize(horizontal: false, vertical: true)
             
                .frame( maxWidth: .infinity ,  alignment: .center)
                .padding(8)
                .padding(.horizontal)
                TabView (selection: $tabSelection) {
                    
                    tap1(email: $email)
                       
                        .tag(1)
                    tap2( confirmPassword:  $confirmPassword , password: $password ) {
                        self.showTermsaction?()
                      
                    }
                        
                       
                       
                        .tag(2)
                    tab3(index: $genderIndex)
                        
                        .tag(3)
                    tab4(fullName: $fullName )
                      
                        .tag(4)
                    
                    
                } .tabViewStyle(.page(indexDisplayMode: .never))
                .padding(.leading , 25 )
                .padding(.trailing , 25 )
                .onChange(of: tabSelection) { newtabSelection in
                    
                    self.userSignUpValidation(newTab: newtabSelection )
                }
            
            
            
            
             .frame(height: UIScreen.main.bounds.size.height * 0.45)
               
            
            HStack ( spacing: 10) {
                ForEach((1...4), id: \.self) { item in
                    Circle()
                        .frame(width: 15 , height: 15 , alignment: .center)
                        .foregroundColor( item == tabSelection ?  Color("MainColor") : Color.gray.opacity(0.4))
                }
                
            }
            .padding()
   
            Button {
               
                if tabSelection == 4 {
                    // validation + end point
                   
                    
                  
                        if self.fullName == "" {
                            showPopTopAlert(title: "Error!".localize  , withMessage: "Please add your fullname first!".localize , success: false )
                        } else {
                            // signup request
                            self.sighUp(name: self.fullName, email: self.email, password: self.password, gender: self.genderIndex, phone: self.phone)
                        }
                        
                    
                    
                    
                 
                   
                } else {
                    
                    
                    // go next
                   
                        
                   
                    if tabSelection == 1 {
                        withAnimation {
                            self.tabSelection = 2
                        }
                         
           
                      
                    } else if tabSelection == 2 {
                        withAnimation {
                            self.tabSelection = 3
                        }
                           
                       
                      
                    } else if  tabSelection == 3 {
                        withAnimation {
                            self.tabSelection = 4
                        }
                      
                    }
                    
                    
                    
                }
            } label: {
                Text( "Next".localize)
                    .font(.custom(IsArabicLang ? AppFont.arBold.rawValue : AppFont.Bold.rawValue , size: 20))
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color("MainColor"))
                    .cornerRadius(27.5)
                    .padding(25)
                    .shadow(color: Color("MainColor").opacity(0.6), radius: 3 , x: 0 , y: 3)
            }
           
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
       
        .navigationBarBackButtonHidden(true)
        
        
        .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color("BackGroundColor"))
       
        .environment(\.layoutDirection,   .leftToRight  )
  
    }
}



