//
//  MovieRowView.swift
//  WatchMovieMode
//
//  Created by Anket Kohak on 22/01/25.
//

import SwiftUI

struct MovieRowView: View {
    // MARK: Varible
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
        HStack(alignment: .top) {
            // MARK: poster
            if let posterURL = movie.poster, let url = URL(string: posterURL) {
                AsyncImage(url: url) { image in
                    image.resizable().scaledToFill()
                        .aspectRatio(2/3, contentMode: .fit)
                        .cornerRadius(12)
                } placeholder: {
                    ProgressView()
                }.frame(height: 150)
                    .clipped()
            }
            
            VStack(alignment: .leading) {
                HStack(alignment: .firstTextBaseline) {
                    // MARK: originalTitle
                    if let originalTitle = movie.originalTitle {
                        Text(originalTitle)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                            .lineLimit(2)
                            .minimumScaleFactor(0.4)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Spacer()
                    
                    // MARK: userRating
                    if let userRating = movie.userRating {
                        Text(userRating.toString())
                            .foregroundStyle(.black)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(2)
                            .background(.yellow)
                            .cornerRadius(12)
                    }
                }
                
                HStack {
                    // MARK: releaseDate
                    if let releaseDate = movie.releaseDate {
                        Text("\(releaseDate)")
                            .foregroundStyle(.black)
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    
                    Spacer()
                    
                    // MARK: originalLanguage
                    if let originalLanguage = movie.originalLanguage {
                        Text(getLanguageName(from: originalLanguage))
                            .font(.title3)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                    }
                }
                
                HStack {
                    // MARK: genreNames
                    if let genreNames = movie.genreNames {
                        Text("\(genreNames.map { $0.capitalized }.joined(separator: ", "))")
                            .foregroundStyle(.gray.opacity(7))
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                    }
                }
                
//                 MARK: runtime_minutes
                if let runtimeMinutes = movie.runtime_minutes {
                    Text("\(runtimeMinutes) min")
                        .foregroundStyle(.black)
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
        }
        .padding(2)
        .background(.gray.opacity(0.3))
        .cornerRadius(12)
    }
}
