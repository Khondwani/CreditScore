//
//  MoreDetailsViewController.swift
//  ScoreIT
//
//  Created by Khondwani Sikasote on 2022/04/25.
//

import UIKit

class MoreDetailsViewController: UIViewController {

    @IBOutlet weak var personaType: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var scoreBand: UILabel!
    @IBOutlet weak var daysLeft: UILabel!
    
    var creditData: MockCredit? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personaType.text = creditData!.personaType
        score.text = "\(creditData!.creditReportInfo.score)"
        scoreBand.text = "\(creditData!.creditReportInfo.scoreBand)"
        daysLeft.text = "\(creditData!.creditReportInfo.daysUntilNextReport)"

        // Do any additional setup after loading the view.
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
