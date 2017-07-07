//
//  ViewController.swift
//  ImageDownloader
//
//  Created by MAPSSI on 07/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

	@IBOutlet weak var imgView: UIImageView!
	@IBOutlet weak var indicator: UIActivityIndicatorView!
	@IBOutlet weak var progressView: UIProgressView!
	
	var downloadTask:URLSessionDownloadTask!
	
	@IBAction func downloadAction(_ sender: Any) {
		self.imgView.image = nil
		self.progressView.setProgress(0.0, animated: false)
		indicator.startAnimating()
		let sessionConfiguration = URLSessionConfiguration.default
		let session = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: OperationQueue.main)
		
//		downloadTask = session.downloadTask(with: URL(string: "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/sample.jpeg")!)
		
		downloadTask = session.downloadTask(with: URL(string: "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/sample.jpeg")!, completionHandler: {(data,response,error) -> Void in
			
			self.imgView.image = UIImage(data:try! Data(contentsOf: data!))
			self.indicator.stopAnimating()
		})
		
		downloadTask.resume()
	}
	
	
//	@IBAction func suspendAction(_ sender: Any) {
//		downloadTask.suspend()
//	}
//	@IBAction func resumeAction(_ sender: Any) {
//		downloadTask.resume()
//	}
//	@IBAction func cancelAction(_ sender: Any) {
//		downloadTask.cancel()
//		self.progressView.setProgress(0.0, animated: false)
//		indicator.stopAnimating()
//	}
//	
//	func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
//		
//		let tempProgress:Float = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
//		self.progressView.setProgress(tempProgress, animated: true)
//		
////		print("didWriteData : \(bytesWritten)")
////		print("totalBytesWritten : \(totalBytesWritten)")
////		print("totalBytesExpectedToWrite : \(totalBytesExpectedToWrite)")
//	}
//	
//	func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
//		let tempData:Data = try! Data(contentsOf: location)
//		self.imgView.image = UIImage(data: tempData)
//		indicator.stopAnimating()
//	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

