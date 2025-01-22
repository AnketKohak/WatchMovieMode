//
//  MoiveModel.swift
//  WatchMovieMode
//
//  Created by Anket Kohak on 22/01/25.
//

import Foundation
struct MovieResponse: Codable {
        let titles: [Movie]
    enum CodingKeys: String, CodingKey {
        case titles
    }
}

struct Movie: Codable,Identifiable {
    let id: Int
    let title: String
    let year: Int
    let imdbID: String
    let tmdbID: Int
    let tmdbType, type: String

    enum CodingKeys: String, CodingKey {
        case id, title, year
        case imdbID = "imdb_id"
        case tmdbID = "tmdb_id"
        case tmdbType = "tmdb_type"
        case type
    }
}
// MARK: - Movie Deatails section
