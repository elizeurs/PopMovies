//
//  Service.swift
//  PopMovies
//
//  Created by Elizeu RS on 14/07/22.
//

import Foundation

class Service {
  
  static let shared = Service()
  
  func fetchMovies(completion: @escaping ([Movie], Error?) -> ()) {
    
    let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=\(API.key)&language=en-US&page=1"
    guard let url = URL(string: urlString) else { return }

    URLSession.shared.dataTask(with: url) { (data, resp, err) in

      if let err = err {
        print("Failed to fetch apps:", err)
        completion([], nil)
        return
      }

      guard let data = data else { return }

      do {

        let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
        
        completion(movieResponse.results, nil)

      } catch let jsonErr {
        print("Failed to decode json:", jsonErr)
        completion([], jsonErr)
      }

    }.resume()
    
  }
}
