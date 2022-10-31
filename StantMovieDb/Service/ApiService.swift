//
//  ApiService.swift
//  StantMovieDb
//
//  Created by GDX on 31/10/22.
//

import Foundation

struct ApiService {
    
    private let apiKey = "f321a808e68611f41312aa8408531476"
    
    func fetchMovies(page: Int = 1, onSuccess: @escaping ([Movie]) -> Void, onError: @escaping (Error) -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/4/list/1"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
        ]
        guard let url = components.url else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let existentError = error {
                onError(existentError)
            }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                let apiResult = try decoder.decode(ApiResult.self, from: data)
                let movies = apiResult.results ?? []
                DispatchQueue.main.async {
                    onSuccess(movies)
                }
            } catch {
                onError(error)
            }
        }
        
        task.resume()
    }
}
