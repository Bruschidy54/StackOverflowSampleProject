//
//  QuestionModel.swift
//  StackOverflowSampleProject
//
//  Created by dylan.bruschi on 12/6/18.
//  Copyright © 2018 dylan.bruschi. All rights reserved.
//

import Foundation

struct Question: Codable {

    // MARK: Properties
    let answered: Bool
    let answerCount: Int
    let creationDate: Int
    let asker: User
    let score: Int
    let questionId: Int
    let title: String
    let viewCount: Int

    // MARK: Enumerations
    enum CodingKeys: String, CodingKey {
        case answered = "is_answered"
        case answerCount = "answer_count"
        case creationDate = "creation_date"
        case asker = "owner"
        case score
        case questionId = "question_id"
        case title
        case viewCount = "view_count"
    }

}
