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

	var viewModel:EventListViewModel{
		return ViewModelLocator.eventModel.eventList
	}
	
	let repository:MainRepository = MainRepository()
	
	override func viewDidLoad() {
		super.viewDidLoad()
				
		repository.getEventData()
		SwiftEventBus.onMainThread(self, name: "loadDataEvent") { result in
			let eventJSONArray = result.object as? [[String: Any]] ?? []
			self.viewModel.eventList = [EventRowViewModel](JSONArray: eventJSONArray) ?? []
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
		
		let rowViewModel = viewModel.eventList[indexPath.row]
		row.dataContext = rowViewModel		
		return row
	}
}

