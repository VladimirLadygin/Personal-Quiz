//
//  AnimalType.swift
//  Personal Quiz
//
//  Created by Владимир Ладыгин on 11.03.2022.
//

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case fox = "🦊"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вы нереально активны, дружелюбны и окружаете себя людьми, которых вы любите."
        case .cat:
            return "Вы индивидуалист и немного социопат. Готовы на многое за комфорт и хорошую пищу."
        case .rabbit:
            return "Вы гедонист и хороший семьянин."
        case .fox:
            return "Вы хитрый и расчётливый человек, и если вам не удастся добиться своего напрямую, вы найдёте тысячи обходных путей"
        }
    }
}

