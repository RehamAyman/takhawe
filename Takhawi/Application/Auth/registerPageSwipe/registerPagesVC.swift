//
//  registerPagesVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//
//  Template by MGAbouarab®


import UIKit

//MARK: - ViewController
class registerPagesVC: BaseVC {
    
//MARK: - IBOutlets -
    @IBOutlet weak private var collectionView: UICollectionView!
    
//MARK: - Properties -
    private var items: [String] = []
    
//MARK: - Creation -
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.setupCollectionView()
    }
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Start Of CollectionView -
extension registerPagesVC {
    private func setupCollectionView() {
      //  self.collectionView.dataSource = self
      //  self.collectionView.delegate = self
    //    self.collectionView.register(cellType: registerPagesCell.self)
     //   self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
extension registerPagesVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: registerPagesCell.self, for: indexPath)
        let item = self.items[indexPath.row]
        cell.configureWith(data: item)
        return cell
    }
}
extension registerPagesVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = self.items[indexPath.row]
    }
}
//extension registerPagesVC: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        <#code#>
//    }
//}
//MARK: - End Of CollectionView -

//MARK: - Networking -
extension registerPagesVC {
    
}

//MARK: - Routes -
extension registerPagesVC {
    
}
