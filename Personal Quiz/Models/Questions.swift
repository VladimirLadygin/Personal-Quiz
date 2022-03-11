//
//  Questions.swift
//  Personal Quiz
//
//  Created by Владимир Ладыгин on 10.03.2022.
//

struct Question {
    let text: String
    let type: ResponseType
    let answers: [Answer]
    
    static let all: [Question] = [
        Question(text: "Какую еду вы предпочитаете?", type: .single, answers: [
            Answer(text: "Мясо", type: .dog),
            Answer(text: "Рыбу", type: .cat),
            Answer(text: "Капусту", type: .rabbit),
            Answer(text: "Курицу", type: .fox)]),
        Question(text: "Как вы любите проводить свободное время?", type: .multiple, answers: [
            Answer(text: "Бегать", type: .dog),
            Answer(text: "Спать", type: .cat),
            Answer(text: "Трахаться", type: .rabbit),
            Answer(text: "Играть", type: .fox)]),
        Question(text: "Вы любите путешествовать?", type: .range, answers: [
            Answer(text: "Ненавижу", type: .cat),
            Answer(text: "Боюсь", type: .fox),
            Answer(text: "Равнодушен", type: .rabbit),
            Answer(text: "Обожаю", type: .dog)]),
    ]
}
