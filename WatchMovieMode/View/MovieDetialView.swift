//
//  MovieDetialView.swift
//  WatchMovieMode
//
//  Created by Anket Kohak on 22/01/25.
//

import SwiftUI

struct MovieDetialView: View {
    // MARK: - Variable
    @StateObject var viewModel = MovieViewModel()
    let movie: MovieDetail
    let languageMapping: [String: String] = [
        "en": "English",
        "de": "German",
        "fr": "French",
        "es": "Spanish",
        "it": "Italian",
        "ru": "Russian",
        "ja": "Japanese",
        "zh": "Chinese",
        "hi": "Hindi",
        "du": "Dutch",
    ]
    
    func getLanguageName(from code: String) -> String {
        return languageMapping[code] ?? "Unknown Language"
    }
    
    // MARK: - Body
    var body: some View {
        
            VStack(spacing: 14) {
                // MARK: Poster Image
                if let posterURL = movie.posterMedium, let url = URL(string: posterURL) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .scaledToFit()
                            .cornerRadius(12)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 400)
                    .clipped()
                }
                
                HStack {
                    // MARK: Original Title
                    if let originalTitle = movie.originalTitle {
                        Text(originalTitle)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                            .lineLimit(2)
                    }
                    Spacer()
                    
//                     MARK: Runtime Minutes
                    if let runtimeMinutes = movie.runtime_minutes {
                        Text("\(runtimeMinutes) min")
                            .foregroundStyle(.black)
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    
                    Spacer()
                    
                    // MARK: User Rating
                    if let userRating = movie.userRating {
                        Text(userRating.toString())
                            .foregroundStyle(.black)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(4)
                            .background(.yellow)
                            .cornerRadius(12)
                    }
                }
                
                HStack {
                    // MARK: Release Date
                    if let releaseDate = movie.releaseDate {
                        Text(releaseDate)
                            .foregroundStyle(.black)
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    
                    // MARK: Original Language
                    if let originalLanguage = movie.originalLanguage {
                        Text(getLanguageName(from: originalLanguage))
                            .font(.title3)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                    }
                }
                
                // MARK: Genre Names
                if let genreNames = movie.genreNames {
                    Text(genreNames.map { $0.capitalized }.joined(separator: ", "))
                        .foregroundStyle(.gray.opacity(7))
                }
                
                // MARK: Plot Overview
                if let plotOverview = movie.plotOverview {
                    Text(plotOverview)
                        .font(.body)
                        .foregroundStyle(.black.opacity(0.9))
                }
                
                Spacer()
            }
            .background(.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(16)
        
    }
}

