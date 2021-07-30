//
//  MainDefaultInteractor.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation
import UIKit

class MainDefaultInteractor: MainInteractor {
    
    weak var presenter: MainPresenter?
    
    var gallery: [PostData] = []
    
    func getGalleryItems() {
        
        let url = "https://api.imgur.com/3/gallery/hot/viral/all/1?q_tags=image"
        let clientID = "9a17a14b9f227d9" //From registered App in admin section imgure site
        var tempGallery: [String] = []
        
        guard let url = URL(string: url) else {
            return
        }
        
        //Autentication in imgur
        let boundary = "Boundary-\(UUID().uuidString)"
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        request.addValue("Client-ID \(clientID)", forHTTPHeaderField: "Authorization")
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { [weak self] (data, _, error) in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchGallery(with: .failure(error!))
                return
            }
            do {
                let entities = try JSONDecoder().decode(GalleryPost.self, from: data)
                
                //check data and append to
                for i in entities.data {
                    if i.images != nil && i.images?[0].type != "video/mp4" {
                        self?.gallery.append(i)
                        tempGallery.append(i.title)
                    }
                }
                self?.presenter?.interactorDidFetchGallery(with: .success(tempGallery))
            }
            catch {
                self?.presenter?.interactorDidFetchGallery(with: .failure(error))
            }
        }.resume()
    }
    
    func getImages() {
        for i in gallery {
            let url = i.images![0].link
            downloadImage(url: url) { image in
                let anyObject: AnyObject = image as AnyObject
                self.presenter?.interactorDidDownloadImage(with: .success(anyObject))
            }
        }
    }
    
    func downloadImage(url: String, completion: ((UIImage) -> Void)?) {
        let url = URL(string: url)
        guard let url = url else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidDownloadImage(with: .failure(error!))
                return
            }
            completion!(UIImage(data: data)!)
        }.resume()
    }
    
}
