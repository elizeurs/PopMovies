//
//  MovieResponse.swift
//  PopMovies
//
//  Created by Elizeu RS on 14/07/22.
//

import Foundation

struct MovieResponse: Decodable {
  let results: [Movie]
}
  
  struct Movie: Decodable {
    var id: Int
    var title: String?
    var overview: String?
    var poster_path: String?
    var posterPath: String {
      if let path = poster_path {
        return "http://image.tmdb.org/t/p/original/\(path)"
      } else {
        return ""
      }
    }
  }

