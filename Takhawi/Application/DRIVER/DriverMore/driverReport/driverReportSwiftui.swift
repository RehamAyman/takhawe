//
//  driverReportSwiftui.swift
//  Takhawi
//
//  Created by Reham Ayman on 11/04/1446 AH.
//

import SwiftUI
import SwiftUICharts


struct driverReportSwiftui: View {
    @State var selection : String  = "6 months"
    @State var totalTrips : String = "--"
    @State var totalProfit : String = "--"
    @State var distance : String = "--"
    @State var chartData : [Double] = [8,23,54,32,12,37,7,23,43]
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
                        self.getReports(noOfMonth: 3)
                               }) {
                                   Text("3 months")
                               }

                               Button(action: {
                                   print("Option 2 selected")
                                   self.selection = "6 months"
                                   self.getReports(noOfMonth: 6)
                               }) {
                                   Text("6 months")
                               }

                               Button(action: {
                                   print("Option 3 selected")
                                   self.selection = "Year"
                                   self.getReports(noOfMonth: 12)
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
                
                LineView(data: chartData , title: "", legend: "")
            }
            .frame(height: 400 )
            .padding(8)
            .background(Color.white)
            .cornerRadius(10)
            .shadow( color: .gray.opacity(0.5) , radius: 5 )
            .padding()
             
           
            
        }.background(Color(uiColor: UIColor(named: "BackGroundColor") ?? UIColor.white))
            .onAppear {
                self.getReports(noOfMonth: 6)
            }
      
    }
    
    func getReports ( noOfMonth : Int ) {
        activityIndicatorr.startAnimating()
        DriverRouter.report(noOfMonths: noOfMonth).send {  (response : APIGenericResponse<driverReportsResult> )  in
                if let response = response.result {
                    self.totalTrips = "\(response.totalRevenue?.total_trips ?? 0)"
                    self.totalProfit = "\(response.totalRevenue?.driver_profit ?? 0)"
                    let distance = response.totalRevenue?.total_distance ?? 0
                    let disString = distance == 0 ? "--" : "\(distance)"
                    self.distance =  disString
                    let people = response.monthlyRevenue ?? []
                    // Using map to get an array of names
                    self.chartData = people.map { $0.driver_profit ?? 0 }

                    
                    
                }
            
            
        }
    }
}

#Preview {
    driverReportSwiftui()
}
