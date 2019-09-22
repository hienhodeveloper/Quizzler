//
//  Question.swift
//  Quizzler
//
//  Created by mini03 on 9/15/19.
//  Copyright © 2019 TeamLuna. All rights reserved.
//

import Foundation

enum MathType:String {
    case Plus = "+"
    case Minus = "-"
    
    mutating func fromNumber(num: Int){
        switch num {
        case 0:
            self = .Plus
        case 1:
            self = .Minus
        default:
            break
        }
       
    }
}

class Question {
    var firstNumber: Int?
    var secondNumber: Int?
    var mathType: MathType?
    var fakeAnswer: Int?
    var point: Int! = 10
    var level: Int! = 1
    
    var answer:Int {
        get {
            guard let firstNumber = self.firstNumber else {
                return 0
            }
            guard let secondNumber = self.secondNumber else {
                return 0
            }
            switch mathType! {
            case .Plus:
                return firstNumber + secondNumber
            case .Minus:
                return firstNumber - secondNumber
            }
        }
    }
    init(level: Int){
        self.level = level
        generateQuestion()
    }
    init(firstNumber: Int, secondNumber: Int, mathType: MathType, point: Int){
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
        self.mathType = mathType
        self.level = 1
        self.point = point
        self.fakeAnswer = Int.random(in: (answer-2)...(answer+2))
    }
    
    func isCorrectAnswer(answer: Bool) -> Bool {
        print("isCorrectAnswer \(fakeAnswer == self.answer)")
       return answer == (fakeAnswer == self.answer)
    }
    
    func generateQuestion() {
        let firstNum = Int.random(in: 0...level*10)
        let secondNum = Int.random(in: 0...level*10)
        let mathType = Int.random(in: 0...1)
        
        self.point += level*10
        
        if (self.mathType==nil){
            self.mathType = .Minus
        }
        
        self.mathType?.fromNumber(num: mathType)
        
        if (firstNum>secondNum){
            self.firstNumber = firstNum
            self.secondNumber = secondNum
        } else {
            self.firstNumber = secondNum
            self.secondNumber = firstNum
        }
        
        self.fakeAnswer = Int.random(in: (answer-2)...(answer+1))
        if (self.fakeAnswer!<0){
            self.fakeAnswer = Int.random(in: 0...(answer+2))
        }
    }
    
    func toString() -> String {
        return "FirstNum = \(firstNumber ?? -1 ), SecondNum = \(secondNumber ?? -1), MathType = \(mathType!)"
    }
    
    func getQuestion()->String{
        let question = "\(firstNumber!) \(mathType!.rawValue) \(secondNumber!) = \(fakeAnswer!)"
        return question;
    }
}
