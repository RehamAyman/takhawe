//
//  driverEarningsVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 08/04/1446 AH.
//
//  Template by MGAbouarab®


import UIKit


class driverEarningsVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var chartContainer: UIView!
    
    @IBOutlet weak var fromToLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var ridesNo: UILabel!
    @IBOutlet weak var totalIncome: UILabel!
    @IBOutlet weak var titleIncome: UILabel!

    
    
    
//MARK: - Properties -
    let barChartView = BarChartView()
    var Income : Double = 0
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
       
        self.backView.layer.addBasicShadow(cornerRadius: 20)
        self.getReports()
    }
    
    
    
    private func addChart (tripsValues  :  [CGFloat]  , days : [String]  ) {
//       let barChartView = BarChartView()
        
      
        barChartView.barValues = tripsValues // Array(tripsValues.prefix(7))
        barChartView.barLabels =  days // Array(days.prefix(7))
        barChartView.translatesAutoresizingMaskIntoConstraints = false
        self.chartContainer.addSubview(barChartView)
        barChartView.backgroundColor = UIColor.white
      
       NSLayoutConstraint.activate([
           barChartView.topAnchor.constraint(equalTo: chartContainer.topAnchor),
           barChartView.leadingAnchor.constraint(equalTo: chartContainer.leadingAnchor),
           barChartView.trailingAnchor.constraint(equalTo: chartContainer.trailingAnchor),
           barChartView.bottomAnchor.constraint(equalTo: chartContainer.bottomAnchor)
       ])
       
        
    }
//    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
    @IBAction func requestASettement(_ sender: UIButton) {
        let vc = driverRequestMonyVC()
        vc.theWholeProfit = self.Income
        self.push(vc)
    }
}


//MARK: - Networking -
extension driverEarningsVC {
    
    func getReports () {
        activityIndicatorr.startAnimating()
        DriverRouter.earnings.send { [weak self ] (response: APIGenericResponse<earningsModel>)  in
            guard let self = self else { return }
            if let result = response.result {
                self.Income = result.driverWalletBalance ?? 0
                self.ridesNo.text  = "\(result.totalTrips ?? 0 )" + " " +  "Ride".localize
                self.totalIncome.text = "\(result.driverWalletBalance?.rounded() ?? 0)" +  "SAR".localize
                self.titleIncome.text = "\(result.totalProfit ?? 0)" +  "SAR".localize
                // draw the chart .
                let valuesArray = response.result?.dailyRevenue ?? []
                let values : [CGFloat] = valuesArray.map { $0.driver_profit ?? 0 }   //  [1, 0, 0, 0, 0, 0, 0]
                let days : [String] = ["Fri", "Sat" , "Sun", "Mon", "Tue", "Wed", "Thu"]
                self.addChart(tripsValues: values, days: days)

            }
        }
        
        
        
        
//        DriverRouter.report(noOfMonths: 10 ).send {  (response : APIGenericResponse<driverReportsResult> )  in
//                if let response = response.result {
//                    self.ridesNo.text  = "\(response.totalRevenue?.total_trips ?? 0)" +  "Ride".localize
//                    self.totalIncome.text = "\(response.totalRevenue?.driver_profit ?? 0)" +  "SAR".localize
//                    self.titleIncome.text = "\(response.totalRevenue?.driver_profit ?? 0)" +  "SAR".localize
//                    let firstDate = response.monthlyRevenue?.first?.date ?? ""
//                    let secDate = response.monthlyRevenue?.last?.date ?? ""
//                    self.fromToLabel.text = "From " + firstDate + " To " + secDate
//                    let people = response.monthlyRevenue ?? []
//                    let values  =  people.map { $0.driver_profit ?? 0 }
//                    let days =  people.map { $0.date ?? "" }
//                    self.addChart(tripsValues: values, days: days)
//                 
//                    
//                    // Using map to get an array of names
//                  //  self.chartData = people.map { $0.driver_profit ?? 0 }
//
//                    
//                    
//                }
//            
//        }
    }
    
    
    
    
//    func getTotalProfit  () {
//        activityIndicatorr.startAnimating()
//        
//        
//        
//        DriverRouter.getTotalProfit.send { [weak self ] (response : APIGenericResponse<totalProfitResult>)  in
//            guard let self = self else { return }
//            if let result = response.result {
//                self.totalIncome.text = "\(result.totalProfit ?? 0 )" + " " +  "SAR".localize
//                self.ridesNo.text = "\(result.tripsReport?.count ?? 0 )" + " " +  "Ride".localize
//                self.titleIncome.text = "\(result.totalProfit ?? 0 )" + " " +  "SAR".localize
//                let firstDate = result.tripsReport?.first?.start_date ?? ""
//                let secDate = result.tripsReport?.last?.start_date ?? ""
//                self.fromToLabel.text = "From " + firstDate + " To " + secDate
//                self.addChart(trips: result.tripsReport ?? [] )
//                
//            }
//        }
//    }
    
    
    
}

//MARK: - Routes -
extension driverEarningsVC {
    
}
