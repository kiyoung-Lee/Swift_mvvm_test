//
//  ViewController.swift
//  FlightBooking
//
//  Created by MAPSSI on 05/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var selectDatePicker: UIDatePicker!
	@IBOutlet weak var returnDateButton: UIButton!
	@IBOutlet weak var returnDateLabel: UILabel!
	@IBOutlet weak var departureDateButton: UIButton!
	
	@IBAction func showReturnDateAction(_ sender: Any) {
		
		returnDateLabel.isHidden = !(sender as! UISwitch).isOn
		returnDateButton.isHidden = !(sender as! UISwitch).isOn
	}
	
	var buttonTag = 1
	
	@IBAction func showDatePickerAction(_ sender: Any) {
		if selectDatePicker.isHidden == false{
			selectDatePicker.isHidden = true
		} else{
			selectDatePicker.isHidden = false
		}
		
		buttonTag = (sender as! UIButton).tag
	}
	
	
	@IBAction func selectedDateAction(_ sender: Any) {
		let formatter = DateFormatter()
		formatter.dateFormat = "YY-MM-d hh:mma"
//		let dateString = formatter.string(from: selectDatePicker.date)
		let dateString = formatter.string(from: (sender as! UIDatePicker).date)
		
		if buttonTag == 1 {
			departureDateButton.setTitle(dateString, for: UIControlState())
		} else{
			returnDateButton.setTitle(dateString, for: UIControlState())
		}
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
		selectDatePicker.isHidden = true
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		returnDateLabel.isHidden = true
		returnDateButton.isHidden = true
		selectDatePicker.isHidden = true
		
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

