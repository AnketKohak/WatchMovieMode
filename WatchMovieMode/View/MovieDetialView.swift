//
//  MovieDetialView.swift
//  WatchMovieMode
//
//  Created by Anket Kohak on 22/01/25.
//

import SwiftUI

struct MovieDetialView: View {
    // MARK: - Varible
    @StateObject var viewModel = MovieViewModel()
    let movieId:Int
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
        if let movie = viewModel.movieDetail.first(where:{ $0.id == movieId}) {
            VStack(spacing: 14){
                // MARK: PosterImage
                if let url = URL(string: movie.posterMedium!){
                    
                    AsyncImage(url: url) { image in
                        image.resizable().scaledToFit()
                            .cornerRadius(12)
                    } placeholder: {
                        ProgressView()
                    }.frame(height: 400)
                        .clipped()
                }
                HStack{
                    // MARK: OriginalTitle
                    Text(movie.originalTitle!)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .lineLimit(2)
                    Spacer()
                    // MARK: runtime_minutes
                    Text("\(movie.runtime_minutes!)  min")
                        .foregroundStyle(.black)
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                    // MARK: userRating
                    Text(movie.userRating!.toString())
                        .foregroundStyle(.black)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(4)
                        .background(.yellow)
                        .cornerRadius(12)
                }
                HStack{
                    // MARK: releaseDate
                    Text("\(movie.releaseDate!)")
                        .foregroundStyle(.black)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                    // MARK: originalLanguage
                    Text(getLanguageName(from: movie.originalLanguage!))
                        .font(.title3)
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                }
                // MARK: genreNames
                Text("\(movie.genreNames!.map{ $0.capitalized}.joined(separator: ","))").foregroundStyle(.gray.opacity(7))
                // MARK: plotOverview
                Text(movie.plotOverview!)
                    .font(.body)
                    .foregroundStyle(.black.opacity(0.9))
                Spacer()
            }.background(.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(16)
        }
    }
}

#Preview {
    MovieDetialView(movieId: 1498670)
}
