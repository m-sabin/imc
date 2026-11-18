//
//  Enums.swift
//  Imci
//
//  Created by sabin  on 12/11/26.
//

import UIKit

enum IMCStatus {
    case underweight
    case normal
    case overweight
    case obesity
    case severeObesity

    var title: String {
        switch self {
        case .underweight:
            return "(magreza)"
        case .normal:
            return "(normal)"
        case .overweight:
            return "(sobrepeso)"
        case .obesity:
            return "(obesidade)"
        case .severeObesity:
            return "(obesidade grave)"
        }
    }

    var description: String {
        switch self {
        case .underweight:
            return
                "Seu IMC está abaixo da faixa considerada adequada para adultos. Manter uma alimentação equilibrada e buscar orientação profissional pode ajudar você a entender melhor as necessidades do seu corpo."
        case .normal:
            return
                "Seu IMC está dentro da faixa considerada adequada para adultos! Continue cuidando da sua saúde com uma alimentação equilibrada, atividades físicas e hábitos saudáveis."

        case .overweight:
            return
                "Seu IMC está acima da faixa considerada adequada para adultos. Pequenas mudanças na rotina podem contribuir para seu bem-estar. Considere buscar orientação profissional para cuidar da sua saúde de forma individualizada."

        case .obesity:
            return
                "Seu IMC está na faixa classificada como obesidade para adultos. Esse resultado pode indicar riscos aumentados à saúde, mas não define sozinho sua condição física. Buscar orientação profissional pode ajudar você a compreender melhor suas necessidades e adotar hábitos saudáveis de forma gradual."

        case .severeObesity:
            return
                "Seu IMC está na faixa classificada como obesidade grave para adultos. Essa condição pode estar associada a riscos mais elevados à saúde e merece atenção especial. Procure acompanhamento médico e nutricional para uma avaliação individualizada e orientações adequadas às suas necessidades."

        }
    }

    static func from(imc: Double) -> IMCStatus {

        switch imc {
        case ..<18.5:
            return .underweight

        case 18.5..<24, 9:
            return .normal

        case 25..<29.9:
            return .overweight

        case 30..<39.9:
            return .obesity

        default:
            return .severeObesity
        }
    }
}

extension IMCStatus {
    var displayColor: UIColor {
        switch self {
        case .underweight:
            return .systemBlue

        case .normal:
            return .systemGreen

        case .overweight:
            return .systemYellow

        case .obesity:
            return .systemOrange

        case .severeObesity:
            return .systemRed
        }
    }
}
