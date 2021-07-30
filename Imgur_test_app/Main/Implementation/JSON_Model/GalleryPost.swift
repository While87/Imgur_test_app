//
//  GalleryPost.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

struct GalleryPost: Codable {
    let data : [PostData]
}

struct PostData: Codable {
    let id: String
    let title: String
    let images: [ImageData]?
}

struct ImageData: Codable {
    let id: String
    let type: String
    let width: Int
    let height: Int
    let views: Int
    let link: String
}
