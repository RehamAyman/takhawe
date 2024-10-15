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
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = tripReportVC()
        self.push(vc)
    }
    
    
    
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension profitDetailsVC {
    
}

//MARK: - Routes -
extension profitDetailsVC {
    
}
