
//  MovieViewModel.swift
//  MoviesSwiftUI
//
//  Created by Anket Kohak on 20/01/25.
//

import SwiftUI
import Combine

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var searchText: String = ""
    @Published var movieDetail: [MovieDetail] = []
    private let httpClient: HTTPClient
    private var cancellables = Set<AnyCancellable>()
    
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
        loadMovies()
    }
    
    
    private func loadMovies() {
        httpClient.fetchMovies()
            .sink { _ in } receiveValue: { [weak self] movies in
                
                self?.movies = movies
                
                
               
            }
            .store(in: &cancellables)
    }
     func loadMovieDetail(id : Int) {
        httpClient.fetchMovieDetail(id: id)
            .sink { _ in } receiveValue: { [weak self] movieDetail in
                self?.movieDetail = movieDetail
               print(movieDetail)
                
            }
            .store(in: &cancellables)
    }
    
    
    
}
