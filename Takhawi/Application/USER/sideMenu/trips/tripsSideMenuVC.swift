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
    var tripType : tripType = .basic
    var tripStatus : tripStatus = .comming
    
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
    func getUpcommingTrips (withLoading : Bool  ) {
        if withLoading {
            activityIndicatorr.startAnimating()
        }
        let type : String = driver ?  tripType.rawValue :  ""
        UserRouter.getMyUpcommingTrips(type: type ).send { [weak self ] (response : APIGenericResponse<[MainTripResult]> )  in
            guard let self = self else { return  }
            if let result = response.result {
                self.upcommingTrips = result
                
                self.tableView.reloadData()
            }
        }
    }
    
    
    func handleTripStatus ( status  : String) {
        switch status {
        case "UPCOMING" , "ACCEPTED":
            self.tripStatus = .comming
        case "ON_WAY" :
            self.tripStatus = .onWay
        case "CANCELLED" :
            self.tripStatus = .cancelled
        case "COMPLETED" :
            self.tripStatus = .completed
        case "ARRIVED" :
            self.tripStatus = .arrived
        case "INPROGRESS":
            self.tripStatus = .inProgress
        default:
            self.tripStatus = .comming
        }
    }
    
    
    func getCancelledTrips () {
        activityIndicatorr.startAnimating()
        let type : String = driver ?  tripType.rawValue :  ""
        UserRouter.getCancelledTrips(type: type ).send { [weak self ] (response : APIGenericResponse<[MainTripResult]> )  in
            guard let self = self else { return  }
           if let result = response.result {
                self.upcommingTrips = result
                self.tableView.reloadData()
            }
        }
    }
    
    
    func getCompletedTrips () {
        let type : String = driver ?  tripType.rawValue :  ""
            activityIndicatorr.startAnimating()
     
        UserRouter.getCompletedTrips(type: type ).send { [weak self ] (response : APIGenericResponse<[MainTripResult]> )  in
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
