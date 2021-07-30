//
//  MainDefaultView.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import UIKit

class MainDefaultView: UIViewController, MainView {

  
    
    var presenter: MainPresenter?
    
    var gallery: [String] = []
    var images: [UIImage] = []

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var waitIndicator: UIActivityIndicatorView!
    
    //temp data collection
    var item: [(UIImage, String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        waitIndicator.center = self.view.center
        
        //Register custom collection cell
        self.collectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func updateCollection(with gallery: [String]) {
        self.gallery = gallery
        DispatchQueue.main.async {
            self.waitIndicator.isHidden = true
            self.collectionView.reloadData()
        }
    }
    
    func updateImage(with data: Data) {
        images.append(UIImage(data: data)!)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    func updateError(with error: String) {
        waitIndicator.isHidden = true
        errorLabel.isHidden = false
        errorLabel.text = error
    }
    
    
}

extension MainDefaultView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.labelCell.text = gallery[indexPath.item]
        
        if images.count > indexPath.item || images.count == 0 {
            self.presenter?.getImage(id: indexPath.item)
        } else {
            cell.imageCell.image = images[indexPath.item]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.bounds.width - 10, height: self.collectionView.bounds.height - 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter?.showDetails(id: indexPath.item)
    }
}
