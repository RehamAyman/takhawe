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
        self.collectionViewHeight.constant = 300
       return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "driverVipTripsCellCollectionViewCell", for: indexPath) as! driverVipTripsCellCollectionViewCell
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  self.collectionView.frame.width  - 20  , height: 300 )
    }
    
    
    
    
//MARK: - SETUP SOCKET  METHODS
    
    
    func setUpVipListenerSocket () {
        print("🌏1------- connect socket connection ----- ")
        socketManager.connect()
        socketManager.providerVipTripsListener { offers  in
            print("heey there ✅ success passed the offers ... ")
          
   
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
        
    }
    
    
  private  func handleOnView  () {
        
        
        
    }
    
    
    
//MARK: - SETUP MAIN VIEW
    
    func setupMainView () {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: driverVipTripsCellCollectionViewCell.self)
        self.requestLocationAccess()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        self.notificationView.layer.addBasicShadow(cornerRadius: 16)
       
        self.setUpGoogleMapView()
       
        switchButton = SwitchButton(frame: self.switchContainer.frame)
        switchButton.status = false
        self.view.addSubview(switchButton)
        
        
        switchButton.translatesAutoresizingMaskIntoConstraints = false

        switchButton.leadingAnchor.constraint(equalTo: self.switchContainer.leadingAnchor).isActive = true
        switchButton.trailingAnchor.constraint(equalTo: self.switchContainer.trailingAnchor).isActive = true
        switchButton.topAnchor.constraint(equalTo: self.switchContainer.topAnchor).isActive = true
        switchButton.bottomAnchor.constraint(equalTo: self.switchContainer.bottomAnchor).isActive = true
      
        self.driverName.text = UserDefaults.user?.user?.name ?? ""
        
        self.switchButtonAction()
        self.createAtripAction()
    }
    
    
  
    
    
    
    
    
    
}

