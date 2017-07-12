//
//  MainRepository.swift
//  MVVM_Pattern_Test
//
//  Created by MAPSSI on 11/07/2017.
//  Copyright © 2017 MAPSSI. All rights reserved.
//

import Foundation
import Alamofire
import SwiftEventBus

protocol MainRepositoryProtocol {
	func getEventData()
}

class MainRepository:MainRepositoryProtocol{
	
	func getEventData() {
		let url = URL(string: "http://app2.mapssi.com:8080/banner/eventList")
		var request = URLRequest(url: url!)
		request.httpMethod = "POST"
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpBody = try! JSONSerialization.data(withJSONObject: [:], options: [])
		
		
		Alamofire.request(request)
			.responseJSON { response in
				if(response.result.isSuccess){
					guard let json = response.result.value as? [String: Any] else { return };
					let eventJSONArray = json["event"] as? [[String: Any]] ?? []
					SwiftEventBus.post("loadDataEvent", sender: eventJSONArray)
				}
		}
		
	}
}
