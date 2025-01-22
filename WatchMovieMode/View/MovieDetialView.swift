//
//  MovieDetialView.swift
//  WatchMovieMode
//
//  Created by Anket Kohak on 22/01/25.
//

import SwiftUI

struct MovieDetialView: View {
    @StateObject var viewModel = MovieViewModel(httpClient: HTTPClient())
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
        // Add more as needed
    ]
    func getLanguageName(from code: String) -> String {
        return languageMapping[code] ?? "Unknown Language"
    }
    var body: some View {
        if let movie = viewModel.movieDetail.first(where:{ $0.id == movieId}) {
            VStack(spacing: 14){
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
                    Text(movie.originalTitle!)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .lineLimit(2)
                    Spacer()
                    Text("\(movie.runtime_minutes!)  min")
                        .foregroundStyle(.black)
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(movie.userRating!.toString())
                        .foregroundStyle(.black)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(4)
                        .background(.yellow)
                        .cornerRadius(12)
                    
                }
                HStack{
                    Text("\(movie.releaseDate!)")
                        .foregroundStyle(.black)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(getLanguageName(from: movie.originalLanguage!))
                        .font(.title3)
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                    
                }
                Text("\(movie.genreNames!.map{ $0.capitalized}.joined(separator: ","))").foregroundStyle(.gray.opacity(7))
                
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
