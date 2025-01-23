//
//  MovieView.swift
//  WatchMovieMode
//
//  Created by Anket Kohak on 22/01/25.
//

import SwiftUI

struct MovieView: View {
    // MARK: -Variable
    @StateObject var viewModel = MovieViewModel()
    // MARK: - Body
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(alignment: .leading, spacing: 8){
                    ForEach(viewModel.movieDetail,id:\.id){
                        movie in
                        NavigationLink{
                            MovieDetialView(movieId: movie.id!)
                        }label:{
                            MovieRowView(movie: movie)
                        }
                    }
                }.padding()
            }.background(.gray.opacity(0.2))
        }
    }
    
}


#Preview {
    MovieView()
}
