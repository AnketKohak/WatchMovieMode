
//  MovieViewModel.swift
//  MoviesSwiftUI
//
//  Created by Anket Kohak on 20/01/25.
//
import SwiftUI
import Combine

class MovieViewModel: ObservableObject {
    // MARK: - Variables
    @Published var movies: [Movie] = []
    @Published var movieDetail: [MovieDetail] = []
    @Published var tvShows: [Movie] = []
    @Published var tvShowDetail: [MovieDetail] = []
    private let httpClient = HTTPClient()
    private var cancellables = Set<AnyCancellable>()
    @Published var isLoading: Bool = false
    @Published var error: String? = nil


    init() {
        loadMovies()
    }
    // MARK: - Movie
    private func loadMovies() {
        self.isLoading = true

        httpClient.fetchMovies()
            .sink(receiveCompletion: {[weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.isLoading = false

                    print("Error fetching movies: \(error)")
                case .finished:
                    self?.isLoading = false

                    break
                }
            }, receiveValue: { [weak self] movies,tvShows in
                self?.movies = movies
                self?.tvShows = tvShows
                self?.fetchAllMovies() // Fetch movie details only after movies are loaded
            })
            .store(in: &cancellables)
    }
    // MARK: - MovieDetail
     func loadMovieDetail(id: Int) {
         self.isLoading = true
        httpClient.fetchMovieDetail(id: id)
            .sink(receiveCompletion: {[weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.isLoading = false

                    print("Error fetching movie detail for ID \(id): \(error)")
                case .finished:
                    self?.isLoading = false

                    break
                }
            }, receiveValue: { [weak self] movieDetail in
                self?.movieDetail.append(contentsOf: movieDetail)
                
            })
            .store(in: &cancellables)
    }
    func loadtvShowDetail(id: Int) {
        self.isLoading = true
       httpClient.fetchMovieDetail(id: id)
           .sink(receiveCompletion: {[weak self] completion in
               switch completion {
               case .failure(let error):
                   self?.isLoading = false

                   print("Error fetching movie detail for ID \(id): \(error)")
               case .finished:
                   self?.isLoading = false

                   break
               }
           }, receiveValue: { [weak self] movieDetail in
               self?.tvShowDetail.append(contentsOf: movieDetail)
               
           })
           .store(in: &cancellables)
   }
    // MARK: - AllMoviesDetail
    private func fetchAllMovies() {
        movies.forEach { movie in
            loadMovieDetail(id: movie.id)
        }
        tvShows.forEach { tvShow in
            loadtvShowDetail(id: tvShow.id)
        }
    }
}

