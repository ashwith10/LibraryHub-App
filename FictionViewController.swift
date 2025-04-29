//
//  FictionViewController.swift
//  LibraryHub_App
//
//  Created by Shreyesh Chennagouni on 4/3/25.
//

import UIKit
import AVFoundation

class FictionViewController: UIViewController {
    
    @IBOutlet weak var fBookidOL: UILabel!
    
    @IBOutlet weak var fBookNameOL: UILabel!
    
    @IBOutlet weak var fAuthorOL: UILabel!
    
    @IBOutlet weak var fAvailableOL: UILabel!
    
    @IBOutlet weak var fImageOL: UIImageView!
    
    @IBOutlet weak var prevBtnOL: UIButton!
    
    @IBOutlet weak var nextBtnOL: UIButton!
    
    var imageIndex = 0
    
    //    let fictionBooks = [
    //        ["101", "To Kill a Mockingbird", "Harper Lee", "5", "mockingbird"],
    //        ["102", "1984", "George Orwell", "3", "1984"],
    //        ["103", "Pride and Prejudice", "Jane Austen", "6", "pride.jpg"],
    //        ["104", "The Great Gatsby", "F. Scott Fitzgerald", "4", "gatsby"],
    //        ["105", "Moby Dick", "Herman Melville", "2", "mobydick"],
    //        ["106", "The Catcher in the Rye", "J.D. Salinger", "4", "catcher"],
    //        ["107", "Brave New World", "Aldous Huxley", "7", "bravenewworld"],
    //        ["108", "The Lord of the Rings", "J.R.R. Tolkien", "6", "lordoftherings"],
    //        ["109", "Animal Farm", "George Orwell", "5", "animalfarm"],
    //        ["110", "The Chronicles of Narnia", "C.S. Lewis", "3", "narnia"]
    //    ]
    
    var books: [Book] = []              // All books received from ViewController
    var fictionBooks: [Book] = []        // Only fiction books (IDs 101-110)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        fictionBooks = books.filter { book in
            if let id = Int(book.id) {
                return id >= 101 && id <= 110
            }
            return false
        }
        
        if !fictionBooks.isEmpty {
            updateBookDetails(imageIndex)
        }
        
        // Initial button states
        prevBtnOL.isEnabled = false
        nextBtnOL.isEnabled = fictionBooks.count > 1
    }
    
    
    @IBAction func fPrevBtnClicked(_ sender: UIButton) {
        playSound(1114)
        if imageIndex > 0 {
            imageIndex -= 1
            updateBookDetails(imageIndex)
        }
        
        nextBtnOL.isEnabled = true
        prevBtnOL.isEnabled = imageIndex > 0
    }
    
    @IBAction func fNextBtnClicked(_ sender: UIButton) {
        playSound(1114)
        if imageIndex < fictionBooks.count - 1 {
            imageIndex += 1
            updateBookDetails(imageIndex)
        }
        
        prevBtnOL.isEnabled = true
        nextBtnOL.isEnabled = imageIndex < fictionBooks.count - 1
    }
    
    
    func updateBookDetails (_ imageIndex: Int) {
        let book = fictionBooks[imageIndex]
        fBookidOL.text = "Book ID: \(book.id)"
        fBookNameOL.text = "Book Name: \(book.title)"
        fAuthorOL.text = "Author: \(book.author)"
        fAvailableOL.text = "Available: \(book.copies)"
        fImageOL.image = UIImage(named: book.imageName)
        
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


