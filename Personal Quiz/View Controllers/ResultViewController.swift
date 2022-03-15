//
//  ResultViewController.swift
//  Personal Quiz
//
//  Created by Владимир Ладыгин on 13.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let answers: [Answer]
    
    init?(coder: NSCoder, answers: [Answer]) {
        self.answers = answers
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func calculatePersonalityResult() {
        let frequencyOfAnswers = answers.reduce(into: [:]) { counts, answer in
            counts[answer.type, default: 0] += 1
        }
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.value > $1.value }.first!.key
        updateUI(with: mostCommonAnswer)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
    }
    func updateUI(with animal: AnimalType) {
        animalLabel.text = "\(animal.rawValue)"
        descriptionLabel.text = animal.definition
    }
}
