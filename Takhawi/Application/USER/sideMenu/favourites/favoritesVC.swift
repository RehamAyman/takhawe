//
//  favoritesVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 16/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class favoritesVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
//MARK: - Properties -
   
    var favAddress : [AddressResult] = []
    var favdrivers : [FavDriverResult] = []
    var pationation : Pagination?
    var isLastPage : Bool = false
    
    
    enum DispkayedTasks {
        case drivers
        case locations
    }
    var displayedTask = DispkayedTasks.locations
    


    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.getAllAddress()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segment.setTitleTextAttributes(titleTextAttributes1 as [NSAttributedString.Key : Any], for:.selected)
        segment.selectedSegmentTintColor = UIColor(named: colors.mainColor.rawValue)
        segment.backgroundColor = UIColor(named: "secFavSeg")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: favlocationCell.self)
        tableView.register(cellType: favDriverCell.self)
        self.segment.setTitle("Locations".localize , forSegmentAt: 0 )
        self.segment.setTitle("Drivers".localize , forSegmentAt: 1)
        
        
        let font = UIFont.systemFont(ofSize: 12)
        let attributes = [ NSAttributedString.Key.foregroundColor : UIColor.white,
                           NSAttributedString.Key.font : font ]
        
       
        segment.setTitleTextAttributes( attributes,for: .normal)
        self.indicator.isHidden = true
    }
    

    
    
    
//MARK: - Actions -
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 : // locations
            self.displayedTask = .locations
          //  getAllAddress()
            self.tableView.reloadData()
        case 1 : // drivers
            self.displayedTask = .drivers
            getAllFavDrivers()
           
        default:
            break
        }
    }
}


//MARK: - Networking -
extension favoritesVC {
    func getAllAddress () {
        activityIndicatorr.startAnimating()
        UserRouter.getAllAddress.send { [weak self ] (response : APIGenericResponse<[AddressResult]> )in
            guard let self = self else { return }
           
            if let result = response.result {
                self.favAddress.removeAll()
                let filtered = result.filter { $0.is_favorite == true  }
                self.favAddress.append(contentsOf: filtered)
                self.tableView.reloadData()
            }
            
        }
    }
    
    func getAllFavDrivers () {
        activityIndicatorr.startAnimating()
        UserRouter.getAllFavDrives(page: 1).send { [weak self ] (response: APIGenericResponse<[FavDriverResult]>  ) in
            guard let self = self else { return }
            if response.status == true {
                if response.paginate?.page == response.paginate?.totalPages {
                    self.isLastPage = true
                }
                
                self.pationation = response.paginate
                
                self.favdrivers = response.result ?? []
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    func removeAddressFromFavs (id : Int  ) {
        activityIndicatorr.startAnimating()
        UserRouter.updateAddress(id: id, isFav: false ).send { [weak self ] ( response : APIGlobalResponse  )  in
            if  response.status == true {
                self?.getAllAddress()
                showInfoTopAlert(withMessage: response.message )
            }
        }
    }
    
   func  removeDriverFromList ( id : Int ) {
       activityIndicatorr.startAnimating()
       UserRouter.removeDriverFromFav(id: id ).send { [weak self ] ( response : APIGlobalResponse  )  in
           guard let self = self else { return }
           if  response.status == true {
               self.getAllFavDrivers()
               showInfoTopAlert(withMessage: response.message )
           }
       }
    }
}

//MARK: - Routes -
extension favoritesVC {
    
}



