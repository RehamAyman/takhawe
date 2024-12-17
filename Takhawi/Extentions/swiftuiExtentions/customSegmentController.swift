//
//  customSegmentController.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//


import SwiftUI

struct CustomSegmentedControl: View {
    @Namespace var animation
    @Binding var selectedIndex : Int
    
    
    
    var body: some View {
      
        
        
        VStack {
         
            
            
            HStack   {
                
                
                
                // tab 1
                
                Image( selectedIndex == 0 ? "girl 1" : "girl 2")
                    .resizable()
                    .padding()
                
                    .background (
                        ZStack{
                            if selectedIndex == 0 {
                                Color( colors.mainColor.rawValue)
                                
                                  //  .matchedGeometryEffect(id: "TAB", in: animation)
                            }}
                        
                    )
                    .onTapGesture {
                        withAnimation  {
                            selectedIndex = 0
                        }
                        
                    }
                    .frame(width: 100, height: 100)
                    .cornerRadius(50)
                  
               Spacer()
                
                // tab 2
                
                Image( selectedIndex  == 1  ?  "man 1" : "man 2" )
                    .resizable()
                    .padding()
                    .background (
                        ZStack{
                            if selectedIndex == 1 {
                                Color( colors.mainColor.rawValue)
                                   
                                  //  .matchedGeometryEffect(id: "TAB", in: animation)
                            }}
                        
                    )
                    .onTapGesture {
                        
                        withAnimation  {
                            selectedIndex = 1
                        }
                        
                    }
                    .frame(width: 100, height: 100)
                    .cornerRadius(50)
                
                
                
              
                
                
            }
            .background(Color.white.opacity(0.7))
         
            .cornerRadius(50)
         
          
            .shadow(color: .gray.opacity(0.6), radius: 4 , x: 1 , y: 2)
           
            .animation(Animation.interpolatingSpring(stiffness: 300.0, damping: 20 , initialVelocity: 7))
            
            HStack {
                Text ( "Female")
                    .frame(width: 100 , alignment: .center)
                Spacer()
                Text ( "male")
                    .frame(width: 100 , alignment: .center)
                
            }.foregroundColor(.gray)
                .font(.custom(AppFont.Regular.rawValue, size: 14))
            .padding()
        }  .frame(width: 250)
        
        
        
        
    }
    

    
}

