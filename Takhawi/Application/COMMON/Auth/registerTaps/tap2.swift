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
    @State var checkTerms : Bool = true
    
    
    
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

                
                Text( "I agree to the terms and conditions".localize)
                    .font(.custom( LocalizationManager.shared.getLanguage() == .Arabic ?  AppFont.arRegular.rawValue :  AppFont.Regular.rawValue , size: 13))
                    .fixedSize()
                    .frame(maxWidth: .infinity , alignment : .leading)
                
            }.padding(.horizontal)
            
           Spacer()
           
        }.padding(8)
    }
}

struct tap2_Previews: PreviewProvider {
    static var previews: some View {
        tap2(confirmPassword: Binding.constant("") , password: Binding.constant(""))
    }
}



