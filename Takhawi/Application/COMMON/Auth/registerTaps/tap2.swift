//
//  tap2.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//

import SwiftUI

struct tap2: View {
    
    
    
    @Binding var confirmPassword : String 
    @Binding var password : String
    @Binding var checkTerms : Bool
    var action: (() -> Void)?
    
    
    var body: some View {
        VStack ( spacing: 12) {
          
          Image("padlock 1")
                .resizable()
             //   .scaledToFit()
                .frame(width: 120 , height: 120)
            
            SecureInputView( "Enter New Password".localize , text: $password)
            SecureInputView( "Confirm Password".localize , text: $confirmPassword)
            
            
            HStack{
                
                Image( checkTerms ?  "checkbox" : "UNcheckbox")
                    .resizable()
                    .frame(width: 25 , height: 25 )
                    .onTapGesture {
                        withAnimation {
                            checkTerms.toggle()
                        }
                       
                    }
                    .shadow(color: Color("MainColor"), radius: 1)

                HStack  {
                    if LocalizationManager.shared.getLanguage() == .Arabic {
                        
                        Text( "terms and conditions".localize)
                            .font(.custom(  AppFont.arRegular.rawValue  , size: 12))
                            .foregroundColor(Color( "MainColor") )
                        
                        Text( "I agree to the".localize)
                            .font(.custom(  AppFont.arRegular.rawValue  , size: 12))
                        
                        
                        
                    } else {
                        Text( "I agree to the".localize)
                            .font(.custom(  AppFont.Regular.rawValue , size: 12))
                        Text( "terms and conditions".localize)
                            .font(.custom(  AppFont.Regular.rawValue , size: 12))
                            .foregroundColor(Color( "MainColor") )
                    }
                    
               
                        
                    
                }
                .onTapGesture(perform: {
                    self.action?()
                })
               
                   // .fixedSize()
                    .frame(maxWidth: .infinity , alignment : .leading)
                //terms and conditions
                
                
            }.padding(.horizontal)
            
           Spacer()
           
        }.padding(8)
    }
}
 


