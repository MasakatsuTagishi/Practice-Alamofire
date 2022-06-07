//
//  WebViewController.swift
//  Practice-Alamofire
//
//  Created by 田岸将勝 on 2022/06/07.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet private weak var webView: WKWebView!

    var url: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
    }

    private func loadWebView() {
        if let url = URL(string: url) {
            let urlReq = URLRequest(url: url)
            webView.load(urlReq)
        }
    }

}
