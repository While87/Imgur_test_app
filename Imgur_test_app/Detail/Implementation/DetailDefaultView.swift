//
//  DetailDefaultView.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import UIKit

class DetailDefaultView: UIViewController, DetailView {
    
    var router: DetailRouter?
    var presenter: DetailPresenter?
    
    var image: PostData? {
        didSet {
            self.presenter?.getComments(id: image!.id)
        }
    }
    
    var comments: Comment?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var waitIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setLabels()
    }
    
    override func viewDidLayoutSubviews() {
        waitIndicator.center = self.view.center
    }
    
    func setLabels() {
        
        guard let id = image?.images![0].id,
              let type = image?.images![0].type,
              let width = image?.images![0].width,
              let height = image?.images![0].height,
              let views = image?.images![0].views,
              let link = image?.images![0].link else { return }
        
        self.idLabel.text = "ID - \(id)"
        self.typeLabel.text = "Type - \(type)"
        self.widthLabel.text = "Width - \(width)"
        self.heightLabel.text = "Height - \(height)"
        self.viewsLabel.text = "Views - \(views)"
        self.linkLabel.text = "Link - \(link)"
    }
    
    func updateComments(with data: AnyObject) {
        comments = data as? Comment
        DispatchQueue.main.async {
            self.waitIndicator.isHidden = true
            self.tableView.reloadData()
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
    
    func updateImageData(with data: AnyObject) {
        self.image = data as? PostData
    }
}

extension DetailDefaultView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        cell.textLabel?.text = comments?.data?[indexPath.row].author
        cell.detailTextLabel?.text = comments?.data?[indexPath.row].comment
        return cell
    }
}
