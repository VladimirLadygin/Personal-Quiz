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
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet var rangeLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    var currentAnswers: [Answer] {
        Question.all[questionIndex].answers
    }
    
    var currentQuestion: Question {
        Question.all[questionIndex]
    }

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
            for (button, answer) in zip(singleAnswerButtons, currentAnswers) {
                button.setTitle(answer.text, for: [])
            }
        }
        
        func updateMultipleStack() {
            multiplyStackView.isHidden = false
            for (label, answer) in zip(multipleLabels, currentAnswers) {
                label.text = answer.text
            }
        }
        
        func updateRangeStack() {
            rangeLabels.first?.text = currentAnswers.first?.text
            rangeLabels.last?.text = currentAnswers.last?.text
            rangeStackView.isHidden = false
            rangedSlider.maximumValue = Float(currentAnswers.count) - 0.01
            rangedSlider.value = rangedSlider.maximumValue / 2
            
        }
        
        
        let totalProgress = Float(questionIndex) / Float(Question.all.count)
       
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        progress.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type{
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
        updateUI()
    }
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let answers = Question.all[questionIndex].answers
        let index = sender.tag
        guard 0 <= index && index < answers.count else {
            return
        }
    
        let answer = answers[index]
        answerChoosen.append(answer)
        nextQuestion()
    }
    
    @IBAction func multiButtonPressed( sender: UIButton) {
        for (index, multiSwitch) in multipleSwitches.enumerated() {
            if multiSwitch.isOn && index < currentAnswers.count {
                let answer = currentAnswers[index]
                answerChoosen.append(answer)
            }
        }
        nextQuestion()
        
        
    }
    
    @IBAction func rangedButtonPressed() {
       let index = Int(rangedSlider.value)
        if index < currentAnswers.count {
            let answer = currentAnswers[index]
            answerChoosen.append(answer)
        }
    }
}
