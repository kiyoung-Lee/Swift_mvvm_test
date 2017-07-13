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
import RxSwift
import RxCocoa

class ViewController: UIViewController {
	
	@IBOutlet weak var eventListView: UITableView!

	fileprivate var _viewModel:EventListViewModel{
		return ViewModelLocator.eventModel.eventList
	}
	
	private var _binding: Disposable?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		_binding?.dispose()
		_binding = _viewModel.eventListChanged.subscribe(onNext: { _ in self.eventListView.reloadData()})
		
		_viewModel.loadData()
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
		return _viewModel.eventList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let row = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath) as! EventRowCell
		
		let rowViewModel = _viewModel.eventList[indexPath.row]
		row.dataContext = rowViewModel
		return row
	}
}

