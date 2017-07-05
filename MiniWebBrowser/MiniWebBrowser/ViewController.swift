//
//  ViewController.swift
//  MiniWebBrowser
//
//  Created by MAPSSI on 05/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {
	@IBOutlet weak var bookMarkSegmentedContrl: UISegmentedControl!
	@IBOutlet weak var urlTextField: UITextField!
	@IBOutlet weak var mainWebView: UIWebView!
	@IBOutlet weak var spinningActivityIndicator: UIActivityIndicatorView!
	
	@IBAction func bookMarkAction(_ sender: Any) {
		let index = bookMarkSegmentedContrl.selectedSegmentIndex
		let title = bookMarkSegmentedContrl.titleForSegment(at: index)
		let urlString = "https://www.\(title!).com"
		mainWebView.loadRequest(URLRequest(url: URL.init(string: urlString)!))
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		var urlString = "\(urlTextField.text!)"
		if !urlString.hasPrefix("https://") {
			urlString = "https://\(urlString)"
		}
		
		urlTextField.text = urlString
		mainWebView.loadRequest(URLRequest(url: URL(string: urlString)!))
		return true
	}
	
	func webViewDidStartLoad(_ webView: UIWebView) {
		spinningActivityIndicator.startAnimating()
	}
	
	func webViewDidFinishLoad(_ webView: UIWebView) {
		spinningActivityIndicator.stopAnimating()
		spinningActivityIndicator.hidesWhenStopped = true
	}	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		spinningActivityIndicator.startAnimating()
		let urlString = "https://www.facebook.com"
		mainWebView.loadRequest(URLRequest(url: URL.init(string: urlString)!))
		urlTextField.text = urlString
		spinningActivityIndicator.stopAnimating()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}

