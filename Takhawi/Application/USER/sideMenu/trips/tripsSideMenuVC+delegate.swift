//
//  tripsSideMenuVC+delegate.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//

import UIKit


extension tripsSideMenuVC : UITableViewDelegate , UITableViewDataSource {
    
    
//MARK: - MAIN VIEW METHODS
    
    func setUpMainView () {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: userTripCell.self )
        self.tableView.isHidden = false
        self.tableView.isUserInteractionEnabled = true
        
    }
    
//MARK: - TABLE VIEW METHODS
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if upcommingTrips.count == 0 {
            self.tableView.isHidden = true
            self.tableView.isUserInteractionEnabled = false
            self.emptyView.isHidden = false
        } else {
            self.tableView.isHidden = false
            self.tableView.isUserInteractionEnabled = true
            self.emptyView.isHidden = true
        }
        return self.upcommingTrips.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userTripCell", for: indexPath) as! userTripCell
        let item = self.upcommingTrips[indexPath.row]
        cell.to.text = item.destination?.description ?? ""
        cell.from.text = item.pickup_location?.description ?? ""
        cell.orderDate.text = item.start_date?.convertFromIso()
        cell.rateView.isUserInteractionEnabled = false
       
       
        cell.addTapGesture {
            if self.driver == false  && self.segment.selectedSegmentIndex == 0 {
                self.goToTripTrakingView(item: item)
            } else if self.driver {
                self.goToDriverTripDetails(item: item )
            }
        }
        
        
        if self.driver && self.tripType == .basic {
            cell.rateView.isHidden = true
            cell.userImage.isHidden = true
            cell.name.isHidden = true
            cell.dividerView.isHidden = true 
        } else if  self.driver && self.tripType == .vip {
            cell.name.text = item.Passenger?.name ?? ""
            if let rate = item.Passenger?.rate  {
                cell.rateView.rating = rate
            }
            if let image = item.Passenger?.image {
                cell.userImage.setImage(image: Server.imageBase.rawValue + image )
            }
            
        }  else {
            cell.tripNumber.text = "# \(item.id ?? 0)"
            cell.name.text = item.driver?.name ?? ""
            if let rate = item.driver?.driver_rate {
                cell.rateView.rating = rate
            }
            if let image = item.driver?.avatar {
                cell.userImage.setImage(image: Server.imageBase.rawValue + image )
            }
            
        }
        
       

        
        switch segment.selectedSegmentIndex {
        case 0 : // upcomming
          
            print("upcomming def mode ")
        case 1 : // completed
            cell.doneLabel.isHidden = false
            cell.doneView.isHidden = false
            cell.doneLabel.textColor = UIColor.systemGreen
            cell.doneLabel.text = "Completed".localize
            cell.doneView.addTapGesture {
                print("hello i select view pdf")
                let vc = billingWebView()
                vc.tripId = item.id ?? 0
                self.present(vc, animated: true )
            }
        case 2 : // cancelled
            cell.doneLabel.isHidden = false
            cell.doneLabel.textColor = UIColor.red
            cell.doneLabel.text = "Cancelled".localize
        default:
            print("def")
        }
       
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.driver && self.tripType == .basic {
            return 140
        } else {
            return 180
        }
       
    }
    
    
    
//MARK: - SEGMENT METHODS
    func setupsegment ( ) {
     
        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segment.setTitleTextAttributes(titleTextAttributes1 as [NSAttributedString.Key : Any], for:.selected)
   
        segment.selectedSegmentTintColor = UIColor(named: colors.mainColor.rawValue)
        segment.backgroundColor = UIColor(named: "secFavSeg")
        self.segment.setTitle(  "Upcoming".localize , forSegmentAt: 0)
        self.segment.setTitle(  "Completed".localize , forSegmentAt: 1)
        self.segment.setTitle(  "Cancelled".localize , forSegmentAt: 2)
        let font = UIFont.systemFont(ofSize: 12)
        let attributes = [ NSAttributedString.Key.foregroundColor : UIColor.white,
                           NSAttributedString.Key.font : font ]
        segment.setTitleTextAttributes( attributes,for: .normal)
        
        
    }
    
    

    private func goToTripTrakingView  (item : MainTripResult  ) {
        
        let vc = trackYourTripVC()
        vc.vipTrip = item.type == "VIP" ? true : false
        vc.tripId = item.id ?? 0
        vc.basicPickLat = item.pickup_location?.lat ?? 0
        vc.basicPickLng = item.pickup_location?.lng ?? 0
        vc.basicDesLat = item.destination?.lat ?? 0
        vc.basicDesLng = item.destination?.lng ?? 0
        vc.passengerTripId = item.passengerTripId ?? 0
        
        self.push(vc)
    }


    
    private func goToDriverTripDetails (item : MainTripResult    ) {
        
        
         let vc = ProviderTripDetialsVC()
         vc.passedTrip =  item
         self.handleTripStatus(status: item.status ?? "" )
         print("... 👀 status is : \(self.tripStatus) 👀 ....  ")
         vc.tripType = self.tripType
         vc.tripStatus = self.tripStatus
        vc.action = {
            switch self.segment.selectedSegmentIndex {
            case 0:
                self.getUpcommingTrips(withLoading: false )
            case 1:
                self.getCompletedTrips()
            case 2:
                self.getCancelledTrips()
                
            default:
                print("def")
            }
          
        }
         push(vc )
     }
    
    

}
