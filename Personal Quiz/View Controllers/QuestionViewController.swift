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
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var singleAnswerButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet var rangeLabels: [UILabel]!
    
    
    var answerChoosen = [Answer]() {
        didSet {
            print(#line, #function, answerChoosen)
        }
    }
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
        func updateSingleStack() {
            singleStackView.isHidden = false
            for (index, button) in singleAnswerButtons.enumerated() {
                button.setTitle(nil, for: [])
                button.tag = index
            }
            for (button, answer) in zip(singleAnswerButtons, answers) {
                button.setTitle(answer.text, for: [])
            }
        }
        
        func updateMultipleStack() {
            multiplyStackView.isHidden = false
            for (label, answer) in zip(multipleLabels, answers) {
                label.text = answer.text
            }
        }
        
        func updateRangeStack() {
            rangeLabels.first?.text = answers.first?.text
            rangeLabels.last?.text = answers.last?.text
            rangeStackView.isHidden = false
            
        }
        let question = Question.all[questionIndex]
        
        
        let qoestion = Question.all[questionIndex]
        let answers = question.answers
        let totalProgress = Float(questionIndex) / Float(Question.all.count)
       
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        questionLabel.text = question.text
        progress.setProgress(totalProgress, animated: true)
        
        switch question.type{
        case .single:
            updateSingleStack()
        case .multiple:
            updateMultipleStack()
        case .range:
            updateRangeStack()
        }
       
    }
    
    func nextQuestion() {
        questionIndex = (questionIndex + 1) % Question.all.count
    }
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let answers = Question.all[questionIndex].answers
        let index = sender.tag
        guard 0 <= index && index < answers.count else {
            return
        }
    
        let answer = answers[index]
        answerChoosen.append(answer)
//        nextQuestion()
    }
    
}
