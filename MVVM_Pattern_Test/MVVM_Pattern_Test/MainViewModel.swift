//
//  MainViewModel.swift
//  MVVM_Pattern_Test
//
//  Created by MAPSSI on 11/07/2017.
//  Copyright © 2017 MAPSSI. All rights reserved.
//

import Foundation
import SwiftEventBus

protocol ViewModelInput {}

protocol ViewModelType {
	var inputs: ViewModelInput { get }
}

class MainViewModel:ViewModelInput, ViewModelType{
	
	let repository:MainRepositoryProtocol
	var evenList: [EventDataModel] = []
	
	init() {
		repository = MainRepository()
		loadData()
	}
	
	func loadData(){
		repository.getEventData()
		SwiftEventBus.onMainThread(self, name: "loadDataEvent") { result in
			let eventJSONArray = result.object as? [[String: Any]] ?? []
			self.evenList = [EventDataModel].init(JSONArray: eventJSONArray) ?? [];
			SwiftEventBus.post("someEventName")
		}		
	}
	
	var inputs: ViewModelInput { return self}
}
