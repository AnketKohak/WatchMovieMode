//
//  HTTPClient.swift
//  WatchMovieMode
//
//  Created by Anket Kohak on 22/01/25.
//

import Foundation
import Combine
// MARK: - Error Handling
enum NetworkError: Error {
    case badUrl
}

class HTTPClient {
    // MARK: - FetchingListOfItmes
    func fetchMovies() -> AnyPublisher<([Movie],[Movie]), Error> {
        // MARK: Movie
        let movieListUrl = "https://api.watchmode.com/v1/list-titles/?apiKey=0BrTP2xXJFMnopwvXknaCb04dixyY9RaxSnDpbZr&types=movie&limit=5"
        
        guard let url = URL(string: movieListUrl)
        else {
            return Fail(error: NetworkError.badUrl).eraseToAnyPublisher()
        }
        let session = URLSession.shared
        
        let moviePublisher = session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .map(\.titles)
            .receive(on: DispatchQueue.main)
            .catch { error -> AnyPublisher<[Movie], Error> in
                return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
        // MARK: Show
        let tvShowListUrl = "https://api.watchmode.com/v1/list-titles/?apiKey=0BrTP2xXJFMnopwvXknaCb04dixyY9RaxSnDpbZr&types=tv_series&limit=5"
        
        guard let url = URL(string: tvShowListUrl)
        else {
            return Fail(error: NetworkError.badUrl).eraseToAnyPublisher()
        }
        
        
        let tvShowListPublisher = session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .map(\.titles)
            .receive(on: DispatchQueue.main)
            .catch { error -> AnyPublisher<[Movie], Error> in
                return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
        
        
        return Publishers.Zip(moviePublisher, tvShowListPublisher).eraseToAnyPublisher()
    }
    
    // MARK: - FetchingItemDetail
    func fetchMovieDetail(id: Int) -> AnyPublisher<[MovieDetail], Error> {
        // MARK: MoiveDetail
        let movieDetailUrl = "https://api.watchmode.com/v1/title/\(id)/details/?apiKey=0BrTP2xXJFMnopwvXknaCb04dixyY9RaxSnDpbZr&append_to_response=sources"
        
        guard let url = URL(string: movieDetailUrl)
        else {
            return Fail(error: NetworkError.badUrl).eraseToAnyPublisher()
        }
        
        let session = URLSession.shared
        let movieDetailPublisher = session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieDetail.self, decoder: JSONDecoder())
            .map{
                MovieDetail in
                [MovieDetail]
            }
            .receive(on: DispatchQueue.main)
            .catch { error -> AnyPublisher<[MovieDetail], Error> in
                print("Decoding error: \(error)")
                return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
        return movieDetailPublisher
    }
    
    
}
