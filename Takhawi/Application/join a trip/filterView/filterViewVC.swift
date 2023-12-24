//
//  filterViewVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 30/11/2023.
//
//  Template by MGAbouarab®


import UIKit

class filterViewVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var mainView: UIView!
    
//MARK: - Properties -
    let dummyfilterData : [dummyFilterData] = [
        dummyFilterData(name: "Relevent", selected: false ) ,
        dummyFilterData(name: "Most Rated", selected: false ) ,
        dummyFilterData(name: "Highest Priced", selected: false ) ,
        dummyFilterData(name: "Lowest Priced", selected: false )
    ]
    var dismissAction: (() -> Void)?
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        mainView.AddTOPCornersView(num: 30)
        tableview.delegate = self
        tableview.dataSource = self
        self.tableview.register(cellType: filterCell.self)
     
    }
    
//MARK: - Logic Methods -
    
    
    
//MARK: - Actions -
    
    @IBAction func reset(_ sender: UIButton) {
        self.dismissAction?()
        self.dismiss(animated: true )
    }
    
   
    
    
    

    @IBAction func filterSelect(_ sender: UIButton) {
        self.dismissAction?()
        self.dismiss(animated: true )
    }
    
}


//MARK: - Networking -
extension filterViewVC {
    
}

//MARK: - Routes -
extension filterViewVC {
    
}


 
extension filterViewVC : UITableViewDelegate , UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyfilterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath) as! filterCell
        let item = self.dummyfilterData[indexPath.row]
        cell.name.text = item.name
     
       
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? filterCell else {
            return
        }
        cell.checkMark.image =  UIImage(named: "check" )
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? filterCell else {
            return
        }
        cell.checkMark.image = UIImage(named: "Rectangle 4699" )
        
        
        
    }
    
    
    
}
