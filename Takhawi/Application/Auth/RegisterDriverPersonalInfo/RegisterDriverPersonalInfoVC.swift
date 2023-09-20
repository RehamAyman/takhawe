//
//  RegisterDriverPersonalInfoVC.swift
//  Takhawi
//
//  Created by Sara Mady on 06/08/2023.
//
//  Template by MGAbouarab®

import UIKit
import M13Checkbox

// MARK: - ViewController
class RegisterDriverPersonalInfoVC: BaseVC {

    // MARK: - IBOutlets -
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak var agreeCheackBox: M13Checkbox!

    // MARK: - Properties -
    private var items: [hobbiesModel] = [
        hobbiesModel(name: "Travel".localized, image: UIImage(named: "airplane")!),
        hobbiesModel(name: "Painting".localized,
        image: UIImage(named: "artist")!),
        hobbiesModel(name: "Photography".localized,
        image: UIImage(named: "camera")!),
        hobbiesModel(name: "Camping".localized,
        image: UIImage(named: "camping-tent")!),
        hobbiesModel(name: "Roller Skate",
        image: UIImage(named: "roller-skate")!),
        hobbiesModel(name: "Cooking".localized,
        image: UIImage(named: "cooking-pot")!),
        hobbiesModel(name: "Exercise".localized,
        image: UIImage(named: "exercise")!),
        hobbiesModel(name: "Fishing".localized,
        image: UIImage(named: "fishing")!),
        hobbiesModel(name: "Football".localized,
        image: UIImage(named: "football-ball")!),
        hobbiesModel(name: "PlayStation".localized,
        image: UIImage(named: "gamepad")!),
        hobbiesModel(name: "Music".localized,
        image: UIImage(named: "guitar")!),
        hobbiesModel(name: "Movies".localized,
        image: UIImage(named: "movies")!),
        hobbiesModel(name: "Reading".localized,
        image: UIImage(named: "open-book")!),
        hobbiesModel(name: "Shopping".localized,
        image: UIImage(named: "shopping-bag")!),
        hobbiesModel(name: "Swimming".localized,
        image: UIImage(named: "swimming")!),
        hobbiesModel(name: "Hand Made".localized,
        image: UIImage(named: "hand-made")!)

    ]
    let animationDuration: Double = 0.5
    let delayBase: Double = 0.5
    var isCollectionViewLoadedFirst = false

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.setupCollectionView()

    }

    override func viewDidAppear(_ animated: Bool) {
        self.progressView.setProgress(1.0, animated: true)
        self.collectionView.reloadData()

    }
    // MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        agreeCheackBox.boxType = .square
        agreeCheackBox.stateChangeAnimation = .stroke
    }

    // MARK: - Logic Methods -

    @IBAction func signUpAction(_ sender: Any) {
        let vc = OTPVC()
        push(vc)
    }

    // MARK: - Actions -

}

// MARK: - Start Of CollectionView -
extension RegisterDriverPersonalInfoVC {
    private func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(cellType: RegisterDriverPersonalInfoCell.self)
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    }
}
extension RegisterDriverPersonalInfoVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: RegisterDriverPersonalInfoCell.self, for: indexPath)

        cell.conrinerView.cornerRadius = 10
        cell.conrinerView.clipsToBounds = true

        if isCollectionViewLoadedFirst == false {
            cell.conrinerView.alpha = 0
            cell.conrinerView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }

        let item = self.items[indexPath.row]
        cell.configureWith(data: item)

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        if isCollectionViewLoadedFirst == false {
            if let customCell = cell as? RegisterDriverPersonalInfoCell {

                let column = Double(customCell.frame.minX / customCell.frame.width)
                let row = Double(customCell.frame.minY / customCell.frame.height)

                let distance = sqrt(pow(column, 2) + pow(row, 2))
                let delay = sqrt(distance) * delayBase

                UIView.animate(withDuration: animationDuration, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: [], animations: {
                    customCell.conrinerView.alpha = 1
                    customCell.conrinerView.transform = .identity
                })
            }
        }
    }

}
extension RegisterDriverPersonalInfoVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if  items[indexPath.row].isSelected == true {
            items[indexPath.row].isSelected = false
        } else {
            items[indexPath.row].isSelected = true
        }
        isCollectionViewLoadedFirst = true
        self.collectionView.reloadData()
    }
}
extension RegisterDriverPersonalInfoVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let insets: CGFloat = 15.0 * 2.0
        let spacing: CGFloat = 15.0 * 2.0
        let width = collectionView.width - (insets + spacing)
        let itemLength = width / 4
        return CGSize(width: itemLength, height: itemLength)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}
// MARK: - End Of CollectionView -

// MARK: - Networking -
extension RegisterDriverPersonalInfoVC {

}

// MARK: - Routes -
extension RegisterDriverPersonalInfoVC {

}

struct hobbiesModel {
    var name: String
//    var id:Int
    var image: UIImage
    var isSelected: Bool = false
}
