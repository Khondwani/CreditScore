//
//  MockCredit.swift
//  ScoreIT
//
//  Created by Khondwani Sikasote on 2022/04/24.
//

import Foundation

struct MockCredit: Decodable {
    
    var accountIDVStatus: String
    var dashboardStatus: String
    var personaType: String
    var augmentedCreditScore: Int?
    var creditReportInfo: CreditReportInfo
    var coachingSummary: CoachingSummary
        
   
    
    struct CreditReportInfo: Decodable {
        var score: Int
        var scoreBand: Int
        var clientRef: String
        var status: String
        var maxScoreValue: Int
        var minScoreValue: Int
        var monthsSinceLastDefaulted: Int
        var hasEverDefaulted: Bool
        var monthsSinceLastDelinquent: Int
        var hasEverBeenDelinquent: Bool
        var percentageCreditUsed:Double
        var percentageCreditUsedDirectionFlag:Int
        var changedScore:Int
        var currentShortTermDebt:Int
        var currentShortTermNonPromotionalDebt:Int
        var currentShortTermCreditLimit:Int
        var currentShortTermCreditUtilisation:Int
        var changeInShortTermDebt:Int
        var currentLongTermDebt:Int
        var currentLongTermNonPromotionalDebt:Int
        var currentLongTermCreditLimit:Int?
        var currentLongTermCreditUtilisation:Int?
        var changeInLongTermDebt:Int
        var numPositiveScoreFactors:Int
        var numNegativeScoreFactors:Int
        var equifaxScoreBand:Int
        var equifaxScoreBandDescription:String
        var daysUntilNextReport:Int
        
    }
    
    struct CoachingSummary: Decodable {
        var activeTodo: Bool
        var activeChat: Bool
        var numberOfTodoItems: Int
        var numberOfCompletedTodoItems: Int
        var selected: Bool
    }
}
