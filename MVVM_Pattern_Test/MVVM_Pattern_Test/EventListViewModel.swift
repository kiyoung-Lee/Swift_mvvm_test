//
//  EventListViewModel.swift
//  MVVM_Pattern_Test
//
//  Created by MAPSSI on 12/07/2017.
//  Copyright © 2017 MAPSSI. All rights reserved.
//

import Foundation
import RxSwift
import SwiftEventBus

class EventListViewModel{
	
	private let _eventListChanged = PublishSubject<String>()
	var eventListChanged: Observable<String> { return _eventListChanged }
	
	
	let repository:MainRepository = MainRepository()
	
	var eventList: [EventRowViewModel] = [] {
		didSet{
			_eventListChanged.onNext("eventListChanged")
		}
	}
	
	func loadData(){
		repository.getEventData()
		SwiftEventBus.onMainThread(self, name: "loadDataEvent") { result in
			let eventJSONArray = result.object as? [[String: Any]] ?? []
			self.eventList = [EventRowViewModel](JSONArray: eventJSONArray) ?? []
		}
	}
}
