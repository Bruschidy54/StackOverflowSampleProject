//
//  APIService.swift
//  StackOverflowSampleProject
//
//  Created by dylan.bruschi on 12/6/18.
//  Copyright © 2018 dylan.bruschi. All rights reserved.
//

import Foundation

struct APIService {

    static let shared = APIService()
    let baseURLString = "https://api.stackexchange.com"

    func fetchQuestionsWithSearchTerm(searchTerm: String, completionHandler: @escaping ([Question]) -> Void) {

        let searchURLString = baseURLString + "/2.2/search?order=desc&sort=activity&intitle=\(searchTerm)&site=stackoverflow"

        guard let searchURL = URL(string: searchURLString) else {
            print("Invalid URL string")
            return
        }

        URLSession.shared.dataTask(with: searchURL) { (data, response, error) in
            if let error = error {
                print("There was an error retrieving data", error)
                return
            }

            guard let jsonData = data else {
                print("Fetched data is nil")
                return
            }


            do {
                let dataResponse = try JSONDecoder().decode(StackOverflowResponse.self, from: jsonData)
                completionHandler(dataResponse.items)
            } catch let error {
                print("There was an error decoding questions from data", error)
                return
            }
        }.resume()
    }
}
