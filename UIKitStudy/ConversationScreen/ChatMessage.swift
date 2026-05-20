//
//  ChatMessage.swift
//  UIKitStudy
//
//  Created by Joao pedro Leonel on 20/05/26.
//

import Foundation

struct ChatMessage: Identifiable, Hashable {
    enum Sender { case me, them }

    let id = UUID()
    let sender: Sender
    let text: String
    let time: String
}

enum ChatMockData {
    static func conversation(for contactName: String) -> [ChatMessage] {
        switch contactName {
        case "Neymar.Jr":   return neymarConversation
        case "Ancelotti":   return ancelottiConversation
        case "Neneca":      return nenecaConversation
        case "Tigas Silva": return thiagoSilvaConversation
        case "SIIUU":       return cr7Conversation
        case "Etezinho":    return messiConversation
        case "Protagonista":return yuriAlbertoConversation
        case "NeyPai":      return neyPaiConversation
        default:            return docBrownConversation
        }
    }

    // MARK: - Neymar Jr
    static let neymarConversation: [ChatMessage] = [
        ChatMessage(sender: .them, text: "Mano, viu a lista do Ancelotti?", time: "19:00"),
        ChatMessage(sender: .me,   text: "Vi sim! Tu tá dentro, parabéns irmão 🇧🇷", time: "19:01"),
        ChatMessage(sender: .them, text: "Cara, voltar pra seleção depois dessa lesão não tem preço", time: "19:01"),
        ChatMessage(sender: .me,   text: "Te falei que ia te chamar! Confia no processo", time: "19:02"),
        ChatMessage(sender: .them, text: "Agora é focar na Copa. Quero levantar essa taça 🏆", time: "19:02"),
        ChatMessage(sender: .me,   text: "Vai dar tudo certo. O Brasil precisa de ti em campo", time: "19:03"),
        ChatMessage(sender: .them, text: "Bora fazer história mais uma vez", time: "19:03"),
        ChatMessage(sender: .me,   text: "Conta comigo na torcida sempre 💚💛", time: "19:04"),
    ]

    // MARK: - Ancelotti
    static let ancelottiConversation: [ChatMessage] = [
        ChatMessage(sender: .them, text: "Buongiorno! Tudo bem aí?", time: "10:00"),
        ChatMessage(sender: .me,   text: "Tudo ótimo Mister! Como tá a preparação pra Copa?", time: "10:02"),
        ChatMessage(sender: .them, text: "A lista de convocados está pronta. Anunciamos amanhã.", time: "10:03"),
        ChatMessage(sender: .me,   text: "Pode adiantar alguma surpresa? 👀", time: "10:03"),
        ChatMessage(sender: .them, text: "Tem nome novo sim. Time competitivo, mistura de experiência e juventude.", time: "10:05"),
        ChatMessage(sender: .me,   text: "Tudo nosso, nada deles!", time: "10:05"),
        ChatMessage(sender: .them, text: "Esse é o espírito. Vamos buscar o hexa com muito trabalho.", time: "10:06"),
        ChatMessage(sender: .me,   text: "Confiamos no senhor Mister 🙌", time: "10:07"),
    ]

    // MARK: - Neneca / Hugo Souza
    static let nenecaConversation: [ChatMessage] = [
        ChatMessage(sender: .them, text: "MANO FUI CONVOCADO!!! 🥹", time: "14:10"),
        ChatMessage(sender: .me,   text: "AEEEEE NENECA!!! Merecidíssimo irmão!", time: "14:10"),
        ChatMessage(sender: .them, text: "Não tô acreditando ainda, primeira convocação pra Copa", time: "14:11"),
        ChatMessage(sender: .me,   text: "Tu tá voando no Corinthians, era questão de tempo", time: "14:11"),
        ChatMessage(sender: .them, text: "Obrigado pelo apoio irmão 🙏", time: "14:12"),
        ChatMessage(sender: .me,   text: "Agora é treinar firme e brigar pela titularidade", time: "14:12"),
        ChatMessage(sender: .them, text: "Pode deixar, vou dar minha vida em cada treino", time: "14:13"),
        ChatMessage(sender: .me,   text: "Vai com tudo! Tô na torcida 💪", time: "14:13"),
    ]

    // MARK: - Thiago Silva
    static let thiagoSilvaConversation: [ChatMessage] = [
        ChatMessage(sender: .them, text: "Fala meu querido, tudo certo?", time: "11:20"),
        ChatMessage(sender: .me,   text: "Tudo ótimo Monstro! E o Mister te convocou?", time: "11:21"),
        ChatMessage(sender: .them, text: "Sim, mais uma Copa pela frente se Deus quiser 🙏", time: "11:21"),
        ChatMessage(sender: .me,   text: "Pendurar a chuteiras né! Mas antes a taça 🏆", time: "11:22"),
        ChatMessage(sender: .them, text: "Kkkkk ainda não capitão, ainda tenho lenha pra queimar", time: "11:22"),
        ChatMessage(sender: .me,   text: "Liderança sua é fundamental nesse grupo", time: "11:23"),
        ChatMessage(sender: .them, text: "Vou passar minha experiência pra molecada, é minha missão", time: "11:23"),
        ChatMessage(sender: .me,   text: "Brasil precisa de ti capitão 💚", time: "11:24"),
    ]

    // MARK: - CR7
    static let cr7Conversation: [ChatMessage] = [
        ChatMessage(sender: .them, text: "Olá amigo, viste a convocatória de Portugal?", time: "16:00"),
        ChatMessage(sender: .me,   text: "Vi sim CR7! Tu fechando tua última Copa né?", time: "16:01"),
        ChatMessage(sender: .them, text: "Última ou não, vou dar tudo pela seleção 🇵🇹", time: "16:01"),
        ChatMessage(sender: .me,   text: "Preparado para a last dance?", time: "16:02"),
        ChatMessage(sender: .them, text: "Sempre preparado. Portugal vai surpreender.", time: "16:02"),
        ChatMessage(sender: .me,   text: "Quem sabe Brasil x Portugal na final 👀", time: "16:03"),
        ChatMessage(sender: .them, text: "Seria um sonho. Mas o troféu vai pra Lisboa 😉", time: "16:03"),
        ChatMessage(sender: .me,   text: "Aí já é demais kkkk SIIIUUU 🐐", time: "16:04"),
    ]

    // MARK: - Messi / Etezinho (rivalidade Brasil x Argentina)
    static let messiConversation: [ChatMessage] = [
        ChatMessage(sender: .them, text: "Hola hermano, listos para el Mundial?", time: "19:40"),
        ChatMessage(sender: .me,   text: "Bora Leo! Argentina convocou pesado?", time: "19:41"),
        ChatMessage(sender: .them, text: "Sí, mismo grupo campeón. Vamos por el bicampeonato 🏆🏆", time: "19:42"),
        ChatMessage(sender: .me,   text: "Ta no papo kkkkk... esse ano o hexa é nosso", time: "19:42"),
        ChatMessage(sender: .them, text: "Veremos en la final entonces 😏", time: "19:43"),
        ChatMessage(sender: .me,   text: "Fechado! Brasil x Argentina decidindo de novo", time: "19:43"),
        ChatMessage(sender: .them, text: "Que gane el mejor. Suerte hermano 🤝", time: "19:44"),
        ChatMessage(sender: .me,   text: "Suerte pra ti também Etezinho 💙", time: "19:45"),
    ]

    // MARK: - Yuri Alberto (atacante na esperança da convocação)
    static let yuriAlbertoConversation: [ChatMessage] = [
        ChatMessage(sender: .them, text: "Mano, será que o Ancelotti me chama?", time: "19:40"),
        ChatMessage(sender: .me,   text: "Tu tá fazendo gol todo jogo Protagonista! Merece demais", time: "19:41"),
        ChatMessage(sender: .them, text: "Tô rezando aqui, sonho de criança", time: "19:41"),
        ChatMessage(sender: .me,   text: "Faltou eu la kkkkk mas tua hora chegou irmão", time: "19:42"),
        ChatMessage(sender: .them, text: "Se rolar, prometo dar meu sangue pela amarelinha", time: "19:42"),
        ChatMessage(sender: .me,   text: "Vai dar certo, confia. Lista sai amanhã", time: "19:42"),
        ChatMessage(sender: .them, text: "Tô ansioso demais 😅", time: "19:43"),
    ]

    // MARK: - Neymar Pai (pai comentando convocação do filho)
    static let neyPaiConversation: [ChatMessage] = [
        ChatMessage(sender: .them, text: "Viu que o Juninho foi convocado?", time: "18:20"),
        ChatMessage(sender: .me,   text: "Vi sim! Manda parabéns! Voltou bem da lesão", time: "18:21"),
        ChatMessage(sender: .them, text: "Trabalhou muito pra isso. Merecido demais", time: "18:21"),
        ChatMessage(sender: .me,   text: "Agora é Copa do Mundo, sonho do Brasil todo", time: "18:22"),
        ChatMessage(sender: .them, text: "Vamos juntos pra torcer, família toda vai", time: "18:22"),
        ChatMessage(sender: .me,   text: "Agora eu vou lucrar💰🤑", time: "18:23"),
        ChatMessage(sender: .them, text: "Kkkkk patrocínios vão chover se ganhar a Copa", time: "18:23"),
        ChatMessage(sender: .me,   text: "Bora hexa! 🏆🇧🇷", time: "18:23"),
    ]

    // MARK: - Default (Doc Brown - print original)
    static let docBrownConversation: [ChatMessage] = [
        ChatMessage(sender: .them, text: "Marty?", time: "08:21"),
        ChatMessage(sender: .me,   text: "Hey, hey, Doc, where are you?", time: "08:21"),
        ChatMessage(sender: .them, text: "Thank God I found you.", time: "08:21"),
        ChatMessage(sender: .them, text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made a major breakthrough… I'll need your assistance.", time: "08:21"),
        ChatMessage(sender: .me,   text: "Wait a minute, wait a minute. 1:15 in the morning?", time: "08:21"),
        ChatMessage(sender: .them, text: "Yes. In the morning. 🤨", time: "08:21"),
        ChatMessage(sender: .me,   text: "What's goin' on? Where have you been all week?", time: "08:22"),
        ChatMessage(sender: .them, text: "Working.", time: "08:22"),
        ChatMessage(sender: .me,   text: "Where's Einstein, is he with you? 🐶❤️", time: "08:22"),
        ChatMessage(sender: .them, text: "Yeah, he's right here.", time: "08:22"),
        ChatMessage(sender: .me,   text: "You know, Doc, you left your equipment all week.", time: "08:22"),
        ChatMessage(sender: .them, text: "My equipment, that reminds me, Marty, you better not hook up to the amplifier.", time: "08:22"),
        ChatMessage(sender: .them, text: "There's a slight possibility for overload 🤯", time: "08:23"),
        ChatMessage(sender: .me,   text: "Yeah, I'll keep that in mind….", time: "08:23"),
        ChatMessage(sender: .them, text: "Good, I'll see you tonight. Don't forget, now, 1:15 a.m., Twin Pines Mall.", time: "08:23"),
        ChatMessage(sender: .me,   text: "Right.", time: "08:24"),
    ]
}
