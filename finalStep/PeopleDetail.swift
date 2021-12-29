//
//  FilmDetail.swift
//  finalStep
//
//  Created by admin on 29/12/2021.
//

import UIKit

class PeopleDetail : UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var mass: UILabel!

    
    var person: Person?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        if let realPerson = person {
            name.text = "Name: \(realPerson.name)"
            gender.text = "Gender: \(realPerson.gender)"
            age.text = "Year: \(realPerson.year)"
            mass.text = "Mass: \(realPerson.mass)"
        }
    }
}
