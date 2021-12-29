//
//  FilmDetail.swift
//  finalStep
//
//  Created by admin on 29/12/2021.
//

import UIKit

class FilmDetail : UIViewController {
    
    @IBOutlet weak var filmTitle:UILabel!
    @IBOutlet weak var filmDir:UILabel!
    @IBOutlet weak var filmRelaseDate:UILabel!
    @IBOutlet weak var filmCrawl:UILabel!
    
    var film : Film?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        if let realFilm = film {
            filmTitle.text = "Title: \(realFilm.title)"
            filmDir.text = "Director: \(realFilm.director)"
            filmRelaseDate.text = "ReleaseDate: \(realFilm.release_date)"
            filmCrawl.text = "Crawl: \(realFilm.opening_crawl)"
        }
    }
}
