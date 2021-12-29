//
//  MVC
//
//  Created by admin on 28/12/2021.
//

import UIKit

struct Film {
    var title:String
    var release_date: String
    var opening_crawl:String
    var director:String
}

class FilmsViewController: UITableViewController {
    
    var films : [Film] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        StarWarsModel.getAllFilms(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
                    data, response, error in
                        do {
                            // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                                if let result = jsonResult["results"] as? NSArray {
                                    for object in result {
                                        if let jObject = object as? NSDictionary{
                                            self.films.append(Film(title: jObject["title"]as! String,
                                                                   release_date: jObject["release_date"] as! String,
                                                                   opening_crawl: jObject["opening_crawl"] as! String, director: jObject["director"] as! String))
                                        }
                                    }
                                }
                            }
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        } catch {
                            print("Something went wrong")
                        }
                })
            }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        films.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellfilms", for: indexPath)
        cell.textLabel?.text = films[indexPath.row].title
        return cell
    }
    
    override func prepare(for segue : UIStoryboardSegue, sender: Any?){
        let filmVC = segue.destination as! FilmDetail
        guard let film = sender as? Film else{
            return
        }
        
        filmVC.film = film
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "FilmDetaulsVC", sender: films[indexPath.row])
    }

}

