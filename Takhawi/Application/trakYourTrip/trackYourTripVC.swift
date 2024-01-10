//
//  trackYourTripVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 10/12/2023.
//
//  Template by MGAbouarab®


import UIKit
import GoogleMaps
import CountdownLabel

class trackYourTripVC: BaseVC {
    
//MARK: - IBOutlets -
    @IBOutlet weak var step1View: UIView!
    @IBOutlet weak var tripStartViewheight: NSLayoutConstraint!
    
   
    @IBOutlet weak var tripStartView: UIView!
    @IBOutlet weak var topViewHeight: NSLayoutConstraint!
    @IBOutlet weak var step2View: UIView!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var driverArriveIn: CountdownLabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var googleView: GMSMapView!
    
//MARK: - Properties -
    var animatePolyline: AnimatePolyline?
    var count = 10
    var stopCompleteTheTrip : Bool = false
    
    
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        
        self.setUpGoogleView()
       
        self.bottomView.layer.addBasicShadow(cornerRadius: 20)
        self.tripStartView.layer.addBasicShadow(cornerRadius: 20)
        
        self.driverArriveIn.addTime(time: 10 )
        self.tripStartViewheight.constant = 0
       
        self.driverArriveIn.start()
        self.topViewHeight.constant = 21
      
// trip
        DispatchQueue.main.asyncAfter(deadline: .now() + 10 ) {
            UIView.animate(withDuration: 0.3 ) {
                self.topViewHeight.constant = 45
                self.step1View.isHidden = true
                self.step2View.isHidden = false
                self.view.layoutIfNeeded()
            }
           
// trip start
            DispatchQueue.main.asyncAfter(deadline: .now() + 10 ) {
                self.bottomView.isHidden = true
                self.topViewHeight.constant = 0
                self.step2View.isHidden = true
                self.tripStartView.isHidden = false
                UIView.animate(withDuration: 0.3 ) {
                    self.tripStartViewheight.constant = 200
                    self.view.layoutIfNeeded()
                }
                
                // trip end go to rate the driver
                self.tripEnd()

                
            }
            
            
            
            
            

        }
        
        
        
        
        
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    @IBAction func flagAction(_ sender: UIButton) {
     //   sender.animateButtonWhenPressed {
            self.stopCompleteTheTrip = true
            let vc = reportCancelVC()
            vc.report = true
            vc.items = dummyReportResons
            self.push(vc)
      //  }
       
        
        
    }
    
    
    @IBAction func cancelTheTrip(_ sender: UIButton) {
        self.stopCompleteTheTrip = true
       
            let vc = reportCancelVC()
            vc.report = false
             vc.items = dummyCancelationResons
            self.push(vc)
        
       
     
    }
    
    
    
}


//MARK: - Networking -
extension trackYourTripVC {
    
}

//MARK: - Routes -
extension trackYourTripVC {
    
}
