//
//  StatisticsViewController.swift
//  QuestionOfTheDay
//
//  Created by student on 11/7/17.
//

import UIKit

class StatisticsViewController: UIViewController {
    var stat = Statistician()
    var que:QuestionOfTheDay!
    @IBOutlet weak var OptA: UILabel!
    @IBOutlet weak var OptB: UILabel!
    @IBOutlet weak var OptC: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OptA.text = "\(stat.findPercentage()[0])"
        OptB.text = "\(stat.findPercentage()[1])"
        OptC.text = "\(stat.findPercentage()[2])"
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        OptA.text = "\(stat.findPercentage()[0])"
        OptB.text = "\(stat.findPercentage()[1])"
        OptC.text = "\(stat.findPercentage()[2])"
    
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
