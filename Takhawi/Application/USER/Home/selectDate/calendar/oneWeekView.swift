//
//  oneWeekView.swift
//  Takhawi
//
//  Created by Reham Ayman on 18/10/2023.
//


import SwiftUI

struct WeekView: View {
    @Binding var SelectedDate : Date
    @Binding var selectedString : String

    var week: Week

    var body: some View {
        HStack {
            ForEach(0..<7) { i in
                VStack ( spacing: 10 )  {
                    Text(week.dates[i].toString(format: "EEE").uppercased())
                        .font(.system(size: 14))
                        .padding(2)
                        .foregroundColor(week.dates[i] == week.referenceDate ? .white : .primary)

                        Text(week.dates[i].toString(format: "d"))
                            .font(.system(size: 16))
                            .padding(2)
                            .foregroundColor(week.dates[i] == week.referenceDate ? .white : .primary)
                 
                    
                    Circle()
                        .fill(week.dates[i] == week.referenceDate ? Color.white : Color.clear )
                        .frame(width: 8 , height: 8)
                    
                    
                    
                }  .frame(width: 45  , height: 90)
                   
                      
                    .background(week.dates[i] == week.referenceDate ? Color( "MainColor") : Color.clear)
                            .cornerRadius(10)
                    
                   
                
                
                .onTapGesture {
                    withAnimation {
                        self.SelectedDate = week.dates[i]
                        self.selectedString = SelectedDate.dateToString ?? ""
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding()
    }
}



extension Date {
    func monthToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: self)
    }

    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.calendar = Calendar.current
        formatter.dateFormat = format

        return formatter.string(from: self)
    }

    var yesterday: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }

    var tomorrow: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }

    private func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
        var customCalendar = Calendar(identifier: .gregorian)
        customCalendar.firstWeekday = 2

        return customCalendar.isDate(self, equalTo: date, toGranularity: component)
    }

    func isInSameWeek(as date: Date) -> Bool {
        isEqual(to: date, toGranularity: .weekOfYear)
    }

    func isInSameDay(as date: Date) -> Bool {
        isEqual(to: date, toGranularity: .day)
    }
}

