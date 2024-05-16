//
//  Final ViewController.swift
//  iQuiz
//
//  Created by Olivia Sapp on 5/12/24.
//

import UIKit

class Final_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        pointsLable.text = "Points: \(pointsX) '\' \(pointsY)"
        setPerformanceLable()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nextButon: UIButton!
    @IBOutlet weak var PerformanceLable: UILabel!
    @IBOutlet weak var pointsLable: UILabel!
    
    var pointsX = 0
    var pointsY = 0
    
    @IBAction func clickNextButton(_ sender: Any) {
        // send to home
        let storyboard = UIStoryboard(name: "ViewController", bundle: nil)
        let homeVC = storyboard.instantiateViewController(identifier: "main")
        show(homeVC, sender: self)
    }
    
    func setPerformanceLable(){
        if(pointsX == pointsY){
            PerformanceLable.text = "Great Job!"
        } else if (pointsX == 0 && pointsY != 0){
            PerformanceLable.text = "Better Luck Next Time"

        } else{
            PerformanceLable.text = "Almost"
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
