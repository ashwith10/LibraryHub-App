//
//  SciFiViewController.swift
//  LibraryHub_App
//
//  Created by Shreyesh Chennagouni on 4/3/25.
//

import UIKit
import AVFoundation

class SciFiViewController: UIViewController {
    
    @IBOutlet weak var sBookidOL: UILabel!
    
    @IBOutlet weak var sBookNameOL: UILabel!
    
    @IBOutlet weak var sAuthorOL: UILabel!
    
    @IBOutlet weak var sAvailableOL: UILabel!
    
    @IBOutlet weak var sImageOL: UIImageView!
    
    @IBOutlet weak var prevBtnOL: UIButton!
    
    @IBOutlet weak var nextBtnOL: UIButton!
    
    var imageIndex = 0
    
    var books: [Book] = []
    
    var sciFiBooks: [Book] = []
    
    //    let sciFiBooks = [
    //        ["301", "Dune", "Frank Herbert", "4", "dune"],
    //        ["302", "Neuromancer", "William Gibson", "0", "neuromancer"],
    //        ["303", "Foundation", "Isaac Asimov", "3", "foundation"],
    //        ["304", "The Left Hand of Darkness", "Ursula K. Le Guin", "5", "lefthand"],
    //        ["305", "The Martian", "Andy Weir", "6", "martian"],
    //        ["306", "Hyperion", "Dan Simmons", "4", "hyperion"],
    //        ["307", "The Hobbit", "J.R.R. Tolkien", "8", "hobbit"],
    //        ["308", "Brave New World", "Aldous Huxley", "5", "bravenewworld_sci"],
    //        ["309", "Ender's Game", "Orson Scott Card", "7", "endersgame"],
    //        ["310", "Snow Crash", "Neal Stephenson", "6", "snowcrash"]
    //    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        sciFiBooks = books.filter { book in
            if let id = Int(book.id) {
                return id >= 301 && id <= 310
            }
            return false
        }
        
        if !sciFiBooks.isEmpty {
            updateBookDetails(imageIndex)
        }
        
        // Initial button states
        prevBtnOL.isEnabled = false
        nextBtnOL.isEnabled = sciFiBooks.count > 1
    }
    
    @IBAction func sPrevBtnClicked(_ sender: UIButton) {
        playSound(1114)
        if imageIndex > 0 {
            imageIndex -= 1
            updateBookDetails(imageIndex)
        }
        
        nextBtnOL.isEnabled = true
        prevBtnOL.isEnabled = imageIndex > 0
    }
    
    
    @IBAction func sNextBtnClicked(_ sender: UIButton) {
        playSound(1114)
        if imageIndex < sciFiBooks.count - 1 {
            imageIndex += 1
            updateBookDetails(imageIndex)
        }
        
        prevBtnOL.isEnabled = true
        nextBtnOL.isEnabled = imageIndex < sciFiBooks.count - 1
    }
    
    
    func updateBookDetails (_ imageIndex: Int) {
        let book = sciFiBooks[imageIndex]
        sBookidOL.text = "Book ID: \(book.id)"
        sBookNameOL.text = "Book Name: \(book.title)"
        sAuthorOL.text = "Author: \(book.author)"
        sAvailableOL.text = "Available: \(book.copies)"
        sImageOL.image = UIImage(named: book.imageName)
        
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

