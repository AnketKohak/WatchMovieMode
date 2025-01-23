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
    func fetchMovies() -> AnyPublisher<[Movie], Error> {
        let movieListUrl = "https://api.watchmode.com/v1/list-titles/?apiKey=0BrTP2xXJFMnopwvXknaCb04dixyY9RaxSnDpbZr&types=movie&limit=1"
        
        guard let url = URL(string: movieListUrl)
        else {
            return Fail(error: NetworkError.badUrl).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .map(\.titles)
            .receive(on: DispatchQueue.main)
            .catch { error -> AnyPublisher<[Movie], Error> in
                return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    // MARK: - FetchingItemDetail
    func fetchMovieDetail(id: Int) -> AnyPublisher<[MovieDetail], Error> {
        
        let movieDetailUrl = "https://api.watchmode.com/v1/title/\(id)/details/?apiKey=0BrTP2xXJFMnopwvXknaCb04dixyY9RaxSnDpbZr&append_to_response=sources"
        
        guard let url = URL(string: movieDetailUrl)
        else {
            return Fail(error: NetworkError.badUrl).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
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
    }
    
    
}
