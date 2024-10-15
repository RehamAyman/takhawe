//
//  driverReportSwiftui.swift
//  Takhawi
//
//  Created by Reham Ayman on 11/04/1446 AH.
//

import SwiftUI
import SwiftUICharts


struct driverReportSwiftui: View {
    @State var selection : String  = "Select Duration"
    @State var totalTrips : String = "--"
    @State var totalProfit : String = "--"
    @State var distance : String = "--"
    var action: (() -> Void)?

    
    
    
    var body: some View {
        ScrollView {
            HStack {
                Text("My Progress")
                Spacer()
                Menu {
                    Button(action: {
                        print("Option 1 selected")
                        self.selection = "3 months"
                               }) {
                                   Text("3 months")
                               }

                               Button(action: {
                                   print("Option 2 selected")
                                   self.selection = "6 months"
                               }) {
                                   Text("6 months")
                               }

                               Button(action: {
                                   print("Option 3 selected")
                                   self.selection = "Year"
                                
                               }) {
                                   Text("Year")
                               }
                } label: {
                    Label( selection, systemImage: "ellipsis.circle")
                        .foregroundColor( Color.black)
                        .padding(8)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow( color: .gray.opacity(0.5) , radius: 5 )
                }



            }.padding()
        // middile view
            
            
            reportMiddleView(totalTrips: $totalTrips, totalProfit: $totalProfit, totalDistance: $distance)
                .onTapGesture {
                    self.action?()
                    print("middle view tapped .. ")
                }
            
    // bottom view
//
            
            VStack {
                
                LineView(data: [8,23,54,32,12,37,7,23,43], title: "Line chart", legend: "Full screen")
            }
            .frame(height: 400 )
            .padding(8)
            .background(Color.white)
            .cornerRadius(10)
            .shadow( color: .gray.opacity(0.5) , radius: 5 )
            .padding()
             
           
            
        }.background(Color(uiColor: UIColor(named: "BackGroundColor") ?? UIColor.white))
      
    }
}

#Preview {
    driverReportSwiftui()
}
