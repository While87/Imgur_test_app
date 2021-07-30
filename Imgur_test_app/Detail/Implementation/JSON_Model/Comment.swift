//
//  Comment.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation

class Comment: Codable {
    let data: [CommentData]?
}

class CommentData: Codable {
    let comment: String
    let author: String
}
