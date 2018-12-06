//
//  SearchTableViewCell.swift
//  StackOverflowSampleProject
//
//  Created by dylan.bruschi on 12/6/18.
//  Copyright © 2018 dylan.bruschi. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var answersCountLabel: UILabel!
    @IBOutlet weak var viewsCountLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    // MARK: Properties
    var question: Question? {
        didSet {
            guard let cellQuestion = question else {
                return
            }

            if let profileURLString = question?.asker.profileImage {
                guard let profileURL = URL(string: profileURLString) else { return }
                URLSession.shared.dataTask(with: profileURL) { (data, _, _) in
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        self.userProfileImageView.image = UIImage(data: data)
                    }
                }
            }

            self.checkImageView.image = cellQuestion.answered ? UIImage(named: "CheckMark") : UIImage(named: "XMark")

            self.questionLabel.text = cellQuestion.title
            self.pointsLabel.text = "\(cellQuestion.score) points"
            self.answersCountLabel.text = "\(cellQuestion.answerCount) answers"
            self.viewsCountLabel.text = "\(cellQuestion.viewCount) views"
            self.usernameLabel.text = "Asked by " + (cellQuestion.asker.username ?? "Anonymous")
            // Format date
            self.dateLabel.text = "\(cellQuestion.creationDate)"
        }
    }
}
