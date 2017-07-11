//
//  ViewController.swift
//  MVVM_Pattern_Test
//
//  Created by MAPSSI on 03/07/2017.
//  Copyright © 2017 MAPSSI. All rights reserved.
//

import UIKit
import SwiftEventBus

class ViewController: UIViewController {

	var viewModel:ViewModelInput!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = MainViewModel().inputs;
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	
	func testFunction() {
		SwiftEventBus.onMainThread(self, name: "someEventName") { result in
			
		}
	}
}

