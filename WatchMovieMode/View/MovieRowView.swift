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
        HStack(alignment: .top){
            // MARK: poster
            if let url = URL(string: movie.poster!){
                AsyncImage(url: url) { image in
                    image.resizable().scaledToFill()
                        .aspectRatio(2/3, contentMode: .fit)
                        .cornerRadius(12)
                } placeholder: {
                    ProgressView()
                }.frame(height: 150)
                    .clipped()
            }
            VStack(alignment: .leading){
                HStack{
                    // MARK: originalTitle
                    Text(movie.originalTitle!)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .lineLimit(2)
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
                HStack{
                    // MARK: genreNames
                    Text("\(movie.genreNames!.map{ $0.capitalized}.joined(separator: ","))").foregroundStyle(.gray.opacity(7))
                }
                // MARK: runtime_minutes
//                Text("\(movie.runtime_minutes!)  min")
//                    .foregroundStyle(.black)
//                    .font(.title)
//                    .fontWeight(.semibold)
            }
            
        }.padding(2)
            .background(.gray.opacity(0.3)).cornerRadius(12)
    }
}


