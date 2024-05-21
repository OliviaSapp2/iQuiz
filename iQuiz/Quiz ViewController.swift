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
        
        numQuestion = 0
        guess = 0
        pointsX = 0
        pointsY = 0
        pointsLable.text = "Points: 0 / 0"
        
        correctLable.isHidden = true
        nextButton.isHidden = true
        backButton.isHidden = true
        submitButton.isHidden = false
        selectAns.isHidden = true
        setToGray(true, true, true, true)
        print(receivedData!)
        findQuestion(receivedData!)
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
    var answer = 0
    var guess = 0
    var choices: [String] = []
    var receivedData: String?
    var finalScore = "points"
    
    
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
        pointsLable.text = "Points: \(pointsX) / \(pointsY)"
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
        if(guess == 0){ // make sure they picked an answer
            selectAns.isHidden = false
        } else {
            if isCorrect(){
                correctLable.text = "Correct! :)"
                //correct color is green
                getGuess(guess).backgroundColor = UIColor.green
            } else{
                correctLable.text = "Inorrect! :("
                //correct color is green
                getGuess(answer).backgroundColor = UIColor.green
                // incorrect color is red
                getGuess(guess).backgroundColor = UIColor.red
            }
            selectAns.isHidden = true
            submitButton.isHidden = true
            correctLable.isHidden = false
            nextButton.isHidden = false
            backButton.isHidden = false
            
            updatePoints();
        }
    }
    
    //next button
    @IBAction func clickNext(_ sender: Any) {
            //send to final page
            performSegue(withIdentifier: "showFinal", sender: nextButton)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showFinal"{
            if(receivedData == "Marvel Super Heroes" && (numQuestion == 1 || numQuestion == 0)){
                numQuestion += 1
                findQuestion(receivedData)
                return false
            } else{
                return true
            }
        } else{
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFinal",
           let destinationVC = segue.destination as?Final_ViewController {
            // send points to final page
            if(pointsY == pointsX){
                finalScore = "Points: \(pointsX) / \(pointsY)  Great Job!"
            } else if(pointsX == 0){
                finalScore = "Points: \(pointsX) / \(pointsY) Better Luck Next Time"
            } else{
                finalScore = "Points: \(pointsX) / \(pointsY) Almost"
            }
            destinationVC.receivedData = finalScore
        }
    }
    
    //back button
    @IBAction func clickBack(_ sender: Any) {
        // send to home
        performSegue(withIdentifier: "backHome", sender: backButton)
    }
    
    
    func updatePoints(){
        pointsY += 1
        if isCorrect(){
            pointsX += 1
        }
        pointsLable.text = "Points: \(pointsX) / \(pointsY)"
    }
    
    func getGuess(_ choice: Int) -> UIButton{
        if(choice == 1){
            return choice1
        } else if(choice == 2){
            return choice2
        } else  if(choice == 3){
            return choice3
        }
        return choice4
    }
    
    // sets buttons back to their defult color
    func setToGray(_ b1: Bool, _ b2: Bool, _ b3: Bool, _ b4: Bool){
        if(b1){
            choice1.backgroundColor = UIColor.systemGray5
        }
        if(b2){
            choice2.backgroundColor = UIColor.systemGray5
        }
        if(b3){
            choice3.backgroundColor = UIColor.systemGray5
        }
        if(b4){
            choice4.backgroundColor = UIColor.systemGray5
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
    
    //chosing the data for set question
    func findQuestion(_ topic: String?){
        if topic == "Science!"{
            setQuestion("What is fire?", [
                "One of the four classical elements",
                "A magical reaction given to us by God",
                "A band that hasn't yet been discovered",
                "Fire! Fire! Fire! heh-heh"
              ], 1)
        } else if topic == "Mathematics"{
            setQuestion("What is 2+2?", [
                "4",
                "22",
                "An irrational number",
                "Nobody knows"
              ], 1)
        } else if topic == "Marvel Super Heroes" {
            if numQuestion == 0 {
                setQuestion("Who is Iron Man?", [
                    "Tony Stark",
                    "Obadiah Stane",
                    "A rock hit by Megadeth",
                    "Nobody knows"
                  ], 1)
            } else if numQuestion == 1 {
                setQuestion("Who founded the X-Men?", [
                    "Tony Stark",
                    "Professor X",
                    "The X-Institute",
                    "Erik Lensherr"
                  ], 2)
            } else if numQuestion == 2 {
                setQuestion("How did Spider-Man get his powers?", [
                    "He was bitten by a radioactive spider",
                    "He ate a radioactive spider",
                    "He is a radioactive spider",
                    "He looked at a radioactive spider"
                  ], 1)
            }
        }
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
