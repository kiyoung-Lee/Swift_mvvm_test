//
//  MainTableViewController.swift
//  CustomTableView
//
//  Created by MAPSSI on 06/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
	

	var itemList = [[String:String]] ()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let item1 = ["name":"사과", "image":"apple.jpeg", "amount":"6", "value":"3000원"]
		let item2 = ["name":"블루베리", "image":"blueberry.jpg", "amount":"10", "value":"30000원"]
		let item3 = ["name":"당근", "image":"carrot.jpg", "amount":"13", "value":"5000원"]
		let item4 = ["name":"체리", "image":"cherry.png", "amount":"1", "value":"2000원"]
		let item5 = ["name":"포도", "image":"grape.jpg", "amount":"13", "value":"1000원"]
		let item6 = ["name":"키위", "image":"kiwi.png", "amount":"2", "value":"15000원"]
		let item7 = ["name":"레몬", "image":"lemon.png", "amount":"3", "value":"6000원"]
		let item8 = ["name":"라임", "image":"lime.jpg", "amount":"4", "value":"4000원"]
		let item9 = ["name":"고기", "image":"meat.jpg", "amount":"5", "value":"2000원"]
		let item10 = ["name":"딸기", "image":"strawberry.jpg", "amount":"7", "value":"8000원"]
		let item11 = ["name":"토마토", "image":"tomato.png", "amount":"30", "value":"3000원"]
		let item12 = ["name":"야채", "image":"vegetable.jpg", "amount":"40", "value":"7000원"]
		let item13 = ["name":"멜론", "image":"watermelon.png", "amount":"6", "value":"13000원"]
		
		itemList = [item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11, item12, item13]
		
		let backgroundImageView = UIImageView(image: UIImage(named: "background.jpg"))
		backgroundImageView.contentMode = UIViewContentMode.scaleAspectFill
		backgroundImageView.frame = self.tableView.frame
		
		self.tableView.backgroundView = backgroundImageView;
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
        return itemList.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CustomCell

		cell.backgroundColor = UIColor.clear
		
		let dicTemp = itemList[indexPath.row]
		cell.nameLabel.text! = dicTemp["name"]!
		cell.amountLabel.text! = dicTemp["amount"]!
		cell.valueLabel.text! = dicTemp["value"]!
		
		cell.imgView.image = UIImage(named: dicTemp["image"]!)!

        return cell
    }

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showDetail"{
			(segue.destination as! CellViewController).detailData = itemList[(self.tableView.indexPathForSelectedRow)!.row]
		}
	}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
