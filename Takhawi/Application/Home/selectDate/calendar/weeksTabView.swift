//
//  weeksTabView.swift
//  Takhawi
//
//  Created by Reham Ayman on 18/10/2023.
//


import SwiftUI

struct WeeksTabView : View {
  
    
    @State private var activeTab: Int = 1
    @State private var direction: TimeDirection = .unknown
    @State private var position = CGSize.zero
    @GestureState private var dragOffset = CGSize.zero
    @StateObject var weekStoreModel = WeekStore()
 
   
    

    var body: some View {
        VStack ( alignment: .center ) {
         
            TabView(selection: $activeTab) {
                WeekView( SelectedDate: $weekStoreModel.selectedDate, selectedString: $weekStoreModel.stringSelected, week: weekStoreModel.weeks[0] )
                    .frame(maxWidth: .infinity)
                    .tag(0)
                
                WeekView( SelectedDate: $weekStoreModel.selectedDate, selectedString: $weekStoreModel.stringSelected , week: weekStoreModel.weeks[1] )
                    .frame(maxWidth: .infinity)
                    .tag(1)
                    .onDisappear() {
                        print("here ")
                        guard direction != .unknown else { return }
                        weekStoreModel.update(to: direction)
                        direction = .unknown
                     
                         activeTab = 1
                    }
                
                
                WeekView( SelectedDate: $weekStoreModel.selectedDate, selectedString: $weekStoreModel.stringSelected , week: weekStoreModel.weeks[2] )
                
                    .frame(maxWidth: .infinity)
                    .tag(2)
            }
            
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            .onChange(of: activeTab) { value in
                
                if value == 0 {
                    direction = .past
                } else if value == 2 {
                    direction = .future
                }
            }
            .frame(height: 100)
            // text field with the date
            TextField( "Select a Date" , text: $weekStoreModel.stringSelected)
                .foregroundColor(Color("MainColor"))
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
                .padding(.leading)
                .padding(.trailing)
                .allowsHitTesting(false)
                
            Spacer()
        }
    }
}
#Preview {
    WeeksTabView()
}


