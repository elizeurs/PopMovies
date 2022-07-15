//
//  MovieDetailController.swift
//  PopMovies
//
//  Created by Elizeu RS on 15/07/22.
//

import UIKit
import SDWebImage

class MovieDetailController: UIViewController {
  
  // MARK: - Properties
  
  var movie: Movie? {
    didSet {
      navigationItem.title = movie?.title?.capitalized
      imageView.sd_setImage(with: URL(string: movie?.posterPath ?? "" ))
      nameLabel.text = movie?.title
      overviewLabel.text = movie?.overview
      
      
      guard let year = movie?.releaseDate else { return }
      guard let genre = movie?.genreIds else { return }
      
      configureLabel(label: yearLabel, title: "Release Date", details: "\(year)")
      configureLabel(label: genreLabel, title: "Genre", details: "\(genre)")
      }
    }
  
  let imageView: UIImageView = {
    let iv = UIImageView()
    iv.layer.cornerRadius = 20
    iv.clipsToBounds = true
    iv.contentMode = .scaleAspectFit
    return iv
  }()
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
    label.text = "The Best Movie Ever"
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    label.adjustsFontSizeToFitWidth = true
    label.textAlignment = .center

    return label
  }()
  
  let yearLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.numberOfLines = 0
    return label
  }()
  
  let genreLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.numberOfLines = 0
    return label
  }()
  
  let overviewLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14)
    label.numberOfLines = 0
    label.textAlignment = .justified
    return label
  }()
  
  
  // MARK: - Init
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureViewComponents()
  }
  
  // MARK: - Helper Functions
  func configureViewComponents() {
    

    view.backgroundColor = .silver()
    navigationController?.navigationBar.prefersLargeTitles = false
    
    
    view.addSubview(imageView)
    imageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 64, paddingBottom: 0, paddingRight: 64, width: 200, height: 390)
    
    view.addSubview(nameLabel)
    nameLabel.anchor(top: imageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
    
    view.addSubview(yearLabel)
    yearLabel.anchor(top: nameLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
    
    view.addSubview(genreLabel)
    genreLabel.anchor(top: yearLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
    
    view.addSubview(overviewLabel)
    overviewLabel.anchor(top: genreLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)

  }
  
  func configureLabel(label: UILabel, title: String, details: String) {
    let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: "\(title):  \n", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]))
    attributedText.append(NSAttributedString(string: "\(details)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.darkGray]))
      label.attributedText = attributedText

  }

}
