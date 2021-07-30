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
    @IBOutlet weak var waitIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register custom collection cell
        self.collectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        waitIndicator.center = self.view.center
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func updateCollection(with gallery: [String]) {
        self.gallery = gallery
        DispatchQueue.main.async {
            self.waitIndicator.isHidden = true
            self.collectionView.reloadData()
        }
    }
    
    func updateImage(with data: AnyObject) {
        self.images.append(data as! UIImage)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func updateError(with error: String) {
        DispatchQueue.main.async {
            self.waitIndicator.isHidden = true
            
            let alert = UIAlertController(title: "Warning!", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "I am sad 😭", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension MainDefaultView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.labelCell.text = gallery[indexPath.item]
        cell.imageCell.image = images[indexPath.item]
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
        self.presenter?.getDetails(id: indexPath.item)
    }
}
