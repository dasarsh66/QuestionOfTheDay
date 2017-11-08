//
//  VoteViewController.swift
//  QuestionOfTheDay
//
//  Created by student on 11/7/17.
//

import UIKit

class VoteViewController: UIViewController {
    var que:QuestionOfTheDay!
    var stat = Statistician()
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var OptionALabel: UILabel!
    @IBOutlet weak var OptionBLabel: UILabel!
    @IBOutlet weak var OptionCLaabel: UILabel!
    
    @IBAction func ButtonA(_ sender: Any) {
        stat.saveOpinion(opinion: Opinion(answer: 0))
    }
    @IBAction func ButtonB(_ sender: Any) {
        stat.saveOpinion(opinion: Opinion(answer: 1))
    }
    @IBAction func ButtonC(_ sender: Any) {
        stat.saveOpinion(opinion: Opinion(answer: 2))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stat = Statistician()
        que=stat.fetchQuestionOfTheDay()
        QuestionLabel.text=que.question
        OptionALabel.text=que.answer0
        OptionBLabel.text=que.answer1
        OptionCLaabel.text=que.answer2
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
      // QuestionLabel.text=String(describing: stat0.fetchQuestionOfTheDay())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
