//
//  TableViewCell.swift
//  Practice-Alamofire
//
//  Created by 田岸将勝 on 2022/06/06.
//

import SDWebImage

class TableViewCell: UITableViewCell {

    @IBOutlet private weak var ownerNameLabel: UILabel!
    @IBOutlet private weak var ownerImageView: UIImageView!
    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var repositoryDescriptionLabel: UILabel!
    @IBOutlet private weak var starCountLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!

    func configure(repository: Repository) {
        ownerNameLabel.text = repository.name
        repositoryNameLabel.text = repository.fullName
        if let url = repository.owner.avatarUrl {
            ownerImageView.sd_setImage(with: URL(string: url), completed: nil)
        } else {
            ownerImageView.image = nil
        }
        repositoryDescriptionLabel.text = repository.description ?? ""
        starCountLabel.text = "\(repository.stargazersCount)"
        languageLabel.text = repository.language ?? ""
        accessoryType = .disclosureIndicator
    }
    
}
