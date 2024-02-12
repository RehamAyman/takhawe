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
    @State var AOne: String = ""
    @State var ATwo: String = ""
    @State var AThree: String = ""
    @State var AFour: String = ""
    
    // Vehicle Number
    @State var pinOne: String = ""
    @State var pinTwo: String = ""
    @State var pinThree: String = ""
    @State var pinFour: String = ""
    
    
    
    
    var body: some View {
        ScrollView ( showsIndicators: false ) {
        
            VStack ( alignment: .leading , spacing: 3) {
                Text ( "1. Locate the Vehicle Number input field.")
                Text ( "2. Enter the numerical part, then the alphabetical part.")
                Text ( "3. Verify the entered information for accuracy.")
                Text ( "4. Submit or save to store the vehicle number and alphabet.")
                
            }
            .font(.custom( AppFont.Regular.rawValue , size: 12))
            .padding(10)
            .foregroundColor(Color.black.opacity(0.6))
            
            HStack {
                
                
                    VStack(alignment: .center ,spacing: 2){
                        Text ( pinOne + pinTwo + pinThree + pinFour )
                        Text ( pinOne + pinTwo + pinThree + pinFour )
                    }.font(.custom( AppFont.Regular.rawValue , size: 12))
                    .padding(3)
                    
                    Image ( "Emblem_of_Saudi_Arabia 1")
                        .resizable()
                        .frame(width: 40, height: 50  , alignment: .center)
                    
                    VStack(alignment: .center , spacing: 2){
                        Text ( AOne + ATwo + AThree )
                        Text ( AOne + ATwo + AThree )
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
            
            
            Text ( "Vehicle Alphabet")
                .font(.custom( AppFont.Bold.rawValue , size: 16))
                .padding(.top)
            
            OtpFormFieldView(pinOne: $AOne, pinTwo: $ATwo, pinThree: $AThree, pinFour: $AFour , numKeyboard: false  , threeItems: true)
            
            
            
//            OtpView(activeIndicatorColor: Color.black, inactiveIndicatorColor: Color( "MainColor"),  length: 3, numKeyboard: false , doSomething: { value in
//                print(value )
//                           
//            })
            .padding(.horizontal)
            
            
            
            
            
            Text ( "Vehicle Number")
                .font(.custom( AppFont.Bold.rawValue , size: 16))
                .padding(.top)
            
            OtpFormFieldView(pinOne: $pinOne, pinTwo: $pinTwo, pinThree: $pinThree, pinFour: $pinFour , numKeyboard: true   )
            
          Spacer()
        }
        
        
        
    }
}

#Preview {
    tab6DriverAuth()
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
