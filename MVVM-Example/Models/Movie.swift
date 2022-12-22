//
//  Movie.swift
//  MVVM-Example
//
//  Created by Burak on 12.12.2022.
//

import Foundation

// MARK: - Movie
struct Movie: Codable {
    let results: [MovieResult]?

    enum CodingKeys: String, CodingKey {
        case results
    }
}

// MARK: - MovieResult
struct MovieResult: Codable {
    let id: Int?
    let posterPath, overview, releaseDate, title: String?

    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }
}

