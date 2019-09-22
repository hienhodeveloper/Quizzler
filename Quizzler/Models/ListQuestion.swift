//
//  ListQuestion.swift
//  Quizzler
//
//  Created by mini03 on 9/20/19.
//  Copyright © 2019 TeamLuna. All rights reserved.
//

import Foundation

class ListQuestion{
    var list = [Question]()
    var totalPoint: Int = 0
    var currentLevel: Int = 1;
    
    init(){
        nextQuestion()
    }
    
    func nextQuestion(){
        let question = Question(level: currentLevel)
        list.append(question)
    }
    
    func checkAnswer(answer: Bool) ->Bool {
        var isCorrect: Bool = false
        if let question = list.last {
            isCorrect = question.isCorrectAnswer(answer: answer)
            totalPoint += isCorrect == true ?question.point:0
        }
        return isCorrect
    }
    
    func reset()  {
        list.removeAll()
        totalPoint = 0
        currentLevel = 1
    }
}
