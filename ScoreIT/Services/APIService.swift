//
//  APIService.swift
//  ScoreIT
//
//  Created by Khondwani Sikasote on 2022/04/24.
//

import UIKit

class APIService: NSObject {
    private let creditURL = URL(string: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values")!
    
    func apiToGetCreditData(completion : @escaping (MockCredit) -> ()){
          URLSession.shared.dataTask(with: creditURL) { (data, urlResponse, error) in
              if let data = data {
                  
                  let jsonDecoder = JSONDecoder()
                  
                  let creditData = try! jsonDecoder.decode(MockCredit.self, from: data)
                      completion(creditData)
              }
          }.resume()
      }

}
