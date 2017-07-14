//
//  PopupViewController.swift
//  StylingRequestViewTest
//
//  Created by MAPSSI on 14/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {
	
	@IBOutlet weak var popupView: UIView!
	
	var radioButtonController: SSRadioButtonsController?
	
	var eventList:[String] = ["hello", "Heool", "Heoo"]
	
	override func viewDidLoad() {
        super.viewDidLoad()
		popupView.layer.cornerRadius = 10.0
		popupView.layer.masksToBounds = true
		
		
    }

	
	@IBAction func closePopUp(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
}

extension PopupViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return eventList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let row = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath) as! PopupTableCell
		row.bindView(string: eventList[indexPath.row])
		if radioButtonController == nil {
			self.radioButtonController = SSRadioButtonsController(buttons: row.radioButton)
			self.radioButtonController!.delegate = self
			self.radioButtonController!.shouldLetDeSelect = true
		}else {
			self.radioButtonController?.addButton(row.radioButton)
		}
		return row
	}
}

extension PopupViewController: SSRadioButtonControllerDelegate{
	func didSelectButton(selectedButton: UIButton?){
		print("click")
	}
}
