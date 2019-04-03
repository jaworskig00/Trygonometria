//
//  ViewController.swift
//  Trygonometria
//
//  Created by Grzegorz Jaworski on 29/03/2019.
//  Copyright © 2019 Grzegorz Jaworski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentIndex: Int = 0
    var questions:[Question] = [
        Question(image: "cat.jpg", answer: 1, firstButtonTitle: "a/b", secondButtonTitle: "b/a", thirdButtonTitle: "a/c", fourthButtonTitle: "b/c", questionContent: "Który wzór jest równy sin α?"),
        Question(image: "cat.jpg", answer: 2, firstButtonTitle: "b/c", secondButtonTitle: "a/b", thirdButtonTitle: "b/a", fourthButtonTitle: "a/c", questionContent: "Który wzór jest równy cos β?"),
        Question(image: "cat.jpg", answer: 3, firstButtonTitle: "b/c", secondButtonTitle: "b/a", thirdButtonTitle: "a/c", fourthButtonTitle: "a/b", questionContent: "Który wzór jest równy ctg β?"),
        Question(image: "cat.jpg", answer: 4, firstButtonTitle: "1", secondButtonTitle: "2", thirdButtonTitle: "3", fourthButtonTitle: "4", questionContent: "Ile wynosi tg α?"),
        Question(image: "cat.jpg", answer: 3, firstButtonTitle: "1", secondButtonTitle: "2", thirdButtonTitle: "3", fourthButtonTitle: "4", questionContent: "Ile wynosi sin β?")
    ]

    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var nextQuestionButton: UIButton!
    
    @IBOutlet weak var questionImage: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBAction func buttomTapped(_ sender: Any) {
        checkAnswer(sender)
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        currentIndex += 1
        if currentIndex >= 5 {
            currentIndex = 0
        }
        
        updateQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstButton.layer.cornerRadius = 20
        secondButton.layer.cornerRadius = 20
        thirdButton.layer.cornerRadius = 20
        fourthButton.layer.cornerRadius = 20
        nextQuestionButton.layer.cornerRadius = 20

        updateQuestion()
    }
    
    func updateQuestion() {
        view.backgroundColor = UIColor(red: 205/255, green: 255/255, blue: 255/255, alpha: 1.0)
        
        firstButton.setTitle(questions[currentIndex].firstButtonTitle, for: .normal)
        secondButton.setTitle(questions[currentIndex].secondButtonTitle, for: .normal)
        thirdButton.setTitle(questions[currentIndex].thirdButtonTitle, for: .normal)
        fourthButton.setTitle(questions[currentIndex].fourthButtonTitle, for: .normal)
        
        questionLabel.text = questions[currentIndex].questionContent
        
        let currentImage = UIImage(named: questions[currentIndex].image)
        questionImage.image = currentImage
    }
    
    func checkAnswer(_ sender: Any) {
        var tag: Int;
        switch questions[currentIndex].answer {
        case firstButton.tag: tag = firstButton.tag
        case secondButton.tag: tag = secondButton.tag
        case thirdButton.tag: tag = thirdButton.tag
        case fourthButton.tag: tag = fourthButton.tag
        default: tag = 1
        }
        
        if (sender as AnyObject).tag == tag {
            view.backgroundColor = .green
        } else {
            view.backgroundColor = .red
        }
    }
    
}

