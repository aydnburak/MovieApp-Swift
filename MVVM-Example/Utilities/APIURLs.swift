//
//  APIURLs.swift
//  MVVM-Example
//
//  Created by Burak on 12.12.2022.
//

import Foundation

final class APIURLs {
    private init(){}
    
    static func movies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/popular?api_key=685a651565a761e57d0023460c2c6cf3&language=en-US&page=\(page)"
    }
    
    static func detail(id: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(id)?api_key=685a651565a761e57d0023460c2c6cf3&language=en-US"
    }

    static func imageURL(posterPath: String) -> String {
        "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
}
