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
    let id: Int
    let title, originalTitle, plotOverview, type: String
    let  year: Int
    let releaseDate, imdbID: String
    let tmdbID: Int
    let tmdbType: String
    let genres: [Int]
    let genreNames: [String]
    let userRating: Double
    let criticScore: Int
    let usRating: String
    let poster, backdrop: String
    let originalLanguage: String
    let similarTitles, networks: [Int]
    let networkNames: [String]
    let trailer: String
    let trailerThumbnail: String
    let relevancePercentile: Double
    

    enum CodingKeys: String, CodingKey {
        case id, title
        case originalTitle = "original_title"
        case plotOverview = "plot_overview"
        case type
       
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
        case poster, backdrop
        case originalLanguage = "original_language"
        case similarTitles = "similar_titles"
        case networks
        case networkNames = "network_names"
        case trailer
        case trailerThumbnail = "trailer_thumbnail"
        case relevancePercentile = "relevance_percentile"
        
    }
}

// MARK: - Source

