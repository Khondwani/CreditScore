//
//  CreditViewModel.swift
//  ScoreIT
//
//  Created by Khondwani Sikasote on 2022/04/24.
//

import Foundation

class CreditViewModel: NSObject {
    private var apiService: APIService!
    
    // A closure function that notifiies the view controller that this varibale has been set
    var bindCreditViewModelToHomeViewController: () -> Void = {}
    
    private(set) var creditData : MockCredit! {
        didSet {
            self.bindCreditViewModelToHomeViewController()
        }
    }
    
    override init() {
        super.init()
        self.apiService = APIService()
        getCreditData()
    }
    
    func getCreditData() {
        apiService.apiToGetCreditData { mockCreditData in
            print(mockCreditData)
            self.creditData = mockCreditData
        }
    }
}
