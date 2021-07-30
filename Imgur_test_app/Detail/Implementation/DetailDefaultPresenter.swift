//
//  DetailDefaultPresenter.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation

class DetailDefaultPresenter: DetailPresenter {

    weak var view: DetailView?
    var interactor: DetailInteractor?
    var router: DetailRouter?
      
    func interactorDidFetchComments(with result: Result<AnyObject, Error>) {
        switch result {
        case .success(let data):
            self.view?.updateComments(with: data)
        case .failure(let error):
            self.view?.updateError(with: error.localizedDescription)
        }
    }
    
    func getComments(id: String) {
        self.interactor?.getComments(id: id)
    }
    
    func updateImageData(data: AnyObject) {
        self.view?.updateImageData(with: data)
    }
}
