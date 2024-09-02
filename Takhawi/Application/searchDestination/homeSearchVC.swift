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
    
    @IBOutlet weak var googleTableView: UITableView!
    @IBOutlet weak var chooseFromMapsOutlet: UIButton!
    
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var visualView: UIVisualEffectView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var popviewContainer: UIView!
    
    @IBOutlet weak var recentAddIndicator: UIActivityIndicatorView!
    
//MARK: - Properties -
    var placesClient: GMSPlacesClient!
    var onCommit: (() -> Void)? = nil
    var selectedPlace : String = ""
    var selectedLat : Double = 0.0
    var selectedLong : Double = 0.0
    
    var selectAndDismiss : ((String , Double , Double ) -> Void)?
        
    var results: [googleResult] = []
    
    var fetcher: GMSAutocompleteFetcher?
    var recentPlaces : [RecentAddressResult] = []
    var selectedIndexPath: IndexPath?
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        placesClient = GMSPlacesClient.shared()
        self.googleTableView.isHidden = true
        self.googleTableView.isUserInteractionEnabled = false
        self.recentAddIndicator.isHidden = true
        self.getRecentAddress()
        self.googleTableView.allowsMultipleSelection = true
    }
    
    

//MARK: - Design Methods -
    

        
        func placeAutoComplete() {
           
            
            
            
             let filter = GMSAutocompleteFilter()
            filter.type = .address
            
             placesClient.autocompleteQuery(searchTextField.text!, bounds: nil, filter: filter, callback: {(results, error) -> Void in
                 if let error = error {
                     print("Autocomplete error \(error)")
                     return
                 }
                 if let results = results {
                     
                  
                     let output : [googleResult] = results.map { p in
                         googleResult(fullText: p.attributedFullText.string , secText: p.attributedSecondaryText?.string ?? "" , selected: false , placeID: p.placeID, PlaceSelected: false , description: p.description)
                     }
                     
                     self.results = output
                     
                 
                     
                   
//                     for i in results {
//                         
//                         
//                         let res = googleResult(fullText: i.attributedFullText.string , secText: i.attributedSecondaryText?.string ?? "" , selected: false, placeID: i.placeID, PlaceSelected: false, description: i.description  )
//                         self.results.append(res)
//                     }
//                     
                     self.googleTableView.reloadData()
                     self.googleTableView.isHidden = false
                     self.googleTableView.isUserInteractionEnabled = true
                     
                    
                 } else {
                    print("no results ")
                     self.googleTableView.isHidden = true
                     self.googleTableView.isUserInteractionEnabled = false
                 }
             })

         }
    
    
    private func configureInitialDesign() {
        self.title = "".localized

        self.popviewContainer.layer.addBasicShadow(cornerRadius: 35)
        searchTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.setUpTableView()
        self.searchContainerView.layer.applySketchShadow()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4)  { [weak self] in
        self?.visualView.isHidden = false
            self?.chooseFromMapsOutlet.imagePadding(spacing: 5)
       }
      
      
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text == "" {
            
            self.googleTableView.isHidden = true
            self.googleTableView.isUserInteractionEnabled = false
           
        } else {
            placeAutoComplete()
        }
    }
    private func setUpTableView () {
        tableview.delegate = self
        tableview.dataSource = self
        googleTableView.delegate = self
        googleTableView.dataSource = self
        tableview.register(UINib(nibName:"RecentPlacesCell", bundle: nil), forCellReuseIdentifier: "RecentPlacesCell")
        googleTableView.register(cellType: googleplacesCell.self)
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
    @IBAction func selectPlace(_ sender: UIButton) {
  
      
            if self.selectedPlace == "" {
                AlertKitAPI.present(
                    title: "Sorry, but you need to select a destination first!".localize ,
                    icon: .error,
                    style: .iOS17AppleMusic,
                    haptic: .success
                )
            } else {
              //  sender.animateButtonWhenPressed {
                self.selectAndDismiss?(self.selectedPlace , selectedLat , selectedLong)
                self.dismiss(animated: true )
          //  }
        }
    }
    @IBAction func clearAllAction(_ sender: UIButton) {
       
            self.recentPlaces.removeAll()
            self.tableview.reloadData()
           
    }
    
    
    
    @IBAction func cancel(_ sender: UIButton) {
   //    sender.animateButtonWhenPressed {
            self.dismiss(animated: true)
       // }
       
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
    func getRecentAddress () {
        self.recentAddIndicator.isHidden = false
        self.recentAddIndicator.startAnimating()
        UserRouter.recentAddress.send { [weak self]  (response : APIGenericResponse<[RecentAddressResult]> ) in
            guard let self = self else { return }
            self.recentAddIndicator.isHidden = true
            self.recentAddIndicator.stopAnimating()
            if let result = response.result {
                self.recentPlaces = result
                self.tableview.reloadData()
            }
        }
    }
}

//MARK: - Routes -
extension homeSearchVC {
    
}



struct googleResult {
    let fullText : String
    let secText : String
    var selected : Bool
    let placeID : String
    var PlaceSelected : Bool 
    let description : String
    
}
