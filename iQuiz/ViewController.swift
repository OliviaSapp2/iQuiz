//
//  ViewController.swift
//  iQuiz
//
//  Created by Olivia Sapp on 5/1/24.
//

import UIKit

class TableCell : UITableViewCell{
   
    @IBOutlet weak var cellTitle: UILabel!
    
    @IBOutlet weak var cellDesc: UILabel!
    
    @IBOutlet weak var cellIMG: UIImageView!
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        super.viewDidLoad()
//        DispatchQueue.global().async {
//            NSLog("Inside global().async")
//
//            // Issue a GET http://tednewardsandbox.site44.com/questions.json
//            // Define the URL you want to request
//            let urlString = "http://tednewardsandbox.site44.com/questions.json"
//            guard let url = URL(string: urlString) else {
//                print("Invalid URL")
//                return
//            }
//
//            // Create a URLSession data task to fetch data
//            let task = URLSession.shared.dataTask(with: url) { data, response, error in
//                // print(data, response, error)
//                // Handle errors
//                if let error = error {
//                    print("Error fetching data: \(error)")
//                    return
//                }
//
//                // Check if the data is received
//                guard let data = data else {
//                    print("No data received")
//                    return
//                }
//               // allData = data
//
//                // Try to parse the JSON data
//                do {
//                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                        print("JSON data: \(json)")
//                    } else {
//                        print("Not a dictionary")
//                    }
//                } catch {
//                    print("Error parsing JSON: \(error)")
//                }
//            }
//
//            // Start the task
//            task.resume()
//        }
    }
    
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    let quizTopics =  [
        ("Mathematics", "Did you pass the third grade?"),
        ("Science!", "Because SCIENCE!"),
        ("Marvel Super Heroes", "Avengers, Assemble!")
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizTopics.count
    }
    
    //formating the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exampleCell", for: indexPath) as! TableCell
        let topic = quizTopics[indexPath.row]
        //cell.textLabel?.text = topic.0
        cell.cellTitle.text = topic.0
        cell.cellDesc.text = topic.1
        
        let imgName: String
        switch topic.0{
        case "Mathematics":
            imgName = "Math"
        case "Science!":
            imgName = "Science"
        case "Marvel Super Heroes":
            imgName = "Marvel"
        default:
            imgName = ""
        }
        cell.cellIMG.image = UIImage(named: imgName)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "setQuestion",
           let destinationVC = segue.destination as?Quiz_ViewController {
            //dataToPass = data
            destinationVC.receivedData = dataToPass
        }
    }
    
    var dataToPass = ("example", "ex")
    
    //change view to the quiz page
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected topic
        dataToPass = quizTopics[indexPath.row]
        
        // Perform the segue to the question view controller
        performSegue(withIdentifier: "setQuestion", sender: self)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 170
        }
    
    @IBAction func toSettings(_ sender: Any) {
        performSegue(withIdentifier: "toSettings", sender: settingsButton)
    }
    
    
}

