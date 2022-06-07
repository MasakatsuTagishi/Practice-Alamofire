//
//  Repository.swift
//  Practice-Alamofire
//
//  Created by 田岸将勝 on 2022/06/06.
//

struct Repositories: Codable {
    let items: [Repository]

    enum CodingKeys: String, CodingKey {
        case items
    }
    
}

struct Repository: Codable {
    let name: String
    let fullName: String
    let language: String?
    let stargazersCount: Int
    let description: String?
    let owner: Owner

    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case language
        case stargazersCount = "stargazers_count"
        case description
        case owner
    }

}

struct Owner: Codable {
    let avatarUrl: String?
    let htmlUrl: String

    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
    }

}


