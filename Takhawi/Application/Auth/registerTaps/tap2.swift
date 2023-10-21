//
//  tap2.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//

import SwiftUI

struct tap2: View {
    
    
    @State var email : String = ""
    @State var confirmPassword : String = ""
    @State var checkTerms : Bool = true
    
    
    
    var body: some View {
        VStack ( spacing: 15) {
          
          Image("padlock 1")
                .resizable()
                .frame(width:  UIScreen.main.bounds.width * 0.3)
                .frame(height:  UIScreen.main.bounds.height * 0.15)
                .padding(8)
            
            SecureInputView( "Enter New Password" , text: $email)
                .submitLabel(.done)
             
            SecureInputView( "Confirm Password" , text: $confirmPassword)
                .submitLabel(.done)
              
            
            
            HStack{
                
                Image( checkTerms ?  "checkbox" : "UNcheckbox")
                    .resizable()
                    .frame(width: 20 , height: 20 )
                    .onTapGesture {
                        withAnimation {
                            checkTerms.toggle()
                        }
                       
                    }
                    .shadow(color: Color("MainColor"), radius: 1)
                
                
                
                
                Text( "I agree to the terms and conditions")
                    .font(.custom(AppFont.Regular.rawValue, size: 14))
                    .fixedSize()
                    .frame(maxWidth: .infinity)
                
            }.padding()
            
           
            Spacer()
        }.padding(8)
    }
}

struct tap2_Previews: PreviewProvider {
    static var previews: some View {
        tap2()
    }
}



