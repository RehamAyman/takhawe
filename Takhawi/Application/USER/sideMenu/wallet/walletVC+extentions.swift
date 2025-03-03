//
//  walletVC+extentions.swift
//  Takhawi
//
//  Created by Mac on 21/12/2023.
//

import UIKit



extension walletVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.walletTransactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "walletCell", for: indexPath) as! walletCell
        let item = self.walletTransactions[indexPath.row]
        cell.mainTitle.text = item.transaction_type ?? ""
        cell.subTitle.text = item.createdAt?.convertFromIso()
        cell.cost.text = "\(item.amount ?? 0 )" + "SAR".localize
        if let ammount = item.amount  {
            if ammount > 0 { // positive
                cell.icon.image = UIImage(named: "Down")
            } else { // negative
                cell.icon.image = UIImage(named: "Up")
            }
        }
        return cell
    }
    
    
    
    
//MARK: -  GET USER WALLET

    func getUserAmmount () {
        activityIndicatorr.startAnimating()
        UserRouter.walletData(page: 1).send { [weak self ] (response: APIGenericResponse<WalletResult>) in
            guard let self = self else { return }
            if let result = response.result {
                self.totalAmmount.text = "\(result.balance ?? 0 )"
                self.walletTransactions = result.transactions ?? []
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    
}
