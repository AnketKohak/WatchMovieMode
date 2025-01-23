
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
    private let httpClient = HTTPClient()
    private var cancellables = Set<AnyCancellable>()

    init() {
        loadMovies()
    }
    // MARK: - Movie
    private func loadMovies() {
        httpClient.fetchMovies()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching movies: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] movies in
                self?.movies = movies
                self?.fetchAllMovies() // Fetch movie details only after movies are loaded
            })
            .store(in: &cancellables)
    }
    // MARK: - MovieDetail
     func loadMovieDetail(id: Int) {
        httpClient.fetchMovieDetail(id: id)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching movie detail for ID \(id): \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] movieDetail in
                self?.movieDetail.append(contentsOf: movieDetail)
            })
            .store(in: &cancellables)
    }
    // MARK: - AllMoviesDetail
    private func fetchAllMovies() {
        movies.forEach { movie in
            loadMovieDetail(id: movie.id)
        }
    }
}

