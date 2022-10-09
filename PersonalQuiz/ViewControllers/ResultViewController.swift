//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Denis on 2022/10/08.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var personAnimal: UILabel!
    @IBOutlet var animalDescription: UILabel!
    
    var userAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        defineAnAnimal()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func defineAnAnimal() {
        
        var someAnimals: [Animal] = []
        
        for answer in userAnswers {
            someAnimals.append(answer.animal)
        }
        
        let animalCount = someAnimals.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        
        if let (value, _) = animalCount.max(by: { $0.1 < $1.1 }) {
            if value == .dog {
                personAnimal.text = "Вы - 🐶"
                animalDescription.text = value.definition
            } else if value == .cat {
                personAnimal.text = "Вы - 🐱"
                animalDescription.text = value.definition
            } else if value == .rabbit {
                personAnimal.text = "Вы - 🐰"
                animalDescription.text = value.definition
            } else if value == .turtle {
                personAnimal.text = "Вы - 🐢"
                animalDescription.text = value.definition
            }
        }
    }
}
