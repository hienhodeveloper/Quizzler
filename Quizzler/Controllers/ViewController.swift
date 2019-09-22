//
//  ViewController.swift
//  Quizzler
//
//  Created by mini03 on 9/15/19.
//  Copyright © 2019 TeamLuna. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet weak var lbTotalPoint: UILabel!
    
    @IBOutlet weak var imgLife1: UIImageView!
    @IBOutlet weak var imgLife2: UIImageView!
    @IBOutlet weak var imgLife3: UIImageView!
    
    var listQuestion: ListQuestion!
    var soundManager: SoundManager?
    var lifeCount: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initVariable()
        lbQuestion?.text = listQuestion.list.last?.getQuestion()
    }
    
    @IBAction func onAnwer(_ sender: UIButton) {
        sender.pulse()
        let isCorrect = listQuestion.checkAnswer(answer: sender.tag==1)
        lbTotalPoint?.text = String(listQuestion.totalPoint)
        // play sound when your answer is correct
        if (isCorrect){
            ProgressHUD.showSuccess("correct".localized)
            lbTotalPoint?.pulse()
            soundManager?.play()
        } else {
            lifeCount -= 1
            hideLife(position: lifeCount)
            if (lifeCount<1){
                vibrateEndGame()
                showResult()
                return
            }
            ProgressHUD.showError("wrong".localized)
        }
        // go to next question
        listQuestion.nextQuestion()
        lbQuestion?.text = listQuestion.list.last?.getQuestion()
    }
    
    func initVariable() {
        listQuestion = ListQuestion()
        soundManager = SoundManager(soundName: "correct", soundType: SoundType.WAV)
        soundManager?.initSound()
    }
    
    func hideLife(position: Int) {
        if (position<0) {
            return
        }
        var imgLife: UIImageView?
        switch position {
        case 2:
            imgLife = imgLife3
        case 1:
            imgLife = imgLife2
        case 0:
            imgLife = imgLife1
        default:
            break
        }
        imgLife?.fadeOut()
    }
    
    func showResult(){
        let title = "awesome".localized
        let point = "points".localized
        let message =  "result_message".localized + " \(listQuestion.totalPoint) \(point)"
        let alert = UIAlertController(title: title,
                                      message:message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("start".localized, comment: "Default action"), style: .default, handler: { _ in
            self.resetGame()
        }))
        self.present(alert, animated: true){
            alert.view.superview?.subviews[0].isUserInteractionEnabled = false
        }
    }
    
    func resetGame() {
        listQuestion.reset()
        listQuestion.nextQuestion()
        lbQuestion?.text = listQuestion.list.last?.getQuestion()
        lbTotalPoint.text = "0"
        lifeCount = 3
        imgLife1.fadeIn()
        imgLife2.fadeIn()
        imgLife3.fadeIn()
    }
    
    func vibrateEndGame(){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

