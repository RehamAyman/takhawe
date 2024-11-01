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
import Alamofire
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
    
    
    
    /// `Add Cuurnt User Lat & Lng`
    
    var currentLat = 0.0
    var currentong = 0.0
    
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
   
    
//    func getGooglePlaces(keyword:String,lat:Double,lng:Double){
//        let urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(lat)%2C\(lng)&radius=2500&keyword=\(keyword)&key=\(AppDelegate.GoogleAPI)"
//        print("🐮\(urlString)")
//        AF.request(urlString, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { response in
//                        switch response.result {
//                        case .success:
//
//                            print("🙊\(response)")
//                        case .failure(let error):
//                            print(error)
//                        }
//                    })
//    }
//
    
    
    func getGooglePlaces(keyword:String,lat:Double,lng:Double) {
        self.results.removeAll()
        self.googleTableView.reloadData()
        self.googleTableView.isHidden = false
        self.googleTableView.isUserInteractionEnabled = true

        
        //https://developers.google.com/maps/documentation/places/web-service/search-find-place
//        let urlString = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(query)&location=\(location)&radius=\(radius)&key=\(apiKey)"

//
//        let urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(lat)%2C\(lng)&rankby=distance&keyword=\(keyword)&key=\(AppDelegate.GoogleAPI)"
        
        let urlString = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(keyword)&location=\(lat),\(lng)&radius=100000&key=\(AppDelegate.GoogleAPI)"


        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            
//            if let error = error {
//                       print("Error fetching predictions: \(error.localizedDescription)")
//                       return
//                   }
//
//                   guard let data = data else { return }
//
//            do {
//                let result = try JSONDecoder().decode(PlaceAutocompleteResponse.self, from: data)
//               
//                for i in result.predictions {
//                    print("❤️")
//                    print(i)
//                }
//
//                  } catch {
//                      print("Error decoding JSON: \(error.localizedDescription)")
//                  }
//              }
//
            
            
                        guard let data = data, error == nil else {
                print("Error fetching route: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            
            
            
            
            
            do {
                
                
                
                
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
                    
                    print(json)
                    
                    
                    
                    if let results =  json["predictions"] as? [[String:Any]] {
                      //mainTitle?["secondary_text"]
                        //i["description"]
                        for i in results{
                            let mainTitle = i["structured_formatting"] as? [String:Any]
                            
                            self.results.append(googleResult(fullText: i["description"]  as? String ?? "",
                                                             secText: mainTitle?["secondary_text"] as? String ?? "",
                                                             selected: false,
                                                             placeID: i["place_id"] as? String ?? "",
                                                             PlaceSelected: false,
                                                             description: mainTitle?["secondary_text"]  as? String ?? ""))
                        
                        }
                        
                       
                      
                        
                    }else{
                        print("no results ")
                         self.googleTableView.isHidden = true
                         self.googleTableView.isUserInteractionEnabled = false
                    }
                    DispatchQueue.main.async {
                        self.googleTableView.reloadData()
                        self.googleTableView.isHidden = false
                        self.googleTableView.isUserInteractionEnabled = true
                    }
                }
               } catch {
                
                
                print("Error parsing route: \(error.localizedDescription)")
            }
            
            
           
        }
        task.resume()
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
            self.getGooglePlaces(keyword: textField.text?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)  ?? "", lat: self.currentLat, lng: self.currentong)
//            self.getNearbyPlacesSearch(keyword: textField.text  ?? "", lat: self.currentLat, lng: self.currentong)
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



struct googleResult :Decodable{
    let fullText : String
    let secText : String
    var selected : Bool
    let placeID : String
    var PlaceSelected : Bool
    let description : String
    
}
struct PlaceAutocompleteResponse: Codable {
    let predictions: [PlacePrediction]
}

struct PlacePrediction: Codable {
    let description: String
    let place_id: String  // Optional: to access place ID if needed
}
