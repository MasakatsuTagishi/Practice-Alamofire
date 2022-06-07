//
//  APIClient.swift
//  Practice-Alamofire
//
//  Created by 田岸将勝 on 2022/06/06.
//

import Alamofire

typealias ResultHandler<T> = (Result<T, APIError>) -> Void

struct APIClient {
    func request(word: String, handler: @escaping ResultHandler<[Repository]>) {
        let urlString = "https://api.github.com/search/repositories?q=\(word)"
        let url = URL(string: urlString)
        if url == nil {
            handler(.failure(.invalidURL))
            return
        }
        AF.request(urlString).response { response in
            guard let data = response.data else {
                handler(.failure(.invalidResponse))
                return
            }
            do {
                let repositories = try JSONDecoder().decode(Repositories.self, from: data)
                handler(.success(repositories.items))
            } catch {
                handler(.failure(.unknown(error)))
            }
        }
    }

}
