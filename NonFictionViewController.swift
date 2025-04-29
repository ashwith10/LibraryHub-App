//
//  NonFictionViewController.swift
//  LibraryHub_App
//
//  Created by Shreyesh Chennagouni on 4/3/25.
//

import UIKit
import AVFoundation

class NonFictionViewController: UIViewController {
    
    @IBOutlet weak var nBookidOL: UILabel!
    
    @IBOutlet weak var nBookNameOL: UILabel!
    
    @IBOutlet weak var nAuthorOL: UILabel!
    
    @IBOutlet weak var nAvailableOL: UILabel!
    
    @IBOutlet weak var nImageOL: UIImageView!
    
    @IBOutlet weak var prevBtnOL: UIButton!
    
    @IBOutlet weak var nextBtnOL: UIButton!
    
    var imageIndex = 0
    
    var books: [Book] = []
    
    var nonFictionBooks: [Book] = []
    
    //    let nonFictionBooks = [
    //        ["201", "Sapiens", "Yuval Noah Harari", "7", "sapiens"],
    //        ["202", "Educated", "Tara Westover", "2", "educated"],
    //        ["203", "The Immortal Life of Henrietta Lacks", "Rebecca Skloot", "5", "henrietta"],
    //        ["204", "Becoming", "Michelle Obama", "6", "becoming"],
    //        ["205", "Quiet: The Power of Introverts", "Susan Cain", "4", "quiet"],
    //         ["206", "The Wright Brothers", "David McCullough", "3", "wrightbrothers"],
    //        ["207", "Outliers", "Malcolm Gladwell", "8", "outliers"],
    //        ["208", "The Subtle Art of Not Giving a F*ck", "Mark Manson", "5", "subtleart"],
    //        ["209", "Atomic Habits", "James Clear", "9", "atomichabits"],
    //        ["210", "The Power of Habit", "Charles Duhigg", "4", "powerofhabit"]
    //    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        nonFictionBooks = books.filter { book in
            if let id = Int(book.id) {
                return id >= 201 && id <= 210
            }
            return false
        }
        
        if !nonFictionBooks.isEmpty {
            updateBookDetails(imageIndex)
        }
        
        // Initial button states
        prevBtnOL.isEnabled = false
        nextBtnOL.isEnabled = nonFictionBooks.count > 1
    }
    
    @IBAction func nPrevBtnClicked(_ sender: UIButton) {
        playSound(1114)
        if imageIndex > 0 {
            imageIndex -= 1
            updateBookDetails(imageIndex)
        }
        
        nextBtnOL.isEnabled = true
        prevBtnOL.isEnabled = imageIndex > 0
    }
    
    @IBAction func nNextBtnClicked(_ sender: UIButton) {
        playSound(1114)
        if imageIndex < nonFictionBooks.count - 1 {
            imageIndex += 1
            updateBookDetails(imageIndex)
        }
        
        prevBtnOL.isEnabled = true
        nextBtnOL.isEnabled = imageIndex < nonFictionBooks.count - 1
    }
    
    func updateBookDetails (_ imageIndex: Int) {
        let book = nonFictionBooks[imageIndex]
        nBookidOL.text = "Book ID: \(book.id)"
        nBookNameOL.text = "Book Name: \(book.title)"
        nAuthorOL.text = "Author: \(book.author)"
        nAvailableOL.text = "Available: \(book.copies)"
        nImageOL.image = UIImage(named: book.imageName)
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


