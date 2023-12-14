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
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.notes.label.text  = "Note"
        self.notes.handelTextArea(placeHolder: "Note")
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
    }
    
    
}


//MARK: - Networking -
extension rateTheDriverVC {
    
}

//MARK: - Routes -
extension rateTheDriverVC {
    
}
