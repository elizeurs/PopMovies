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
    var releaseDate: String?
    var overview: String?
    var poster_path: String?
    var genreIds: [GenreId]?
    var genres: [Genre]?
    
    enum CodingKeys: String, CodingKey {
      case id = "id"
      case title = "title"
      case releaseDate = "release_date"
      case overview = "overview"
      case poster_path = "poster_path"
      case genreIds = "genre_ids"
      case genres = "genres"
    }
    
    var posterPath: String {
      if let path = poster_path {
        return "http://image.tmdb.org/t/p/original/\(path)"
      } else {
        return ""
      }
    }
  }

