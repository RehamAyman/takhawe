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
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
       
        self.backView.layer.addBasicShadow(cornerRadius: 20)
        self.getTotalProfit()
    }
    
    
    
    private func addChart (trips : [TripsReport] ) {
//       let barChartView = BarChartView()
      
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
        self.push(vc)
    }
}


//MARK: - Networking -
extension driverEarningsVC {
    
    func getTotalProfit  () {
        activityIndicatorr.startAnimating()
        DriverRouter.getTotalProfit.send { [weak self ] (response : APIGenericResponse<totalProfitResult>)  in
            guard let self = self else { return }
            if let result = response.result {
                self.totalIncome.text = "\(result.totalProfit ?? 0 )" + " " +  "SAR".localize
                self.ridesNo.text = "\(result.tripsReport?.count ?? 0 )" + " " +  "Ride".localize
                self.titleIncome.text = "\(result.totalProfit ?? 0 )" + " " +  "SAR".localize
                let firstDate = result.tripsReport?.first?.start_date ?? ""
                let secDate = result.tripsReport?.last?.start_date ?? ""
                self.fromToLabel.text = "From " + firstDate + " To " + secDate
                self.addChart(trips: result.tripsReport ?? [] )
                
            }
        }
    }
    
    
    
}

//MARK: - Routes -
extension driverEarningsVC {
    
}
