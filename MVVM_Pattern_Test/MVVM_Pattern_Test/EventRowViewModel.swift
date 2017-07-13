//
//  EventRowViewModel.swift
//  MVVM_Pattern_Test
//
//  Created by MAPSSI on 12/07/2017.
//  Copyright © 2017 MAPSSI. All rights reserved.
//

import ObjectMapper
import RxSwift

class EventRowViewModel: Mappable {
	
	private let _propertyChanged = PublishSubject<String>()
	var propertyChanged: Observable<String> { return _propertyChanged }
	
	var banner_idx:Int? {
		didSet{
			_propertyChanged.onNext("banner_idx")
		}
	}
	
	var banner_title:String? {
		didSet{
			_propertyChanged.onNext("banner_title")
		}
	}
	
	var banner_image:String?{
		didSet{
			_propertyChanged.onNext("banner_image")
		}
	}
	
	var banner_url:String?{
		didSet{
			_propertyChanged.onNext("banner_url")
		}
	}
	
	var banner_upload_date:String?{
		didSet{
			_propertyChanged.onNext("banner_upload")
		}
	}
	
	var banner_start_date:String?{
		didSet{
			_propertyChanged.onNext("banner_start_date")
		}
	}
	
	var banner_end_date:String?{
		didSet{
			_propertyChanged.onNext("banner_end_date")
		}
	}
	
	public required init?(map: Map) {
		
	}
	
	public func mapping(map: Map) {
		banner_idx <- map["banner_idx"]
		banner_title <- map["banner_title"]
		banner_image <- map["banner_image"]
		banner_url <- map["banner_url"]
		banner_upload_date <- map["banner_upload_date"]
		banner_start_date <- map["banner_start_date"]
		banner_end_date <- map["banner_end_date"]
	}
	
}
