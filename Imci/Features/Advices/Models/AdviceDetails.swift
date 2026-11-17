import Foundation

struct Advice {
    let title: String
    let subtitle: String
    let description: String
    let systemImageName: String
}

extension Advice {
    static let all: [Advice] = [
        Advice(
            title: "Alimentação",
            subtitle: "Hábitos alimentares saudáveis",
            description: "Priorize alimentos naturais, como frutas, verduras, grãos integrais e proteínas magras. Reduza o consumo de ultraprocessados e mantenha uma alimentação equilibrada, evitando dietas muito restritivas.",
            systemImageName: "carrot.fill"
        ),
        Advice(
            title: "Atividade Física",
            subtitle: "Movimento e qualidade de vida",
            description: "Pratique pelo menos 150 minutos semanais de atividade física moderada, como caminhada, dança ou ciclismo, conforme suas condições. Movimentar o corpo regularmente melhora a disposição e fortalece a saúde cardiovascular.",
            systemImageName: "figure.run"
        ),
        Advice(
            title: "Hidratação",
            subtitle: "A importância do consumo de água",
            description: "Beba água regularmente ao longo do dia e prefira água a bebidas açucaradas. Uma boa hidratação contribui para o funcionamento do organismo e ajuda a regular a temperatura corporal.",
            systemImageName: "drop.fill"
        ),
        Advice(
            title: "Sono",
            subtitle: "Descanso e recuperação do corpo",
            description: "Procure dormir entre 7 e 9 horas por noite, mantendo horários regulares. Um sono de qualidade favorece a recuperação do corpo, a concentração e o equilíbrio emocional.",
            systemImageName: "moon.fill"
        ),
        Advice(
            title: "Saúde Emocional",
            subtitle: "Equilíbrio entre corpo e mente",
            description: "Reserve momentos para relaxar, pratique atividades prazerosas e procure reconhecer situações de estresse. Cuide da sua relação com a alimentação e com o próprio corpo, evitando cobranças excessivas.",
            systemImageName: "brain.head.profile"
        ),
        Advice(
            title: "Acompanhamento",
            subtitle: "Cuidados e orientação profissional",
            description: "Consulte profissionais de saúde, como médicos, nutricionistas e educadores físicos, conforme suas necessidades. O acompanhamento profissional ajuda a estabelecer objetivos realistas e cuidados adequados à sua saúde.",
            systemImageName: "cross.case.fill"
        )
    ]
}
