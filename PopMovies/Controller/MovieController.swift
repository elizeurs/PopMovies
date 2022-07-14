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
  
  // MARK: - Init
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewComponents()
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
    return 6
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCell
    cell.backgroundColor = .black
    return cell
  }
}

extension MovieController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let width = (view.frame.width - 36) / 2
    return CGSize(width: width, height: 300)
  }
}
