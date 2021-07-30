//
//  DetailDefaultInteractor.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation

class DetailDefaultInteractor: DetailInteractor {
    
    weak var presenter: DetailPresenter?
    
    func getComments(id: String) {
        
        let clientID = "9a17a14b9f227d9" //From registered App in admin section imgur site
        
        guard let url = URL(string: "https://api.imgur.com/3/gallery/\(id)/comments") else {
            return
        }
        
        let boundary = "Boundary-\(UUID().uuidString)"
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        request.addValue("Client-ID \(clientID)", forHTTPHeaderField: "Authorization")
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { [weak self] (data, _, error) in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchComments(with: .failure(error!))
                return
            }
            do {
                let result = try JSONDecoder().decode(Comment.self, from: data)
                self?.presenter?.interactorDidFetchComments(with: .success(result as AnyObject))
            }
            catch {
                self?.presenter?.interactorDidFetchComments(with: .failure(error))
            }
        }.resume()
    }
}
