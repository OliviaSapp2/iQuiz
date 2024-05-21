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
        pointsLable.text = receivedData
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nextButon: UIButton!
    @IBOutlet weak var pointsLable: UILabel!
    
    var receivedData: String?
    
    @IBAction func clickNextButton(_ sender: Any) {
        // send to home
        performSegue(withIdentifier: "sendHome", sender: nextButon)
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
