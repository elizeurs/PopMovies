//
//  MovieCell.swift
//  PopMovies
//
//  Created by Elizeu RS on 14/07/22.
//

import UIKit
import SDWebImage

class MovieCell: UICollectionViewCell {
  
  // MARK: - Properties
  
  var movie: Movie! {
    didSet {
      imageView.sd_setImage(with: URL(string: movie.posterPath))
      nameLabel.text = movie?.title
    }
  }
  
  let imageView: UIImageView = {
    let iv = UIImageView()
//    iv.backgroundColor = .red
    iv.layer.cornerRadius = 20
    iv.clipsToBounds = true
    iv.contentMode = .scaleAspectFit

    return iv
  }()
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    label.text = "The Best Movie Ever"
//    label.backgroundColor = .black
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    label.adjustsFontSizeToFitWidth = true
    label.textAlignment = .center
//    label.layer.cornerRadius = 10
//    label.clipsToBounds = true

    return label
  }()
  
  
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureViewComponents()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Helper Functions
  
  func configureViewComponents() {
    self.layer.cornerRadius = 20
    self.clipsToBounds = true
    
    addSubview(imageView)
    imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 200)
    
    addSubview(nameLabel)
    nameLabel.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: -8, paddingLeft: 0, paddingBottom: 30, paddingRight: 0, width: 0, height: 60)
  }
}
