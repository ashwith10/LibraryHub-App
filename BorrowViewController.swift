//
//  BorrowViewController.swift
//  LibraryHub_App
//
//  Created by Shreyesh Chennagouni on 4/3/25.
//

import UIKit
import AVFoundation


class BorrowViewController: UIViewController {
    
    @IBOutlet weak var borrowBookidOL: UITextField!
    
    @IBOutlet weak var borrowBookDetailsOL: UILabel!
    
    @IBOutlet weak var borrowImageOL: UIImageView!
    
    @IBOutlet weak var borrowStatusOL: UILabel!
    
    var borrowBooks: [Book] = []
        var currentBook: Book?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        borrowStatusOL.text = ""
                borrowBookDetailsOL.text = ""
                borrowImageOL.image = nil
    }
    
    @IBAction func bSearchBtnClicked(_ sender: UIButton) {
        playSound(1004)
        guard let enteredID = borrowBookidOL.text, !enteredID.isEmpty else {
                    borrowStatusOL.text = "Please enter a Book ID."
                    return
                }

                if let foundBook = borrowBooks.first(where: { $0.id == enteredID }) {
                    currentBook = foundBook
                    borrowBookDetailsOL.text = "Title: \(foundBook.title)\nAuthor: \(foundBook.author)\nAvailable Copies: \(foundBook.copies)"
                    borrowImageOL.image = UIImage(named: foundBook.imageName)
                    borrowStatusOL.text = ""
                } else {
                    currentBook = nil
                    borrowBookDetailsOL.text = ""
                    borrowImageOL.image = nil
                    borrowStatusOL.text = "Book not found."
                }
    }
    
    @IBAction func borrowBtnClicked(_ sender: UIButton) {
        playSound(1103)
        guard let book = currentBook else {
                    borrowStatusOL.text = "Please search and select a book first."
                    return
                }

                if book.copies > 0 {
                    book.copies -= 1
                    borrowBookDetailsOL.text = "Title: \(book.title)\nAuthor: \(book.author)\nAvailable Copies: \(book.copies)"
                    borrowStatusOL.text = "Book Borrowed successfully! You can collect it from Library.  "
                } else {
                    borrowStatusOL.text = "No copies available."
                }
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


