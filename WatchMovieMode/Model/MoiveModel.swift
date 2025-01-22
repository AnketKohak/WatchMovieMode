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
struct MovieDetailResponse: Codable {
    let movie: [MovieDetail]
}

struct MovieDetail: Codable,Identifiable {
    let id: Int?
    let title, originalTitle, plotOverview, type: String?
    let  year: Int?
    let runtime_minutes:Int?
    let releaseDate, imdbID: String?
    let tmdbID: Int?
    let tmdbType: String?
    let genres: [Int]?
    let genreNames: [String]?
    let userRating: Double?
    let criticScore: Int?
    let usRating: String?
    let poster: String?
    let posterMedium: String?
    let originalLanguage: String?
   
    

    enum CodingKeys: String, CodingKey {
        case id, title
        case originalTitle = "original_title"
        case plotOverview = "plot_overview"
        case type
       case runtime_minutes
        case year
        
        case releaseDate = "release_date"
        case imdbID = "imdb_id"
        case tmdbID = "tmdb_id"
        case tmdbType = "tmdb_type"
        case genres
        case genreNames = "genre_names"
        case userRating = "user_rating"
        case criticScore = "critic_score"
        case usRating = "us_rating"
        case poster
        case posterMedium
        case originalLanguage = "original_language"
   
        
    }
}

// MARK: - Source

