//
//  homeSearchVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/10/2023.
//
//  Template by MGAbouarab®


import UIKit
import GoogleMaps
import GooglePlaces
import AlertKit

class homeSearchVC: BaseVC{

    
//MARK: - IBOutlets -
    
    @IBOutlet weak var chooseFromMapsOutlet: UIButton!
    
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var visualView: UIVisualEffectView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var popviewContainer: UIView!
    
    
//MARK: - Properties -
   
    var onCommit: (() -> Void)? = nil
    var selectedPlace : String = ""
    var selectAndDismiss : ((String) -> Void)?
    var recentPlaces : [recentPlace] = [
        recentPlace(placeName: "Jeddah Park by Cenomi" , city: "Jeddah") ,
        recentPlace(placeName: "Kingdom Tower" , city: "Jeddah") ,
        recentPlace(placeName: "Fakieh Aquarium" , city: "Jeddah")
    ]
        
  
    
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
       
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized

        self.popviewContainer.layer.addBasicShadow(cornerRadius: 35)
        searchTextField.delegate = self
        self.setUpTableView()
        self.searchContainerView.layer.applySketchShadow()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4)  { [weak self] in
        self?.visualView.isHidden = false
            self?.chooseFromMapsOutlet.imagePadding(spacing: 5)
       }
      
      
    }
    
    private func setUpTableView () {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName:"RecentPlacesCell", bundle: nil), forCellReuseIdentifier: "RecentPlacesCell")
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
    @IBAction func selectPlace(_ sender: UIButton) {
  
      
            if self.selectedPlace == "" {
                AlertKitAPI.present(
                    title: "Sorry, but you need to select a destination first!" ,
                    icon: .error,
                    style: .iOS17AppleMusic,
                    haptic: .success
                )
            } else {
                sender.animateButtonWhenPressed {
                self.selectAndDismiss?(self.selectedPlace)
                self.dismiss(animated: true )
            }
        }
    }
    @IBAction func clearAllAction(_ sender: UIButton) {
       
            self.recentPlaces.removeAll()
            self.tableview.reloadData()
           
    }
    
    
    
    @IBAction func cancel(_ sender: UIButton) {
        sender.animateButtonWhenPressed {
            self.dismiss(animated: true)
        }
       
    }
    @IBAction func chooseOnMaps(_ sender: UIButton) {
        print("choose on map ")
        self.dismiss(animated: false)
        self.onCommit?()
       // vc.delegate = self
       
    }
}


//MARK: - Networking -
extension homeSearchVC {
    
}

//MARK: - Routes -
extension homeSearchVC {
    
}


struct recentPlace {
    let placeName : String
    let city : String
    var selected : Bool = false
}
