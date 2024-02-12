//
//  floatingPickerView.swift
//  Takhawi
//
//  Created by Reham Ayman on 08/02/2024.
//

import SwiftUI

struct floatingPickerView: View {
    var placeHolder : String
    @Binding var text : String
    @State var menuItems : [String] = [ "item1" , "item2" , "item3" , "item4"]
    
    
    var body: some View {
       
                
                
                Menu {
                    ForEach ( menuItems , id: \.self ) { item in
                        Button( item , action: { self.text = item})
                       
                    }
                   
                } label: {
                    ZStack ( alignment: .trailing ) {
                        FloatingTextField(title: placeHolder , text: $text)
                    
                   Image ( "Vector 9")
                        .resizable()
                        .frame(width: 14 , height: 11)
                        .padding( .horizontal ,30)
                      
                }
                    .frame(height: 50)
                

                    
                    
           
            }
              
                
    
        
    }
}

#Preview {
    floatingPickerView(placeHolder:  "test", text: .constant(""))
}
