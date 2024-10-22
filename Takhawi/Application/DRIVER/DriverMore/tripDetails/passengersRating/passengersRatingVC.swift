//
//  passengersRatingVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 17/04/1446 AH.
//
//  Template by MGAbouarab®


import UIKit

class passengersRatingVC: BaseVC, UITableViewDataSource, UITableViewDelegate {
    
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainView: UIView!
    
//MARK: - Properties -
    
    var allPassengers : [Passengers] = []
    var vip : Bool = false
    var passenger : PassengerClass?
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.mainView.layer.addBasicShadow(cornerRadius: 20)
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: retePassengersCell.self)
    }
    
//MARK: - Logic Methods -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.vip {
            return 1
        } else {
            return self.allPassengers.count
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "retePassengersCell", for: indexPath) as! retePassengersCell
        
        if self.vip {
            let item  = self.passenger
            cell.userName.text = item?.name ?? ""
            if let image = item?.image {
                cell.userImage.setImage(image: Server.imageBase.rawValue + image )
            }
        } else {
            let item = self.allPassengers[indexPath.row]
            cell.userName.text = item.passnger?.name ?? ""
            if let image = item.passnger?.avatar {
                cell.userImage.setImage(image: Server.imageBase.rawValue + image )
            }
        }
       
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
//MARK: - Actions -
    
    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true , completion: nil )
    }
    @IBAction func submitAction(_ sender: UIButton) {
        self.dismiss(animated: true , completion: nil )
    }
}


//MARK: - Networking -
extension passengersRatingVC {
    
}

//MARK: - Routes -
extension passengersRatingVC {
    
}
