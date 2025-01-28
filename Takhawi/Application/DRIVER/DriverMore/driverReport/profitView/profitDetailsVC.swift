//
//  profitDetailsVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 12/04/1446 AH.
//
//  Template by MGAbouarab®


import UIKit

class profitDetailsVC: BaseVC  , UITableViewDelegate , UITableViewDataSource {
  
    
    
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var totalProfit: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
//MARK: - Properties -
    var results : [TripsReport]  = []

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.getTotalProfit()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: profitCell.self)
        
    }
    
//MARK: - TABLE VIEW  Methods -
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profitCell" , for: indexPath) as! profitCell
        cell.selectionStyle = .none
        let item = self.results[indexPath.row]
        cell.mainTitle.text = "Trip no." + "#" + "\(item.tripid ?? 0 )"
        cell.from.text = item.pickuplocation ?? "--"
        cell.to.text = item.destinationlocation ?? "--"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.results[indexPath.row]
        let vc = tripReportVC()
        vc.tripId = item.tripid ?? 0
        self.push(vc)
    }
    
    
    
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension profitDetailsVC {
    
    func getTotalProfit  () {
        activityIndicatorr.startAnimating()
        DriverRouter.getTotalProfit.send { [weak self ] (response : APIGenericResponse<totalProfitResult>)  in
            guard let self = self else { return }
            if let result = response.result {
                self.totalProfit.text = "\(result.totalProfit ?? 0 )"
                self.results = result.tripsReport ?? []
                self.tableView.reloadData()
            }
        }
    }
}



//MARK: - Routes -
extension profitDetailsVC {
    
}
