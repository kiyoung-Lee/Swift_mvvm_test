//
//  ViewController.swift
//  DigitalFrame
//
//  Created by MAPSSI on 04/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet var imgView:UIImageView!
	@IBOutlet var btnStart:UIButton!
	@IBOutlet var speedSlider:UISlider!
	@IBOutlet var speedLable:UILabel!
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let cuteImages = [UIImage(named:"1.jpg")!,
		                  UIImage(named:"2.png")!,
		                  UIImage(named:"3.png")!,
		                  UIImage(named:"4.png")!]
		
		imgView.animationImages = cuteImages
		imgView.animationDuration = 4.0
		
		
	}
	
	@IBAction func toggleAction(_ sender:AnyObject){
		if imgView.isAnimating {
			imgView.stopAnimating()
			btnStart.setTitle("Start", for: UIControlState.normal)
			
		}else{
			
			imgView.startAnimating()
			btnStart.setTitle("Stop", for: UIControlState.normal)
		}
	}
	
	@IBAction func changeSpeedAction(_ sender:AnyObject){
		imgView.animationDuration = Double(speedSlider.value)
		imgView.startAnimating()
		btnStart.setTitle("Stop", for: UIControlState.normal)
		speedLable.text = "\(speedSlider.value)"
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}


}

