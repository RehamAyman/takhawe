//
//  driverHome+functions.swift
//  Takhawi
//
//  Created by Reham Ayman on 10/02/2024.
//

import UIKit

extension DriverHomeVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    
    
//MARK: - COLLECTION VIEW METHODS
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    self.changeConstrainsWithAnimation(const: self.offers.count == 0 ?  30 : 340 )
    self.collectionView.isUserInteractionEnabled =  self.offers.count == 0 ? false : true 
        return self.offers.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "driverVipTripsCellCollectionViewCell", for: indexPath) as! driverVipTripsCellCollectionViewCell
        let item = self.offers[indexPath.item]
        cell.from.text = item.pickup_description ?? "====="
        cell.to.text = item.destination_description ?? ""
        cell.userName.text = item.passenger_name ?? ""
        cell.userRate.rating = item.passenger_rate ?? 0.0
        cell.distance.text = self.getDestanceBetween(lat1: item.pickup_location_lat ?? 0,
                                                     lng1: item.pickup_location_lng ?? 0,
                                                     lat2: item.distination_location_lat ?? 0,
                                                     lng2: item.distination_location_lng ?? 0 )
        if let image = item.passenger_avatar {
            cell.userPhoto.setImage(image: Server.imageBase.rawValue + image  )
        }
        
        
        if let  features = item.features  {
            cell.ac.tintColor = features.contains("AIR CONDITIONER")  ?  UIColor(named: "MainColor") : UIColor.systemGray5
            cell.wifi.tintColor = features.contains(Features.wifi.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            cell.music.tintColor = features.contains(Features.music.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            cell.food.tintColor = features.contains(Features.food.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            cell.smocking.tintColor = features.contains(Features.noSmoking.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            cell.chargingIcon.tintColor = features.contains(Features.charging.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            cell.heating.tintColor = features.contains(Features.haeting.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            cell.backScreen.tintColor = features.contains(Features.backScreens.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            cell.massage.tintColor = features.contains(Features.massage.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            cell.bags.tintColor = features.contains(Features.bags.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            cell.blutooth.tintColor = features.contains(Features.blutooth.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            
            
        }
          
   
        cell.showDetails.addTapGesture {
            let vc = driverProfileVC()
            vc.isDriverAcc = true
            vc.driverVip = item
           // vc.vipData = item
            self.push(vc)
        }
        cell.ignore.addTapGesture {
            self.offers.remove(at: indexPath.row)
            self.collectionView.reloadData()
        //    self.collectionView.deleteItems(at: [indexPath])
            //self.deleteItem(at: indexPath)
        }
        return cell
    }
    
    
    func deleteItem(at indexPath: IndexPath) {
        // 1. Ensure indexPath is valid before deletion
        print("Attempting to delete item at indexPath: \(indexPath)")
        print("Current data source: \(self.offers)")
           
           // 2. Ensure indexPath is valid before performing the deletion
        guard indexPath.item < self.offers.count else {
               print("Invalid indexPath!")
               return
           }
           
           // 3. Remove the correct item from the data source
        let deletedItem = self.offers.remove(at: indexPath.item)
           print("Deleted item: \(deletedItem)")

           // 4. Update the collection view
           collectionView.performBatchUpdates({
               collectionView.deleteItems(at: [indexPath])
        }, completion: { finished in
            // 4. Optionally, reload or perform other actions
            self.collectionView.collectionViewLayout.invalidateLayout()
            print("Deleted item at index \(indexPath.item)")
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  self.collectionView.frame.width  - 20  , height: 340 )
    }
    
    
    private func changeConstrainsWithAnimation (const : Int ) {
        self.collectionViewHeight.constant = CGFloat(const)
        UIView.animate(withDuration: 0.5) {
            self.view.setNeedsLayout()
        }
    }
    
    
//MARK: - SETUP SOCKET  METHODS
    
    
    func setUpVipListenerSocket () {
        print("🌏1------- connect socket connection ----- ")
        socketManager.connect()
        socketManager.providerVipTripsListener { offers  in
            print("heey there ✅ success passed the offers ... ")
            self.offers = offers
            self.collectionView.reloadData()
   
        }
    }
    
    
   
//MARK: - SETUP HELPER METHODS FOR DESIGN
    
    
    func switchButtonAction() {
        self.switchButton.action = {
            print(self.switchButton.status)
            if self.switchButton.status { // on
                self.handleOnView()
            } else { // off
                self.handelOffView()
            }
        }
    }
    
    
    func createAtripAction() {
        self.createAtrip.addTapGesture {
          let vc = driverCreateTripVC()
            self.push(vc)
        }
    }
    
    
   private func handelOffView () {
        print("onnnnnn")
       
       self.changeConstrainsWithAnimation(const: self.offers.count == 0 ? 30 : 340 )
       self.collectionView.isUserInteractionEnabled = self.offers.count == 0 ? false : true
       self.createAtrip.isHidden = false
       self.createAtrip.isUserInteractionEnabled = true
       
       
    }
    
    
  private  func handleOnView  () {
      print("offffff")
      self.changeConstrainsWithAnimation(const:  30 )
      self.collectionView.isUserInteractionEnabled = false
      self.createAtrip.isHidden = true
      self.createAtrip.isUserInteractionEnabled = false
    }
    
    
    
//MARK: - SETUP MAIN VIEW
    
    func setupMainView () {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: driverVipTripsCellCollectionViewCell.self)
//        self.requestLocationAccess()
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.requestLocation()
//        locationManager.startUpdatingLocation()
        self.notificationView.layer.addBasicShadow(cornerRadius: 16)
        self.setUpGoogleMapView()
        
        
        switchButton = SwitchButton()
        switchButton.status = false
        self.view.addSubview(switchButton)

        switchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                  switchButton.centerXAnchor.constraint(equalTo: switchContainer.centerXAnchor),
                  switchButton.centerYAnchor.constraint(equalTo: switchContainer.centerYAnchor),
                  switchButton.widthAnchor.constraint(equalToConstant: 300),
                  switchButton.heightAnchor.constraint(equalToConstant: 390)
              ])
        
        
//        switchButton = SwitchButton(frame: self.switchContainer.frame)
//        switchButton.status = false
//        self.view.addSubview(switchButton)
//        switchButton.translatesAutoresizingMaskIntoConstraints = false
//        switchButton.leadingAnchor.constraint(equalTo: self.switchContainer.leadingAnchor).isActive = true
//        switchButton.trailingAnchor.constraint(equalTo: self.switchContainer.trailingAnchor).isActive = true
//        switchButton.topAnchor.constraint(equalTo: self.switchContainer.topAnchor).isActive = true
//        switchButton.bottomAnchor.constraint(equalTo: self.switchContainer.bottomAnchor).isActive = true
//        
//        
        
        
        self.driverName.text = UserDefaults.user?.user?.name ?? ""
        self.switchButtonAction()
        self.createAtripAction()
    }
    
    
    
}

