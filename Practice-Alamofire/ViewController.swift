//
//  ViewController.swift
//  Practice-Alamofire
//
//  Created by 田岸将勝 on 2022/06/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!

    private var repositories: [Repository] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }

    private func getArticles(word: String) {
        APIClient().request(word: word) { result in
            switch result {
            case .success(let repositories):
                self.repositories = repositories
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                self.showAPIAlert(error: error)
            }
        }
    }

    private func showAPIAlert(error: APIError) {
        let alert = UIAlertController(title: error.title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "閉じる", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let repository = repositories[indexPath.row]
        cell.configure(repository: repository)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webView = self.storyboard?.instantiateViewController(withIdentifier: "WebView") as! WebViewController
        let url = repositories[indexPath.row].owner.htmlUrl
        webView.url = url
        self.present(webView, animated: true, completion: nil)
    }

}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getArticles(word: searchBar.text ?? "")
    }

}
