//
//  ViewController.swift
//  Weather
//
//  Created by MAPSSI on 06/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
	
	var datalist:[[String:String]] = [[:]]
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		
		var dicTemp = datalist[indexPath.row]
		
		cell.textLabel!.text = dicTemp["지역"]
		
		let weatherStr = dicTemp["날씨"]
		
		cell.detailTextLabel!.text = weatherStr
		
		if weatherStr == "맑음"{
			cell.imageView!.image = UIImage(named: "sunny.png")
		} else if weatherStr == "비"{
			cell.imageView!.image = UIImage(named: "rainy.png")
		} else if weatherStr == "눈"{
			cell.imageView!.image = UIImage(named: "snow.png")
		} else if weatherStr == "흐림"{
			cell.imageView!.image = UIImage(named: "cloudy.png")
		} else {
			cell.imageView!.image = UIImage(named: "blizzard.png")
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return datalist.count
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		let dic1 = ["지역":"한국", "날씨":"비"]
		let dic2 = ["지역":"일본", "날씨":"맑음"]
		let dic3 = ["지역":"중국", "날씨":"눈"]
		let dic4 = ["지역":"스페인", "날씨":"우박"]
		let dic5 = ["지역":"미국", "날씨":"흐림"]
		let dic6 = ["지역":"영국", "날씨":"비"]
		let dic7 = ["지역":"프랑스", "날씨":"흐림"]
		let dic8 = ["지역":"브라질", "날씨":"우박"]
		let dic9 = ["지역":"스위스", "날씨":"맑음"]
		let dic10 = ["지역":"덴마크", "날씨":"눈"]
		let dic11 = ["지역":"스웨덴", "날씨":"비"]
		
		datalist = [dic1, dic2, dic3, dic4, dic5, dic6, dic7, dic8, dic9, dic10, dic11]
		
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

