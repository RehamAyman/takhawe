//
//  ReserveTheTripVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 27/11/2023.
//
//  Template by MGAbouarab®


import UIKit

class ReserveTheTripVC: BaseVC {
    
//MARK: - IBOutlets -
    @IBOutlet weak var topBackView: UIView!
    
    @IBOutlet weak var tableviewHeight: NSLayoutConstraint!
    @IBOutlet weak var paymentMethodTable: UITableView!
    @IBOutlet weak var driverImage: UIImageView!
    
//MARK: - Properties -
    var selectedItem : Int = 0 
   
    let DummyPaymentMethods : [dummyPaymentMethods] = [
        dummyPaymentMethods(icon:"Payment" , number: "**** **** **** 8970", expireIn: "Expires: 12/26", type: "visa", selected: false ) ,
        dummyPaymentMethods(icon:"Payment" , number: "**** **** **** 8970", expireIn: "Expires: 12/26", type: "visa", selected: false ) ,
        dummyPaymentMethods(icon:"" , number: "**** **** **** 8970", expireIn: "Expires: 12/26", type: "wallet", selected: false ) ,
        dummyPaymentMethods(icon:"" , number: "**** **** **** 8970", expireIn: "Expires: 12/26", type: "cash", selected: false) 
        
        
        
    ]

 
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
      
        
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        driverImage.layer.addBasicShadow(cornerRadius: 33.5)
        topBackView.layer.addBasicShadow(cornerRadius: 10)
        paymentMethodTable.dataSource = self
        paymentMethodTable.delegate = self 
        paymentMethodTable.isScrollEnabled = false
        paymentMethodTable.register(UINib(nibName:"reserveTheTripCell", bundle: nil), forCellReuseIdentifier: "reserveTheTripCell")
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
    @IBAction func confirmTrip(_ sender: UIButton) {
        sender.animateButtonWhenPressed {
            
        }
    }
}


//MARK: - Networking -
extension ReserveTheTripVC {
    
}

//MARK: - Routes -
extension ReserveTheTripVC {
    
}
