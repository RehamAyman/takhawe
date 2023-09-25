//
//  tab3.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//

import SwiftUI

struct tab3: View {
    @State private var selected = 0
 
    
    
    var body: some View {
        VStack {
            CustomSegmentedControl(selectedIndex: $selected)
                .padding(.top)
           Spacer()
        }
        
        
    }
}

struct tab3_Previews: PreviewProvider {
    static var previews: some View {
        tab3()
    }
}
