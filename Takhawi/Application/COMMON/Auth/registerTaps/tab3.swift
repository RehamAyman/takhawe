//
//  tab3.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//

import SwiftUI

struct tab3: View {
    
    @Binding var index : Int
 
    
    
    var body: some View {
        VStack {
      
            CustomSegmentedPickerView(currentIndex: $index)
                .padding(.top)
            
            
            HStack {
                Text ( "Female".localize)
                    .frame(width: 100 , alignment: .center)
                  
                Spacer()
                Text ( "Male".localize)
                    .frame(width: 100 , alignment: .center)
                
            }.foregroundColor(.gray)
                
                .font(.custom( LocalizationManager.shared.getLanguage() == .Arabic ?  AppFont.arRegular.rawValue :  AppFont.Regular.rawValue , size: 14))
            
            .padding()
            .padding(.top)
          .frame(width: 250)
          Spacer()
            
           
        }
        
        
       
        
        
  
        
    }
}

struct tab3_Previews: PreviewProvider {
    static var previews: some View {
        tab3(index: Binding.constant(0))
    }
}





