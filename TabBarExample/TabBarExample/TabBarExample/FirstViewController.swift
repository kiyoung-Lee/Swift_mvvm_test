//
//  FirstViewController.swift
//  TabBarExample
//
//  Created by MAPSSI on 06/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

	@IBOutlet weak var resultLabel: UILabel!
	
	@IBAction func buttonAction(_ sender: Any) {
		resultLabel.text = "1번눌림!"
	}
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
