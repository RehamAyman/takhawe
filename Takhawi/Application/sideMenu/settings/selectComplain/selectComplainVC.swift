//
//  selectComplainVC.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class selectComplainVC: BaseVC{
  
    
    
    //MARK: - IBOutlets -
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var tableview: UITableView!
    //MARK: - Properties -
    var passComplainTitle : ((String) -> Void)?
    var selectedItem : String = ""
    var viewDismissed : (() -> Void)?
    
    var complains : [String] = [
        "Vehicle not clean" ,
        "Driver behavior" ,
        "Route deviation" ,
        "Fare disputes" ,
        "Safety concerns" ,
        "Lost items" ,
        "Accessibility issues" ,
       "Other issues"
    ]

    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
    //MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.mainView.AddTOPCornersView(num: 35 )
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(cellType: selectYourComplainCell.self)
    }
    
    //MARK: - Logic Methods -
    
    
    
    
    //MARK: - Actions -

    @IBAction func selectItem(_ sender: UIButton) {
        self.passComplainTitle?(self.selectedItem)
        self.dismiss(animated: true )
    }
    @IBAction func dismiss(_ sender: UIButton) {
        self.viewDismissed?()
        self.dismiss(animated: true )
    }
}


//MARK: - tableview methods extention  -
extension selectComplainVC : UITableViewDelegate, UITableViewDataSource   {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.complains.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectYourComplainCell", for: indexPath) as! selectYourComplainCell
        let item = self.complains[indexPath.row]
        cell.complainLabel.text = item
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? selectYourComplainCell else {
            return
        }
        cell.checkBox.isHidden = false
        cell.checkBox.play()
        self.selectedItem = cell.complainLabel.text ?? ""
      
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as?  selectYourComplainCell else {
            return
        }
        cell.checkBox.stop()
        cell.checkBox.isHidden = true
           
       }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}

//MARK: - Routes -
extension selectComplainVC {
    
}
