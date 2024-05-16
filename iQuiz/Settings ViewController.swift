//
//  Settings ViewController.swift
//  iQuiz
//
//  Created by Olivia Sapp on 5/12/24.
//

import UIKit

class Settings_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var OkayButton: UIButton!
    
    @IBAction func clickSubmitButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ViewController", bundle: nil)
        let homeVC = storyboard.instantiateViewController(identifier: "main")
        show(homeVC, sender: self)
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
