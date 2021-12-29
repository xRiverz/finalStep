//
//  ViewController.swift
//  MVC
//
//  Created by admin on 28/12/2021.
//

import UIKit

struct Person {
    var name : String
    var gender : String
    var year : String
    var mass : String
}

class PeopleViewController: UITableViewController {
    
    var peoples : [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        StarWarsModel.getAllPeople(completionHandler: {
                    data, response, error in
                        do {
                            // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                                if let results = jsonResult["results"] as? NSArray {
                                    for person in results {
                                        if let jObject = person as? NSDictionary{
                                        self.peoples.append(Person(name: jObject["name"]as! String,
                                                               gender: jObject["gender"] as! String,
                                                               year: jObject["birth_year"] as! String,
                                                            mass : jObject["mass"] as! String))
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
        peoples.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellpeople", for: indexPath)
        cell.textLabel?.text = peoples[indexPath.row].name
        return cell
    }
    
    override func prepare(for segue : UIStoryboardSegue, sender: Any?){
        let peopleVC = segue.destination as! PeopleDetail
        guard let person = sender as? Person else{
            return
        }
        
        peopleVC.person = person
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PeopleDetailsVC", sender: peoples[indexPath.row])
    }

}
