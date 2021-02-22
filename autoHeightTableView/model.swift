//
//  model.swift
//  autoHeightTableView
//
//  Created by Masam Mahmood on 18.02.2021.
//

import Foundation

// MARK: - Review
struct Review: Codable {
    let reviewPermission, isFavorite: String?
    let reviewDetails: ReviewDetails?
}

// MARK: - ReviewDetails
struct ReviewDetails: Codable {
    let title, link, count: String?
    let reviews: [ReviewElement]?
}

// MARK: - ReviewElement
struct ReviewElement: Codable {
    let reviewID: String?
    let image: String?
    let name, date, comment, rating: String?
    let likeCount, isLiked: String?
    var isExpanded: Bool? = false

    enum CodingKeys: String, CodingKey {
        case reviewID
        case image, name, date, comment, rating, likeCount, isLiked
    }
}
