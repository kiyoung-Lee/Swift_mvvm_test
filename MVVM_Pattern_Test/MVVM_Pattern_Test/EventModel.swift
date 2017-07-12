//
//  EventModel.swift
//  MVVM_Pattern_Test
//
//  Created by MAPSSI on 12/07/2017.
//  Copyright © 2017 MAPSSI. All rights reserved.
//

import Foundation

class EventModel{
	
	let eventList:EventListViewModel
	
	init(){
		eventList = EventListViewModel(eventList: [])
	}
}
