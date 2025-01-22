//
//  HTTPClient.swift
//  WatchMovieMode
//
//  Created by Anket Kohak on 22/01/25.
//

import Foundation
import Combine

enum NetworkError: Error {
    case badUrl
}

class HTTPClient {
    
    func fetchMovies() -> AnyPublisher<[Movie], Error> {
        let baseurl = "https://api.watchmode.com/v1/list-titles/?apiKey=4W91729MO3Pgl5FrkwfLQMD6xN9lsJFvMviVSv6g&types=movie"
        guard let url = URL(string: baseurl)
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
    func fetchMovieDetail(id: Int) -> AnyPublisher<[MovieDetail], Error> {
        let baseurl =         "https://api.watchmode.com/v1/title/\(id)/details/?apiKey=4W91729MO3Pgl5FrkwfLQMD6xN9lsJFvMviVSv6g&append_to_response=sources"

        guard let url = URL(string: baseurl)
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
