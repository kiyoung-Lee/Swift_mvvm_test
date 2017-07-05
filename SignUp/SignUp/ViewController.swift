//
//  ViewController.swift
//  SignUp
//
//  Created by MAPSSI on 05/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var idTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var telTextField: UITextField!
	@IBOutlet weak var blogTextField: UITextField!
	
	@IBOutlet weak var resultTextView: UITextView!
	
	@IBAction func signUpAction(_ sender: Any) {
		resultTextView.text = "\(nameTextField.text!) 님 가입을 축하합니다."
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		//키보드 내려감
		textField.resignFirstResponder()
		return true
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		print("touchBegan")
		self.view.endEditing(true)
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		print("touchMved")
		
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		print("touchEnded")
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		nameTextField.delegate = self
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

