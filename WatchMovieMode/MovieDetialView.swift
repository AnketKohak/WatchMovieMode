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
    var body: some View {
        VStack{
            List(viewModel.movieDetail){
                movie in
                Text(movie.originalLanguage)
                
            }
           
        }.onAppear{
            viewModel.loadMovieDetail(id: movieId)
            
        }
    }
}

#Preview {
    MovieDetialView(movieId: 1)
}
