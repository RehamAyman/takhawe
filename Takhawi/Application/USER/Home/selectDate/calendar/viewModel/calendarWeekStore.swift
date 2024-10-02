//
//  calendarWeekStore.swift
//  Takhawi
//
//  Created by Reham Ayman on 18/10/2023.
//

import Foundation
class WeekStore: ObservableObject {
    @Published var weeks: [Week] = []
    @Published var direction: TimeDirection = .unknown
    @Published var selectedDate: Date {
        didSet {
            calcWeeks(with: selectedDate)
        }
    }
    @Published var stringSelected : String = ""
       
   
    
    

    init(with date: Date = Date()) {
        self.selectedDate = Calendar.current.startOfDay(for: date)
        
        self.stringSelected = selectedDate.dateToString ?? ""
        calcWeeks(with: selectedDate)
    }

    private func calcWeeks(with date: Date) {
        weeks = [
            week(for: Calendar.current.date(byAdding: .day, value: -7, to: date)!, with: -1),
            week(for: date, with: 0),
            week(for: Calendar.current.date(byAdding: .day, value: 7, to: date)!, with: 1)
        ]
    }

    private func week(for date: Date, with index: Int) -> Week {
        var result: [Date] = .init()

        guard let startOfWeek = Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)) else { return .init(index: index, dates: [], referenceDate: date) }

        (0...6).forEach { day in
            if let weekday = Calendar.current.date(byAdding: .day, value: day, to: startOfWeek) {
                result.append(weekday)
            }
        }

        return .init(index: index, dates: result, referenceDate: date)
    }

    func selectToday() {
        select(date: Date())
    }

    func select(date: Date) {
        selectedDate = Calendar.current.startOfDay(for: date)
        self.stringSelected = selectedDate.dateToString ?? ""
    }

    func update(to direction: TimeDirection) {
        switch direction {
        case .future:
            print("f")
           
          selectedDate = Calendar.current.date(byAdding: .day, value: 7, to: selectedDate)!
            self.stringSelected = selectedDate.dateToString ?? ""

        case .past:
            print("p")
        selectedDate = Calendar.current.date(byAdding: .day, value: -7, to: selectedDate)!
            self.stringSelected = selectedDate.dateToString ?? ""

        case .unknown:
            selectedDate = selectedDate
            self.stringSelected = selectedDate.dateToString ?? ""
        }

  calcWeeks(with: selectedDate)
    }
}
// model
struct Week {
    let index: Int
    let dates: [Date]
    var referenceDate: Date
}

enum TimeDirection {
    case future
    case past
    case unknown
}
