//
//  rateTheDriverVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 13/12/2023.
//
//  Template by MGAbouarab®


import UIKit
import Cosmos
import MaterialComponents


class rateTheDriverVC: BaseVC {
    
//MARK: - IBOutlets -


    @IBOutlet weak var notes: MDCOutlinedTextArea!
    @IBOutlet weak var rateView: CosmosView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var rateSecLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    //MARK: - Properties -
    let tips = [ "1" , "2" , "5" , "10" , "20" , "30" ]
    var driverId : Int = 0
    var tripId : Int = 0
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.notes.label.text  = "Note".localize
        self.notes.handelTextArea(placeHolder: "Note".localize)
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.mainView.layer.addBasicShadow(cornerRadius: 20 )
        collectionView.delegate = self
        collectionView.dataSource = self 
        collectionView.register(cellType: tipsCell.self)
        self.rateaction()
    }
    
    
    
//MARK: - Actions -
    
    @IBAction func submitAction(_ sender: UIButton) {
        self.rateTheDriver()
    }
    
    
}


//MARK: - Networking -
extension rateTheDriverVC {
    func rateTheDriver () {
        activityIndicatorr.startAnimating()
        UserRouter.rateTheDriver(tripId: self.tripId , driverId: self.driverId , note: self.notes.textView.text , rate: Int ( self.rateView.rating)).send { [weak self] (response: APIGlobalResponse )  in
            guard let self = self else { return }
            self.dismiss(animated: true )
        }
    }
}



//MARK: - Routes -
extension rateTheDriverVC {
    
}
