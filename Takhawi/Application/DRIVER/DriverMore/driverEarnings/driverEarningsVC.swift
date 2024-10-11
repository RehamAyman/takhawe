//
//  driverEarningsVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 08/04/1446 AH.
//
//  Template by MGAbouarab®


import UIKit


class driverEarningsVC: BaseVC {
    @IBOutlet weak var chartContainer: UIView!
    
    @IBOutlet weak var backView: UIView!
    //MARK: - IBOutlets -
    
    
//MARK: - Properties -
    let barChartView = BarChartView()
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.addChart()
        self.backView.layer.addBasicShadow(cornerRadius: 20)
    }
    
    
    
  private func addChart () {
//       let barChartView = BarChartView()
       barChartView.translatesAutoresizingMaskIntoConstraints = false
       self.chartContainer.addSubview(barChartView)
      barChartView.backgroundColor = UIColor.white
      
       // Configure bar chart data
//       let entries = [
//           BarChartDataEntry(x: 1.0, y: 2000),
//           BarChartDataEntry(x: 2.0, y: 4000),
//           BarChartDataEntry(x: 3.0, y: 6000),
//           BarChartDataEntry(x: 4.0, y: 10000),
//           BarChartDataEntry(x: 5.0, y: 3000)
//       ]
      // let dataSet = BarChartDataSet(entries: entries, label: "Income")
      // dataSet.colors = [UIColor.systemBlue]
     //  let data = BarChartData(dataSet: dataSet)
   //    barChartView.data = data
      
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
    
}

//MARK: - Routes -
extension driverEarningsVC {
    
}
