//
//  editProfileVC+extentions.swift
//  Takhawi
//
//  Created by Reham Ayman on 06/01/2024.
//

import UIKit

extension editProfileVC  : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
 
    
    func handleTextfields () {
    self.name.label.text = "Name".localize
    self.name.handelTextField(placeHolder: "Name".localize)
    self.emailTextField.label.text = "Email address".localize
    self.emailTextField.handelTextField(placeHolder: "Email address".localize)
    self.cityText.label.text = "City".localize
    self.cityText.handelTextField(placeHolder: "City".localize )
    self.birthdateText.label.text = "Birthday".localize
    self.birthdateText.handelTextField(placeHolder: "Birthday".localize )
    self.phoneNumber.label.text = "Phone Number".localize
    self.phoneNumber.handelTextField(placeHolder: "Phone Number".localize )
    self.genderText.label.text = "Gender".localize
    self.genderText.handelTextField(placeHolder: "Gender".localize )
    self.hobbies.label.text = "Hobbies".localize
    self.hobbies.handelTextField(placeHolder: "Hobbies".localize )
    self.FavouritesTextArea.handelTextArea(placeHolder: "Favourites".localize)
    self.FavouritesTextArea.label.text = "Favourites".localize
    
    }
    func birthDayAction () {
        self.birthdateText.addTapGesture {
            
        }
    }
    
    
    
 //MARK: - COLLECTION VIEW METHODS
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.hobbiesArray.count == 0 {
            self.collectionViewHeight.constant = 0
        } else {
            self.collectionViewHeight.constant = 120
        }
        return  self.hobbiesArray.count
    }
    
 
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hobbiesCellCollectionViewCell", for: indexPath) as! hobbiesCellCollectionViewCell
        let item = self.hobbiesArray[indexPath.item]
        cell.hobbieName.text = item
        cell.crossAction.addTapGesture {
            if indexPath.item < self.hobbiesArray.count {
                self.hobbiesArray.remove(at: indexPath.item)
                self.collectionView.reloadData()
            }
        }
        return cell
    }
    
    
    

    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: self.collectionView.frame.width * 0.35  , height: 45  )
    }
    
    
    func handleOpenListAction () {
        self.openHobbiesList.addTapGesture {
            
        }
        
    }
    
    func getAllBobbies () {
        UserRouter.getAllHobbies.send { [weak self ] ( response : APIGenericResponse<[VehicleClass]> )  in
            guard let self = self else { return }
            self.mainHobbies = response.result ?? []
            self.selectFromMainHobbies(button: self.chooseFromMain , textField: self.hobbies)
        }
    }
    
    private func selectFromMainHobbies (button : UIButton , textField : UITextField  ) {

        if self.mainHobbies.isEmpty == false {
            let actionClosure = { (action: UIAction) in
                print("👀✋🏻 i select regon name : \(action.title ) with id : \(action.identifier.rawValue)")
              
                textField.text = action.title
                if self.hobbiesArray.contains(action.title) {
                    print("added before ")
                } else {
                    
                    self.hobbiesArray.append(action.title)
                    self.collectionView.reloadData()
                  
                   
                }
               // self.regoinId = Int ( action.identifier.rawValue ) ?? 0
              
            }
    
            var menuChildren: [UIMenuElement] = []
            for i in self.mainHobbies {
                menuChildren.append(UIAction(title: i.name ?? "" , identifier: UIAction.Identifier( String ( i.id ?? 0 ) )  , handler: actionClosure))
            }
    
            button.menu = UIMenu( children: menuChildren)
            button.showsMenuAsPrimaryAction = true
            button.tintColor = UIColor.clear
            
           
        }else {
            print("✋🏻empty array ")
        }
    }
   
    
    
}
