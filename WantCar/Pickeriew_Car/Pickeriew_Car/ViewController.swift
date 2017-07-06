//
//  ViewController.swift
//  Pickeriew_Car
//
//  Created by MAPSSI on 06/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

	@IBOutlet weak var imgView: UIImageView!
	
	let carName:[String] = ["Tesla", "Lamborghini", "Porsche"]
	var carModel:[String] = []
	var carModelImage:[String] = []
	
	let tesla = ["Model S", "Model X"]
	let lamborghini = ["aventador", "veneno", "huracan"]
	let porsche = ["911", "boxter"]
	
	let teslaImageName = ["tesla-model-s.jpg", "tesla-model-x.jpg"]
	let lamborghiniImageName = ["lamborghini-aventador.jpg", "lamborghini-venono.jpg", "lamborghini-huracan.jpg"]
	let porscheImageName = ["porsche-911.jpg", "porsche-boxter.jpg"]
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		carModel = tesla
		carModelImage = teslaImageName
		imgView.layer.cornerRadius = 50.0
		imgView.layer.masksToBounds = true
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	//UIPickerView Datasource
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 2
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		if component == 0{
			return carName[row]
		} else {
			return carModel[row]
		}
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		
		if component == 0 {
			return carName.count
		} else{
			return tesla.count
		}
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		if component == 0 && row == 0 {
			carModel = tesla
			carModelImage = teslaImageName
		}else if component == 0 && row == 1{
			carModel = lamborghini
			carModelImage = lamborghiniImageName
		}else if component == 0 && row == 2{
			carModel = porsche
			carModelImage = porscheImageName
		}
		
		pickerView.reloadAllComponents()
		
		imgView.image = UIImage(named: carModelImage[pickerView.selectedRow(inComponent: 1)])
	}
	
	

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	

}

