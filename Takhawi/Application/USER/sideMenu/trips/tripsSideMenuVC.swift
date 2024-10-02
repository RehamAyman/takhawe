//
//  tripsSideMenuVC.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//
//  Template by MGAbouarab®


import UIKit



class tripsSideMenuVC: BaseVC {
    
    //MARK: - IBOutlets -
    
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: ColoredCustomUISegmentedControl!
    
    //MARK: - Properties -
    
    var upcommingTrips : [MainTripResult] =  []
    var driver : Bool = false
    var driverType : tripType = .basic
    
    
    //MARK: - Creation -
  
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.getUpcommingTrips(withLoading: true )
    }
    
    
    //MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.setupsegment()
        self.setUpMainView()
        
    }
    
    //MARK: - Logic Methods -
    
    
    //MARK: - Actions -
    
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 :
            print("upcomming ")
            self.getUpcommingTrips(withLoading: true )
        case 1:
            print("completed ")
            self.getCompletedTrips()
        case 2:
            print("cancelled")
            self.getCancelledTrips()
        default:
            print("def")
        }
    }
    
    @IBAction func returnHome(_ sender: UIButton) {
        self.pop(animated: true )
    }
}


//MARK: - Networking -
extension tripsSideMenuVC {
    func getUpcommingTrips (withLoading : Bool ) {
        if withLoading {
            activityIndicatorr.startAnimating()
        }
        UserRouter.getMyUpcommingTrips.send { [weak self ] (response : APIGenericResponse<[MainTripResult]> )  in
            guard let self = self else { return  }
            if let result = response.result {
                self.upcommingTrips = result
                self.tableView.reloadData()
            }
        }
    }
    
    
    func getCancelledTrips () {
        activityIndicatorr.startAnimating()
        UserRouter.getCancelledTrips.send { [weak self ] (response : APIGenericResponse<[MainTripResult]> )  in
            guard let self = self else { return  }
           if let result = response.result {
                self.upcommingTrips = result
                self.tableView.reloadData()
            }
        }
    }
    
    
    func getCompletedTrips () {
        activityIndicatorr.startAnimating()
        UserRouter.getCompletedTrips.send { [weak self ] (response : APIGenericResponse<[MainTripResult]> )  in
            guard let self = self else { return  }
           if let result = response.result {
                self.upcommingTrips = result
                self.tableView.reloadData()
            }
        }
    }
    
    
 
   
    
}

//MARK: - Routes -
extension tripsSideMenuVC {
    
}
