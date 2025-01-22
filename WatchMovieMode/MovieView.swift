//
//  MovieView.swift
//  WatchMovieMode
//
//  Created by Anket Kohak on 22/01/25.
//

import SwiftUI

struct MovieView: View {
    @StateObject var viewModel = MovieViewModel(httpClient: HTTPClient())
   
    var body: some View {
        List(viewModel.movieDetail){
            movie in
            
            Text(movie.originalTitle)
            
            
        }
        
    }
}

#Preview {
    MovieView()
}
