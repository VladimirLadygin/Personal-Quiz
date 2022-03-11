//
//  QuestionViewController.swift
//  Personal Quiz
//
//  Created by Владимир Ладыгин on 10.03.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multiplyStackView: UIStackView!
    @IBOutlet weak var rangeStackView: UIStackView!
    
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        //        singleStackView.isHidden = true
        //        multiplyStackView.isHidden = true
        //        rangeStackView.isHidden = true
        
        for stackView in [singleStackView, multiplyStackView, rangeStackView] {
            stackView?.isHidden = true
        }
        
        let question = Question.all[questionIndex]
        
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        
        
        switch question.type{
        case .single:
            singleStackView.isHidden = false
        case .multiple:
            multiplyStackView.isHidden = false
        case .range:
            rangeStackView.isHidden = false
        }

    }
    
    
}
