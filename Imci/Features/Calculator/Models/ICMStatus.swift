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
    
    
    var title: String {
        switch self {
        case .underweight:
            return "(abaixo do peso)"
        case .normal:
            return "(normal)"
        case .overweight:
            return "(sobrepeso)"
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
        }
    }

    
    static func from(imc: Double) -> IMCStatus {
        
        switch imc {
        case ..<18.5:
            return .underweight
            
        case 18.5..<25:
            return .normal
            
        default:
            return .overweight
        }
    }
}

extension IMCStatus {
    var displayColor: UIColor {
            switch self {
            case .underweight:
                return .blue
            case .normal:
                return .primary
            case .overweight:
                return .red
            }
    }
}
