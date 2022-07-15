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
    
    let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=e0330d7c6c649fe9f0325ddea7eeae4f&language=en-US&page=1"
    guard let url = URL(string: urlString) else { return }

    URLSession.shared.dataTask(with: url) { (data, resp, err) in

      if let err = err {
        print("Failed to fetch apps:", err)
        completion([], nil)
        return
      }

      // success
//      print(data)
//      print(String(data: data!, encoding: .utf8))

      guard let data = data else { return }

      do {

        let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
        
        completion(movieResponse.results, nil)

      } catch let jsonErr {
        print("Failed to decode json:", jsonErr)
        completion([], jsonErr)
      }

    }.resume()

    
//    
//    Service.shared.fetchMovieDetail { (results, err) in
//
//      if let err = err {
//        print("Failed to fetch movies:", err)
//        return
//      }
//
//      self.movies = results
//      DispatchQueue.main.async {
//        self.collectionView.reloadData()
//      }
//    }
    
  }
  
//  func fetchMovieDetail(completion: @escaping(MovieResponse?, Error?) -> ()) {
//    let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=e0330d7c6c649fe9f0325ddea7eeae4f&language=en-US&page=1"
//
//    fetchGenericJSONData(urlString: urlString, completion: completion)
//  }
//
//  func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
//    guard let url = URL(string: urlString) else { return }
//    URLSession.shared.dataTask(with: url) { data, resp, err in
//      if let err = err {
//        completion(nil, err)
//        return
//      }
//      do {
//        let objects = try JSONDecoder().decode(T.self, from: data!)
//        // success
//        completion(objects, nil)
//      } catch {
//        completion(nil, error)
//      }
//    }.resume()
//  }
}
