//
//  DataModel.swift
//  MVVM_Pattern_Test
//
//  Created by MAPSSI on 11/07/2017.
//  Copyright © 2017 MAPSSI. All rights reserved.
//

import ObjectMapper


public class EventDataModel: Mappable{
	
	var banner_idx:Int?
	var banner_title:String?
	var banner_image:String?
	var banner_url:String?
	var banner_upload_date:String?
	var banner_start_date:String?
	var banner_end_date:String?
	
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
