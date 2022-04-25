//
//  HomeViewController.swift
//  ScoreIT
//
//  Created by Khondwani Sikasote on 2022/04/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var creditScore: UILabel!
    private var creditViewModel : CreditViewModel!
    var circularProgressBarView: CircularProgressBarView!
    var circularViewDuration: TimeInterval = 2
    var DEFAULT_SCORE = 0
    var creditDataToPass: MockCredit? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.getUpdateFromViewModel()
    }
    
    func getUpdateFromViewModel() {
        self.creditViewModel = CreditViewModel()
        // this will run when the data has been set!
        self.creditViewModel.bindCreditViewModelToHomeViewController = {
//            print ("Running: \(self.creditViewModel.creditData.creditReportInfo.score)")
            // update the score and animate it
            self.updateCreditScore(score: self.creditViewModel.creditData.creditReportInfo.score)
            
            // store the data
            self.creditDataToPass = self.creditViewModel.creditData
            
        }
    }
    
    func setupDonut() {
        circularProgressBarView = CircularProgressBarView(frame: .zero)
        circularProgressBarView.center = view.center
        // pass the duration and also the score to get the correct donut circle
        circularProgressBarView.progressAnimation(duration: 0, score: DEFAULT_SCORE)
        
        // add this view to the view controller
        view.addSubview(circularProgressBarView)
    }
    
    func updateCreditScore(score: Int) {
        DispatchQueue.main.async { // Did this so that it does not run on the main thread! So it allows it to execute on a different thread
            // Update UI
            self.creditScore.text = "\(score)"
            self.setupDonut()
            self.circularProgressBarView.progressAnimation(duration: self.circularViewDuration, score: score)
        }
    }

    @IBAction func tappedStackView(_ sender: Any) {
        // this is will only happen if the data is set
        if creditDataToPass != nil {
            performSegue(withIdentifier: "moreDetails", sender: creditDataToPass!)
        }
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let vc = segue.destination as! MoreDetailsViewController
        vc.creditData = sender as? MockCredit
    }
    

}
