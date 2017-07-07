//
//  ViewController.swift
//  Weather
//
//  Created by MAPSSI on 06/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, XMLParserDelegate {
	
	var datalist:[[String:String]] = []
	var detaildata:[String:String] = [:]
	var elementTemp:String = ""
	var blank:Bool = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//		let dic1 = ["지역":"한국", "날씨":"비"]
		//		let dic2 = ["지역":"일본", "날씨":"맑음"]
		//		let dic3 = ["지역":"중국", "날씨":"눈"]
		//		let dic4 = ["지역":"스페인", "날씨":"우박"]
		//		let dic5 = ["지역":"미국", "날씨":"흐림"]
		//		let dic6 = ["지역":"영국", "날씨":"비"]
		//		let dic7 = ["지역":"프랑스", "날씨":"흐림"]
		//		let dic8 = ["지역":"브라질", "날씨":"우박"]
		//		let dic9 = ["지역":"스위스", "날씨":"맑음"]
		//		let dic10 = ["지역":"덴마크", "날씨":"눈"]
		//		let dic11 = ["지역":"스웨덴", "날씨":"비"]
		//
		//		datalist = [dic1, dic2, dic3, dic4, dic5, dic6, dic7, dic8, dic9, dic10, dic11]
		
		let baseUrl = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.xml"
		let parser = XMLParser(contentsOf: URL(string: baseUrl)!)
		
		parser!.delegate = self
		parser!.parse()
	}
	
	func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
//		print("didElement : \(elementName)")
		elementTemp = elementName
		blank = true
	}
	
	func parser(_ parser: XMLParser, foundCharacters string: String) {
		if blank == true && elementTemp != "local" && elementTemp != "weatherinfo" {
//			print("foundCharecter: \(string)")
			detaildata[elementTemp] = string
		}
	}
	
	func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
		if elementName == "local"{
			datalist += [detaildata]
			print(detaildata)
		}
		blank = false
//		print("didEndelement : \(elementName)")
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
		
		var dicTemp = datalist[indexPath.row]
		
		cell.countryLabel!.text = dicTemp["country"]
		
		let weatherStr = dicTemp["weather"]
		
		cell.weatherLabel!.text = weatherStr
		
		cell.temperatureLabel!.text = dicTemp["temperature"];
		
		if weatherStr == "맑음"{
			cell.imgView!.image = UIImage(named: "sunny.png")
		} else if weatherStr == "비"{
			cell.imgView!.image = UIImage(named: "rainy.png")
		} else if weatherStr == "눈"{
			cell.imgView!.image = UIImage(named: "snow.png")
		} else if weatherStr == "흐림"{
			cell.imgView!.image = UIImage(named: "cloudy.png")
		} else {
			cell.imgView!.image = UIImage(named: "blizzard.png")
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return datalist.count
	}



	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

