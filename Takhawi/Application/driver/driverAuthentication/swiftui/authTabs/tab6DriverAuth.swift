//
//  tab6DriverAuth.swift
//  Takhawi
//
//  Created by Reham Ayman on 05/02/2024.
//

import SwiftUI

struct tab6DriverAuth: View {
    @State var VehicleAlphabetText : String = ""
    
    //Vehicle alphapit
    @Binding var AOne: String
    @Binding var ATwo: String
    @Binding var AThree: String
    @State var AFour: String = ""
    
    // Vehicle Number
    @Binding var pinOne: String
    @Binding var pinTwo: String
    @Binding var pinThree: String
    @Binding var pinFour: String
    
    var IsArabicLang : Bool {
        if LocalizationManager.shared.getLanguage() == .Arabic {
            return true
        } else {
            return false
        }
    }
    
    
    
    
    var body: some View {
        VStack  {
        
            VStack ( alignment: .leading , spacing: 3) {
                Text ( "1. Locate the Vehicle Number input field.".localize)
                Text ( "2. Enter the numerical part, then the alphabetical part.".localize)
                Text ( "3. Verify the entered information for accuracy.".localize)
                Text ( "4. Submit or save to store the vehicle number and alphabet.".localize)
                
            }
            .font(.custom((IsArabicLang ? AppFont.arRegular : AppFont.Regular).rawValue , size: 12))
           
            .padding(10)
            .foregroundColor(Color.black.opacity(0.6))
            .environment(\.layoutDirection,  IsArabicLang ? .rightToLeft :  .leftToRight  )
            .frame(maxWidth: .infinity , alignment:  IsArabicLang ? .trailing  : .leading)
            HStack {
                    VStack(alignment: .center ,spacing: 2){
                        Text ( pinOne.changeToAr() + pinTwo.changeToAr() + pinThree.changeToAr() + pinFour.changeToAr() )
                        Text ( pinOne + pinTwo + pinThree + pinFour )
                    }.font(.custom( AppFont.Regular.rawValue , size: 12))
                    .padding(3)
                    
                    Image ( "Emblem_of_Saudi_Arabia 1")
                        .resizable()
                        .frame(width: 40, height: 50  , alignment: .center)
                    
                    VStack(alignment: .center , spacing: 2){
                        Text ( convertToArabic(text: AOne) + " " +  convertToArabic(text: ATwo) + " " +  convertToArabic(text: AThree)   )
                        Text ( AOne + " " + ATwo + " " + AThree )
                      
                        
                    }.font(.custom( AppFont.Regular.rawValue , size: 12))
                    .padding(3)
                    Divider()
                
                
                .frame(width:  2)
                .overlay(.black)
            
                    Image ( "Frame 1000003328")
                        .resizable()
                        .frame(width: 20, height: 85 , alignment: .center)
                
                
            }
            .frame(width: 200, height: 100, alignment: .center)
            .overlay(
                   RoundedRectangle(cornerRadius: 16)
                       .stroke(.black, lineWidth: 2)
               )
            
            
            Text ( "Vehicle Alphabet".localize)
                .font(.custom((IsArabicLang ? AppFont.arBold : AppFont.Bold).rawValue , size: 16))
                
                .padding(.top)
           
            OtpFormFieldView(pinOne: $AOne, pinTwo: $ATwo, pinThree: $AThree, pinFour: $AFour , numKeyboard: false  , threeItems: true)
                .keyboardType(.asciiCapable)
            
            
//            OtpView(activeIndicatorColor: Color.black, inactiveIndicatorColor: Color( "MainColor"),  length: 3, numKeyboard: false , doSomething: { value in
//                print(value )
//                           
//            })
            .padding(.horizontal)
            
            
            
            
            
            Text ( "Vehicle Number".localize)
                .font(.custom((IsArabicLang ? AppFont.arBold : AppFont.Bold).rawValue , size: 16))
                .padding(.top)
            
            OtpFormFieldView(pinOne: $pinOne, pinTwo: $pinTwo, pinThree: $pinThree, pinFour: $pinFour , numKeyboard: true   )
            
         Spacer()
        }
        .frame( height: 900)
        
        
    }
}




struct ExDivider: View {
    let color: Color = .black
    
    var body: some View {
        Rectangle()
            .fill(color)
            .rotationEffect(.degrees(90))
            .frame(width: 100 ,height: 2 )
          
            
    }
}


extension String {
    func changeToAr () -> String {
        let number = NSNumber(value: Int(self) ?? 0 )
        let format = NumberFormatter()
        format.locale = Locale(identifier: "ar") // You can set locale of your language
        format.allowsFloats = true
        format.numberStyle = .decimal
        let formatedNumber = format.string(from: number)
        print("\(formatedNumber)")
        return formatedNumber ?? self
    }
   
    
    
    
    
   
}
