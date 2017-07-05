//
//  ViewController.swift
//  AppLifeCycle
//
//  Created by MAPSSI on 05/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		print("viewDidLoad")
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func viewWillAppear(_ animated: Bool) {
			super.viewDidAppear(true)
			print("viewWillAppear")
	}
	
	override func viewDidAppear(_ animated: Bool) {
			super.viewDidAppear(true)
			print("viewDidAppear")
	}
	
	override func viewWillDisappear(_ animated: Bool) {
			super.viewWillDisappear(true)
			print("viewWillDisappear")
		
	}
	
	override func viewDidDisappear(_ animated: Bool) {
			super.viewDidAppear(true)
			print("viewDidDisappear")
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

