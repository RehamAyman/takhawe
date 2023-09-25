//
//  tab3.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//

import SwiftUI

struct tab3: View {
    @State private var selected = 0
    @State private var currentSegment = 0
 
    
    
    var body: some View {
        VStack {
         //   CustomSegmentedControl(selectedIndex: $selected)
            CustomSegmentedPickerView()
                .padding(.top)
            
            
            HStack {
                Text ( "Female")
                    .frame(width: 100 , alignment: .center)
                Spacer()
                Text ( "male")
                    .frame(width: 100 , alignment: .center)
                
            }.foregroundColor(.gray)
                .font(.custom(AppFont.Regular.rawValue, size: 14))
            .padding()
          .frame(width: 250)
            
            
           Spacer()
        }
        
        
       
        
        
  
        
    }
}

struct tab3_Previews: PreviewProvider {
    static var previews: some View {
        tab3()
    }
}





