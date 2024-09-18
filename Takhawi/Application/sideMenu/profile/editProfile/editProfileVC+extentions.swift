//
//  editProfileVC+extentions.swift
//  Takhawi
//
//  Created by Reham Ayman on 06/01/2024.
//

import UIKit

extension editProfileVC  : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout ,  UIImagePickerControllerDelegate  ,  UINavigationControllerDelegate  {
 
//MARK: - VIEWS DSIGN  HELPER  METHODS
   private func handleTextfields () {
     
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
    self.name.text = self.profileData?.name ?? ""
    self.emailTextField.text = self.profileData?.email ?? ""
    self.birthdateText.text = self.profileData?.birth_date?.convertFromIsoToddmmyy() ?? ""
   
    self.cityText.text =  self.profileData?.city?.name ?? "" 
    self.phoneNumber.text = self.profileData?.phone ?? ""
    self.genderText.text = self.profileData?.gender ?? ""
    self.FavouritesTextArea.textView.text = self.profileData?.bio ?? ""
    self.collectionView.semanticContentAttribute = .forceRightToLeft
        
    }
    
    
    func setUpMainView () {
        self.handleTextfields()
        self.selectedCityId = self.profileData?.city?.id ?? 0
        
        
        if let imageString = profileData?.avatar {
            let avatar = Server.imageBase.rawValue + imageString
            self.profileIcon.setImage(image: avatar )
        }
        
      
        self.hobbiesArray =  self.profileData?.hobbies ?? []
        self.collectionView.reloadData()
        if self.profileData?.hobbies?.isEmpty == true  {
            self.collectionViewHeight.constant = 0
        }
        
        self.profileIcon.addTapGesture {
            self.uploadImage(mediaType: [mediaTypes.publicImage.rawValue])
        }
        
        let datePicker = UIDatePicker()
                datePicker.datePickerMode = .date
                datePicker.preferredDatePickerStyle = .wheels
                datePicker.maximumDate = Date() // No future dates allowed
                
                // Set UIDatePicker as the input view for the text field
        birthdateText.inputView = datePicker
                
                // Add a toolbar with a Done button to dismiss the picker
                let toolbar = UIToolbar()
                toolbar.sizeToFit()
                let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePressed))
                toolbar.setItems([doneButton], animated: true)
                birthdateText.inputAccessoryView = toolbar
                
                // When the date is selected, update the text field
                datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
    }
    @objc func donePressed() {
           
           self.view.endEditing(true)
       }
       
       @objc func dateChanged(datePicker: UIDatePicker) {
           // Format and display the selected date in the text field
           let dateFormatter = DateFormatter()
           dateFormatter.dateStyle = .medium
           birthdateText.text = datePicker.date.dateToString //  dateFormatter.string(from: datePicker.date)
       }
    
    
    
    func birthDayAction () {
        self.birthdateText.addTapGesture {
            
        }
    }
    
    func handleOpenListAction () {
        self.openHobbiesList.addTapGesture {
            
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
        
        cell.hobbieName.text = item.name
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        
        if let image = info[.editedImage] as! UIImage? {
            let imageData = image.jpegData(compressionQuality: 0.4)!
            self.profileIcon.image = image
            self.profileImageDate = imageData
//            self.profileImage.contentMode = .scaleAspectFill
//            self.profileImage.layer.cornerRadius = 50
            picker.dismiss(animated: true, completion: nil)
        }

    }
    

    
    
//MARK: - SELECT FROM MENUS METHODS
    //MARK: - SELECT FROM HOBBIES MENU
    private func selectFromMainHobbies (button : UIButton , textField : UITextField  ) {

        if self.mainHobbies.isEmpty == false {
            let actionClosure = { (action: UIAction) in
                print("👀✋🏻 i select regon name : \(action.title ) with id : \(action.identifier.rawValue)")
              
               
                if self.hobbiesArray.contains(where: { $0.id == Int( action.identifier.rawValue ) }) {
                } else {
                  //  textField.text = action.title
                    let  newElement = HobbiesClass(id: Int( action.identifier.rawValue ), name: action.title)
                    self.hobbiesArray.append( newElement )
                    self.collectionView.reloadData()
                }
                
              
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
    
    
//MARK: - SELECT FROM GENDERS MENU
 func selectGender (button : UIButton , textField : UITextField  ) {

        if self.genders.isEmpty == false {
            let actionClosure = { (action: UIAction) in
                print("👀✋🏻 i select gender name : \(action.title ) with id : \(action.identifier.rawValue)")
                textField.text = action.title
            
            }
    
            var menuChildren: [UIMenuElement] = []
            for i in self.genders {
                menuChildren.append(UIAction(title: i , identifier: UIAction.Identifier( String ( i ) )  , handler: actionClosure))
            }
    
            button.menu = UIMenu( children: menuChildren)
            button.showsMenuAsPrimaryAction = true
            button.tintColor = UIColor.clear
            
           
        }else {
            print("✋🏻empty array ")
        }
    }
    
//MARK: - SELECT FROM CITIES  MENU
    
   private func selectCity (button : UIButton , textField : UITextField  , cities : [CitiesResult]   ) {

           if cities.isEmpty == false {
               let actionClosure = { (action: UIAction) in
                   print("👀✋🏻 i select city name : \(action.title ) with id : \(action.identifier.rawValue)")
                   textField.text = action.title
                   self.selectedCityId = Int( action.identifier.rawValue ) ?? 0
               
               }
       
               var menuChildren: [UIMenuElement] = []
               for i in cities {
                   menuChildren.append(UIAction(title: i.name ?? ""  , identifier: UIAction.Identifier( String ( i.id ?? 0  ) )  , handler: actionClosure))
               }
       
               button.menu = UIMenu( children: menuChildren)
               button.showsMenuAsPrimaryAction = true
               button.tintColor = UIColor.clear
               
              
           }else {
               print("✋🏻empty array ")
           }
       }
    
    
    
    
    //MARK: - NETWORK METHODS
    
    
    //MARK: - UPDATE PROFILE
    func updateMyProfile () {
        activityIndicatorr.startAnimating()
        var uploadedData = [UploadData]()
        if let image =   self.profileImageDate {
            uploadedData.append((UploadData(data: image, fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: .jpg, name: "avatar")))
        }
     
        UserRouter.updateProfile(name: self.name.text ?? "" , email: self.emailTextField.text ?? "" , birthDate: self.birthdateText.text ?? "" , bio: self.FavouritesTextArea.textView.text , cityId: self.selectedCityId , gender: self.genderText.text ?? "" , hobbies: self.hobbiesArray).send(data: uploadedData.isEmpty ?  [] : uploadedData ) { [weak self ] ( response : APIGlobalResponse )  in
            guard let self = self else { return}
            if response.status == true  {
                showPopTopAlert(title: "Done Successfully".localize , withMessage: response.message , success: true )
                
                // fire home notification center to update the user image in side menu
                NotificationCenter.default.post(name: .updateHomeProfile, object: nil)
                
                self.action?()
            }
                
        }
    }
    
    
    //MARK: - GET ALL CITIES
    
    
    func getAllCities () {
        
        UserRouter.getAllCities(page: 1).send { [weak self ] (response: APIGenericResponse<[CitiesResult]> ) in
            guard let self = self else { return }
           
            if let result = response.result {
                self.allCities = result
                self.selectCity(button: self.selectCityId , textField: self.cityText, cities: result)
            }
          
            
        }
    }
    
    
    
    //MARK: - GET ALL HOBBIES
    func getAllBobbies () {
        UserRouter.getAllHobbies.send { [weak self ] ( response : APIGenericResponse<[HobbiesClass]> )  in
            guard let self = self else { return }
            self.mainHobbies = response.result ?? []
            self.selectFromMainHobbies(button: self.chooseFromMain , textField: self.hobbies)
        }
    }
    
}
