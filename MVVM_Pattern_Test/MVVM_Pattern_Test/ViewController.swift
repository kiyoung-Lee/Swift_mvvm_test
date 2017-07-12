//
//  ViewController.swift
//  MVVM_Pattern_Test
//
//  Created by MAPSSI on 03/07/2017.
//  Copyright © 2017 MAPSSI. All rights reserved.
//

import UIKit
import SwiftEventBus
import Alamofire

class ViewController: UIViewController {
	
	@IBOutlet weak var eventListView: UITableView!

	var viewModel:MainViewModel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = MainViewModel()
		
		SwiftEventBus.onMainThread(self, name: "eventListNotify") { result in
			self.eventListView.reloadData()
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

extension ViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.eventList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let row = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath) as! EventRowCell
		row.bindView(viewModel: viewModel.eventList[indexPath.row])
		return row
	}
}

