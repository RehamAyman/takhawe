//
//  walletVC+extentions.swift
//  Takhawi
//
//  Created by Mac on 21/12/2023.
//

import UIKit



extension walletVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "walletCell", for: indexPath) as! walletCell
        return cell
    }
    
    
    
    
    
    
}
