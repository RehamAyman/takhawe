//
//  tripReportVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 12/04/1446 AH.
//
//  Template by MGAbouarab®


import UIKit

class tripReportVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var tripNo: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var netProfit: UILabel!
    @IBOutlet weak var tripPrice: UILabel!
    @IBOutlet weak var tripDate: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var from: UILabel!
    //MARK: - Properties -
    
    var tripId : Int = 0
    
//MARK: - Creation -

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.getReportDetails()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.mainView.layer.addBasicShadow(cornerRadius: 16)
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension tripReportVC {
    
    func getReportDetails () {
        activityIndicatorr.startAnimating()
        DriverRouter.reportDetails(id: self.tripId).send { [weak self ] ( response : APIGenericResponse<tripReportDetailsResult> )  in
            guard let self = self else { return }
            if let res = response.result {
                self.tripNo.text = "Trip no." + "#" + "\(self.tripId)"
                self.netProfit.text = "Net profit :"  + "\(res.net_profit ?? 0 )" + "SAR"
                self.tripPrice.text = "\(res.price ?? 0 )" + "SAR"
                self.from.text = res.pickup_location?.description ?? "--"
                self.to.text = res.destination?.description ?? "--"
                
                
            }
        }
    }
    
}

//MARK: - Routes -
extension tripReportVC {
    
}
