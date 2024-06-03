//
//  customSegnmentWithAnimation.swift
//  Takhawi
//
//  Created by Reham Ayman on 25/09/2023.
//

import SwiftUI




struct CustomSegmentedPickerView: View {


    @Binding  var currentIndex: Int

    /// - Returns the width of a picker item
    private func itemWidth(availableWidth: CGFloat) -> CGFloat {
        availableWidth / CGFloat(2)
    }

    /// - Returns the x-offset for the current selection
    private func xOffsetForSelection(availableWidth: CGFloat) -> CGFloat {
        itemWidth(availableWidth: availableWidth) * CGFloat(currentIndex)
    }
    

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {

                // The background that moves between the items
                Circle()
                    .foregroundColor(Color( "MainColor"))
                    .frame(
                        width: 100,
                        height: 100
                    )
                    .offset(x: xOffsetForSelection(availableWidth: proxy.size.width + 50 ))


                
                VStack {
                    HStack   {

                        // tab 1
                        
                        Image( currentIndex == 0 ? "girl 1" : "girl 2")
                            .resizable()
                            .padding()
                            .onTapGesture {
                                withAnimation  {
                                    currentIndex = 0
                                }
                                
                            }
                            .frame(width: 100, height: 100)
                            .cornerRadius(50)
                        
                        Spacer()
                        
                        // tab 2
                        
                        Image( currentIndex  == 1  ?  "man 1" : "man 2" )
                            .resizable()
                            .padding()
                        
                            .onTapGesture {
                                
                                withAnimation  {
                                    currentIndex = 1
                                }
                                
                            }
                            .frame(width: 100, height: 100)
                            .cornerRadius(50)

                    }
 
                }
                
            }
        }
        .background(Color.white.opacity(0.7))
        .frame(height: 100)
        .frame(width: 250)
        .cornerRadius(50)
        .shadow(color: .gray.opacity(0.6), radius: 4 , x: 1 , y: 2)
    }
}
