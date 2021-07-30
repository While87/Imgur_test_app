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
    
    func showDetailView() {
        self.router?.showDetail()
    }
    
}
