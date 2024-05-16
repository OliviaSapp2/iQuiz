//
//  ViewController.swift
//  iQuiz
//
//  Created by Olivia Sapp on 5/1/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global().async {
            NSLog("Inside global().async")
            
            // Issue a GET http://tednewardsandbox.site44.com/questions.json
            // Define the URL you want to request
            let urlString = "http://tednewardsandbox.site44.com/questions.json"
            guard let url = URL(string: urlString) else {
                print("Invalid URL")
                return
            }

            // Create a URLSession data task to fetch data
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
               // print(data, response, error)
                // Handle errors
                if let error = error {
                    print("Error fetching data: \(error)")
                    return
                }
                
                // Check if the data is received
                guard let data = data else {
                    print("No data received")
                    return
                }
                
                // Try to parse the JSON data
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print("JSON data: \(json)")
                    } else {
                        print("Not a dictionary")
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }

            // Start the task
            task.resume()
        }
    }
    
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var exampleCell: UITableViewCell!
    
    @IBOutlet weak var TitleQuiz: UILabel!
    
    
    let quizTopics = ["Mathematics", "Marvel Super Heros", "Science!"]
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return quizTopics.count
        }
        
    //formating the table
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "exampleCell", for: indexPath) as! exampleCell
            //cell.textLabel!.text = quizTopics[indexPath.row]
            let topic = quizTopics[indexPath.row]
            cell.UIView.UITextView.text = topic.title
            cell.lableDesc.text = topic.desc
            
            let imgName: String
            switch topic.title{
            case "Mathematics":
                imgName = "Math"
            case "Science!":
                imgName = "Science"
            case "Marvel Super Heros":
                imgName = "Marvel"
            default:
                imgName = ""
            }
            cell.imageView?.image = UIImage(named: imgName)
            
            return cell
        }
    
    
    //change view to the quiz page
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected topic
        let selectedTopic = quizTopics[indexPath.row]
        
        // Perform the segue to the question view controller
        performSegue(withIdentifier: "setQuestion", sender: selectedTopic)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let quizVC = self.storyboard!.instantiateViewController(withIdentifier: "quiz") as! Quiz_ViewController
            quizVC.navigationItem.title = quizTopics[indexPath.row]
            navigationController?.pushViewController(quizVC, animated: true)
        }
    
}
