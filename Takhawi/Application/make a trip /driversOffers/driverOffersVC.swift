//
//  driverOffersVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 28/11/2023.
//
//  Template by MGAbouarab®


import UIKit
import Lottie

class driverOffersVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var noOffersViewHeight: NSLayoutConstraint!
    @IBOutlet weak var noOffersView: UIView!
    @IBOutlet weak var animationView: LottieAnimationView!
    @IBOutlet weak var tableview: UITableView!
    
//MARK: - Properties -
 
    
    var offers : [offerResult] = []
    var tripId : Int = 0
    var locationDetails : offerLocation? 

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    @IBAction func refresh(_ sender: UIButton) {
        self.refreshOffer( sender : sender)
    }
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(cellType: driversOffersCell.self)
        self.noOffersView.isHidden = true
        self.noOffersViewHeight.constant = 0 
        animationView.contentMode = .scaleAspectFit
  
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.4
       
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3 ) {
//            self.dummyOffers.append(
//            dummyOffer(driverPhoto: "5", driverRate: 4, driverName: "hassan ahmed ali")
//            )
//            self.tableview.reloadData()
//        }
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension driverOffersVC {
    
    func refreshOffer(sender : UIButton) {
       
        UserRouter.getAllVipOffers(id: self.tripId).send { [weak self ] (response:APIGenericResponse<[offerResult]> ) in
            guard let self = self else { return }
           
            self.offers = response.result ?? []
            self.tableview.reloadData()
           
            
        }
    }
    
}

//MARK: - Routes -
extension driverOffersVC {
    
}
