//
//  MovieController.swift
//  PopMovies
//
//  Created by Elizeu RS on 14/07/22.
//

import UIKit

private let reuseIdentifier = "MovieCell"

class MovieController: UICollectionViewController {
  
  // MARK: - Properties
  
  var movies = [Movie]()
  
  // MARK: - Init
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewComponents()
    fetchData()
  }
  
  // MARK: - API

  func fetchData() {
    Service.shared.fetchMovies { (results, err) in
      
      if let err = err {
        print("Failed to fetch apps:", err)
        return
      }
      
      self.movies = results
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
  }
  
  // MARK: - Helper Functions
  func configureViewComponents() {
    collectionView.backgroundColor = .silver()

    navigationController?.navigationBar.backgroundColor = .silver()
    navigationController?.navigationBar.barStyle = .default
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "PopMovies"
    
    collectionView.register(MovieCell.self, forCellWithReuseIdentifier: reuseIdentifier)
  }
}

extension MovieController {
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    return 6
    return movies.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCell
    cell.movie = self.movies[indexPath.item]
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let controller = MovieDetailController()
    controller.movie = movies[indexPath.row]
    navigationController?.pushViewController(controller, animated: true)
  }
}

extension MovieController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 16, left: 8, bottom: 32, right: 8)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let width = (view.frame.width - 28) / 2
    return CGSize(width: width, height: 350)
  }
}
