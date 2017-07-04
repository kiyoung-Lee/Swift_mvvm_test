//
//  ViewController.swift
//  VisualBookManager
//
//  Created by MAPSSI on 04/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let myBook = BookManager()
	
	@IBOutlet var outputTextView:UITextView!
	@IBOutlet var nameTextField:UITextField!
	@IBOutlet var genreTextField:UITextField!
	@IBOutlet var authorTextField:UITextField!
	@IBOutlet var countLable:UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let book1 = Book()
		book1.name = "햄릿"
		book1.genre = "비극"
		book1.author = "셰익스피어"
		
		//book1.bookPrint()
		
		
		let book2 = Book()
		book2.name = "누구를 위하여 종을 울리나"
		book2.genre = "전쟁소설"
		book2.author = "헤밍웨이"
		
		//book2.bookPrint()
		
		let book3 = Book()
		book3.name = "죄와벌"
		book3.genre = "사실주의"
		book3.author = "톨스토이"
		
		//book3.bookPrint()
		
		myBook.addBook(book1)
		myBook.addBook(book2)
		myBook.addBook(book3)
		
		countLable.text = "\(myBook.countBook())"
	}
	
	@IBAction func showAllBookAction(_ sender:AnyObject){
//		print(myBook.showAllBook())
		outputTextView.text = myBook.showAllBook()
	}
	
	@IBAction func addBookAction(_ sender:AnyObject){
		let book = Book()
		book.name = nameTextField.text!
		book.author = authorTextField.text!
		book.genre = genreTextField.text!
		myBook.addBook(book)
		outputTextView.text = "\(nameTextField.text!) 도서가 등록되었습니다."
		countLable.text = "\(myBook.countBook())"
	}
	
	@IBAction func findBookAction(_ sender:AnyObject){
		let resultBook = myBook.findBook(nameTextField.text!)
		if resultBook != nil {
			outputTextView.text = resultBook
		}else{
			outputTextView.text = "찾으시는 책이 없습니다."
		}
	}
	
	@IBAction func reomveBookAction(_ sender:AnyObject){
		let deleteBook = myBook.removeBook(nameTextField.text!)
		if deleteBook == true{
			outputTextView.text = "\(nameTextField.text!) 도서가 지워졌습니다."
			countLable.text = "\(myBook.countBook())"
		}else {
			outputTextView.text = "지우려는 책이 없습니다"
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

