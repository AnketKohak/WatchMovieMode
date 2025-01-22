//
//  MovieRowView.swift
//  WatchMovieMode
//
//  Created by Anket Kohak on 22/01/25.
//

import SwiftUI

struct MovieRowView: View {
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
        // Add more as needed
    ]
    func getLanguageName(from code: String) -> String {
        return languageMapping[code] ?? "Unknown Language"
    }
    
    var body: some View {
        
        
        HStack(alignment: .top){
            
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
                    Text(movie.originalTitle!)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .lineLimit(2)
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
                HStack{
                    Text("\(movie.genreNames!.map{ $0.capitalized}.joined(separator: ","))").foregroundStyle(.gray.opacity(7))
                    
                }
                Text("\(movie.runtime_minutes!)  min")
                    .foregroundStyle(.black)
                    .font(.title)
                    .fontWeight(.semibold)
                
              
                
                
            }
            
        }.padding(2)
            .background(.gray.opacity(0.3)).cornerRadius(12)
        
    }
}


extension MovieRowView{
    
    
}

