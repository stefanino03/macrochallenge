//
//  QuoteModel.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 15/06/23.
//

import Foundation

struct Quote: Identifiable {
    var id = UUID()
    var phrase: String
}

var quotes: [Quote] = [
    Quote(phrase: "You should feel loved without feeling like you are begging for it"),
    Quote(phrase: "Someday you will look back on this day and be so glad you did not give up. Keep going!"),
    Quote(phrase: "When you discover your self-worth, you lose interest in anyone who doesn't see it"),
    Quote(phrase: "Sometimes the only closure you'll get is knowing you tried your best"),
    Quote(phrase: "You deserve the love you keep trying to give everyone else"),
    Quote(phrase: "Once you choose hope everything is possible"),
    Quote(phrase: "It's okay to be sad about something you thought you had healed from"),
    Quote(phrase: "You are too good for someone who isn't sure about you"),
    Quote(phrase: "It's your turn to meet the reason why you never settled"),
    Quote(phrase: "It's your turn to receive good morning and goodnight texts"),
    Quote(phrase: "It's your turn to see your hard work finally pay off"),
    Quote(phrase: "It's your turn to find someone who is sure about you"),
    Quote(phrase: "It's your turn to find \"we'll figure it out together\" love"),
    Quote(phrase: "It's your turn to find someone who fights for you"),
    Quote(phrase: "It's your turn to find honesty and consistency in one person"),
    Quote(phrase: "Ignoring red flags because you want to see the good in people will cost you later"),
    Quote(phrase: "Don't let the mixed signals fool you. Indecision is a decision"),
    Quote(phrase: "Just because someone carries it well, doesn't mean it isnt' heavy"),
    Quote(phrase: "Your tate in people will change when yiu learn to love yourself"),
    Quote(phrase: "Just because you took longer than others doesn't mean you failed"),
    Quote(phrase: "You're so focues on eveything you aren't you're forgetting everything that you are"),
    Quote(phrase: "Trust that what belongs to you will always find you"),
    Quote(phrase: "You deserve to be loved without having to hide the parts of yourself that you think are unlovable"),
    Quote(phrase: "Please love yourself instead of loving the idea of other people loving you"),
    Quote(phrase: "It's of to disappear until you feel like you again"),
    Quote(phrase: "If the version of you from 5 years ago could see you right now, they'd be so proud. Keep going"),
    Quote(phrase: "Stop thinking so much, you're breaking your own heart"),
    Quote(phrase: "People will love you. People will hate you. And non of it will have anything to do with you"),
    Quote(phrase: "It's time to start being loyal to your own peace of mind"),
    Quote(phrase: "You can be happy and grateful and still struggle with mental health issues at the same time")
]

