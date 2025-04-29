//
//  ReturnViewController.swift
//  LibraryHub_App
//
//  Created by Shreyesh Chennagouni on 4/3/25.
//

import UIKit
import AVFoundation


class ReturnViewController: UIViewController {
    
    @IBOutlet weak var returnBookidOL: UITextField!
    
    @IBOutlet weak var returnBookDetailsOL: UILabel!
    
    @IBOutlet weak var returnImageOL: UIImageView!
    
    @IBOutlet weak var returnStatusOL: UILabel!
    
    var returnBooks: [Book] = []
    var selectedBook: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        returnStatusOL.text = ""
        returnBookDetailsOL.text = ""
        returnImageOL.image = nil
    }
    
    @IBAction func rSearchBtnClicked(_ sender: UIButton) {
        playSound(1004)
        guard let enteredID = returnBookidOL.text, !enteredID.isEmpty else {
            returnStatusOL.text = "Please enter a Book ID."
            return
        }
        
        if let foundBook = returnBooks.first(where: { $0.id == enteredID }) {
            selectedBook = foundBook
            returnBookDetailsOL.text = """
                        Title: \(foundBook.title)
                        Author: \(foundBook.author)
                        Available Copies: \(foundBook.copies)
                    """
            returnImageOL.image = UIImage(named: foundBook.imageName)
            returnStatusOL.text = ""
        } else {
            selectedBook = nil
            returnBookDetailsOL.text = ""
            returnImageOL.image = nil
            returnStatusOL.text = "Book not found."
        }
    }
    
    @IBAction func returnBtnClicked(_ sender: UIButton) {
        playSound(1103)
        guard let book = selectedBook else {
            returnStatusOL.text = "Please search and select a book first."
            return
        }
        
        book.copies += 1
        returnBookDetailsOL.text = """
                    Title: \(book.title)
                    Author: \(book.author)
                    Updated Copies: \(book.copies)
                """
        returnStatusOL.text = "Returned successfully! Thank you. 😁"
        returnImageOL.image = UIImage(named: book.imageName)
        selectedBook = nil
    }
    
    func playSound(_ soundID: SystemSoundID) {
        AudioServicesPlaySystemSound(soundID)
    }
}
            

            /*
            // MARK: - Navigation

            // In a storyboard-based application, you will often want to do a little preparation before navigation
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


