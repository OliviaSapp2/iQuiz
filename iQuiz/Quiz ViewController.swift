//
//  Quiz ViewController.swift
//  iQuiz
//
//  Created by Olivia Sapp on 5/12/24.
//

import UIKit

class Quiz_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        numQuestion = 0;
        pointsX = 0
        pointsY = 0
        pointsLable.text = "Points: \(pointsX) '\' \(pointsY)"
        
        correctLable.isHidden = true
        nextButton.isHidden = true
        backButton.isHidden = true
        submitButton.isHidden = false
        selectAns.isHidden = true
        setToGray(true, true, true, true)
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
     
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var pointsLable: UILabel!
    
    @IBOutlet weak var questionText: UITextView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var correctLable: UILabel!
    @IBOutlet weak var selectAns: UILabel!
    
    
    var numQuestion = 0;
    var pointsX = 0
    var pointsY = 0
    var answer = 1;
    var guess = 0;
    var choices: [String] = []
    var questionsList = [quizTopics] = []
    
    //question view
    func setQuestion(_ question: String, _ choicesList: [String], _ setAnswer: Int){
        questionText.text = question
        choices = choicesList
        answer = setAnswer
        guess = 0
        choice1.setTitle(choices[0], for: .normal)
        choice2.setTitle(choices[1], for: .normal)
        choice3.setTitle(choices[2], for: .normal)
        choice4.setTitle(choices[3], for: .normal)
        pointsLable.text = "Points: \(pointsX) '\' \(pointsY)"
        // change all buttons to grey
        setToGray(true, true, true, true)
        selectAns.isHidden = true
        submitButton.isHidden = false
        correctLable.isHidden = true
        nextButton.isHidden = true
        backButton.isHidden = true
    }
    
    // click the first choice
    @IBAction func pickedChoice1(_ sender: Any) {
        guess = 1
        // change all buttons to grey
        setToGray(false, true, true, true)
        //change color to blue
        choice1.backgroundColor = UIColor.blue
        selectAns.isHidden = true
    }
    
    // click the second choice
    @IBAction func pickedChoice2(_ sender: Any) {
        guess = 2
        // change all buttons to grey
        setToGray(true, false, true, true)
        //change color to blue
        choice2.backgroundColor = UIColor.blue
        selectAns.isHidden = true
    }
    
    //click the third choice
    @IBAction func pickedChoice3(_ sender: Any) {
        guess = 3
        // change all buttons to grey
        setToGray(true, true, false, true)
        //change color to blue
        choice3.backgroundColor = UIColor.blue
        selectAns.isHidden = true
    }
    
    // click the 4th choice
    @IBAction func pickedChoice4(_ sender: Any) {
        guess = 4
        // change all buttons to grey
        setToGray(true, true, true, false)
        //change color to blue
        choice4.backgroundColor = UIColor.blue
        selectAns.isHidden = true
    }
    
    //answer view
    @IBAction func submited(_ sender: Any) {
        if(guess != 0){ // make sure they picked an answer
            if isCorrect(){
                correctLable.text = "Correct! :)"
                //correct color is green
                getGuess(guess).backgroundColor = UIColor.green
                pointsX += 1
                pointsY += 1
                pointsLable.text = "Points: \(pointsX) '\' \(pointsY)"
            } else{
                correctLable.text = "Inorrect! :("
                //correct color is green
                //getGuess(answer).backgroundColor = UIColor.green
                // incorrect color is red
                getGuess(guess).backgroundColor = UIColor.red
                pointsY += 1
                pointsLable.text = "Points: \(pointsX) '\' \(pointsY)"
            }
            selectAns.isHidden = true
            submitButton.isHidden = true
            correctLable.isHidden = false
            nextButton.isHidden = false
            backButton.isHidden = false
            
            updatePoints();
        }
        selectAns.isHidden = false
    }
    
    //next button
    
    @IBAction func clickNext(_ sender: Any) {
        //next question?
        if(){
            numQuestion += 1
            setQuestion(<#T##question: String##String#>, <#T##choicesList: [String]##[String]#>, <#T##setAnswer: Int##Int#>)
        } else{
            // send points to final page
            
            //send to final page
            let storyboard = UIStoryboard(name: "Final_ViewController", bundle: nil)
            let finalVC = storyboard.instantiateViewController(identifier: "final")
            show(finalVC, sender: self)
        }
        
    }
    //back button
    @IBAction func clickBack(_ sender: Any) {
        // send to home
        let storyboard = UIStoryboard(name: "ViewController", bundle: nil)
        let homeVC = storyboard.instantiateViewController(identifier: "main")
        show(homeVC, sender: self)
    }
    
    
    func updatePoints(){
        pointsY += 1
        if isCorrect(){
            pointsX += 1
        }
        pointsLable.text = "Points: \(pointsX) '\' \(pointsY)"
    }
    
    func getGuess(_ choice: Int) -> UIButton{
        if(choice == 1){
            return choice1
        } else if(choice == 2){
            return choice2
        } else  if(choice == 3){
            return choice3
        } else if(choice == 4){
            return choice4
        }
    }
    
    // sets buttons back to their defult color
    func setToGray(_ b1: Bool, _ b2: Bool, _ b3: Bool, _ b4: Bool){
        if(b1){
            choice1.backgroundColor = UIColor.gray
        }
        if(b2){
            choice2.backgroundColor = UIColor.gray
        }
        if(b3){
            choice3.backgroundColor = UIColor.gray
        }
        if(b4){
            choice4.backgroundColor = UIColor.gray
        }
    }
    
    //did the user guess correct?
    func isCorrect() -> Bool{
        var correct = false
        if answer == guess{
            correct = true
        }
        return correct
    }
    
     /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
