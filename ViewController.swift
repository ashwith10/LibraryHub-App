//
//  ViewController.swift
//  LibraryHub_App
//
//  Created by Shreyesh Chennagouni on 4/3/25.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var videoBackgroundView: UIView!
    
    @IBOutlet weak var userLabelOL: UILabel!
    
    @IBOutlet weak var homeImgOL: UIImageView!
    
    @IBOutlet weak var borrowBtnOL: UIButton!
    
    @IBOutlet weak var returnBtnOL: UIButton!
    
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    var isVideoPlaying = true
    
    static var loggedInUsername: String?
    
    var books: [Book] = [
        Book(id: "101", title: "To Kill a Mockingbird", author: "Harper Lee", copies: 5, imageName: "mockingbird"),
        Book(id: "102", title: "1984", author: "George Orwell", copies: 0, imageName: "1984"),
        Book(id: "103", title: "Pride and Prejudice", author: "Jane Austen", copies: 6, imageName: "pride.jpg"),
        Book(id: "104", title: "The Great Gatsby", author: "F. Scott Fitzgerald", copies: 4, imageName: "gatsby"),
        Book(id: "105", title: "Moby Dick", author: "Herman Melville", copies: 2, imageName: "mobydick"),
        Book(id: "106", title: "The Catcher in the Rye", author: "J.D. Salinger", copies: 4, imageName: "catcher"),
        Book(id: "107", title: "Brave New World", author: "Aldous Huxley", copies: 7, imageName: "bravenewworld"),
        Book(id: "108", title: "The Lord of the Rings", author: "J.R.R. Tolkien", copies: 6, imageName: "lordoftherings"),
        Book(id: "109", title: "Animal Farm", author: "George Orwell", copies: 5, imageName: "animalfarm"),
        Book(id: "110", title: "The Chronicles of Narnia", author: "C.S. Lewis", copies: 3, imageName: "narnia"),
        
        Book(id: "201", title: "Sapiens", author: "Yuval Noah Harari", copies: 7, imageName: "sapiens"),
        Book(id: "202", title: "Educated", author: "Tara Westover", copies: 2, imageName: "educated"),
        Book(id: "203", title: "The Immortal Life of Henrietta Lacks", author: "Rebecca Skloot", copies: 5, imageName: "henrietta"),
        Book(id: "204", title: "Becoming", author: "Michelle Obama", copies: 6, imageName: "becoming"),
        Book(id: "205", title: "Quiet: The Power of Introverts", author: "Susan Cain", copies: 4, imageName: "quiet"),
        Book(id: "206", title: "The Wright Brothers", author: "David McCullough", copies: 3, imageName: "wrightbrothers"),
        Book(id: "207", title: "Outliers", author: "Malcolm Gladwell", copies: 8, imageName: "outliers"),
        Book(id: "208", title: "The Subtle Art of Not Giving a F*ck", author: "Mark Manson", copies: 5, imageName: "subtleart"),
        Book(id: "209", title: "Atomic Habits", author: "James Clear", copies: 9, imageName: "atomichabits"),
        Book(id: "210", title: "The Power of Habit", author: "Charles Duhigg", copies: 4, imageName: "powerofhabit"),
        
        Book(id: "301", title: "Dune", author: "Frank Herbert", copies: 4, imageName: "dune"),
        Book(id: "302", title: "Neuromancer", author: "William Gibson", copies: 0, imageName: "neuromancer"),
        Book(id: "303", title: "Foundation", author: "Isaac Asimov", copies: 3, imageName: "foundation"),
        Book(id: "304", title: "The Left Hand of Darkness", author: "Ursula K. Le Guin", copies: 5, imageName: "lefthand"),
        Book(id: "305", title: "The Martian", author: "Andy Weir", copies: 6, imageName: "martian"),
        Book(id: "306", title: "Hyperion", author: "Dan Simmons", copies: 4, imageName: "hyperion"),
        Book(id: "307", title: "The Hobbit", author: "J.R.R. Tolkien", copies: 8, imageName: "hobbit"),
        Book(id: "308", title: "Brave New World", author: "Aldous Huxley", copies: 5, imageName: "bravenewworld_sci"),
        Book(id: "309", title: "Ender's Game", author: "Orson Scott Card", copies: 7, imageName: "endersgame"),
        Book(id: "310", title: "Snow Crash", author: "Neal Stephenson", copies: 6, imageName: "snowcrash")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        homeImageOL.image = UIImage(named: "homeImg")
        setupVideoBackground()
        
        updateUserLabel()
        
        homeImgOL.image=UIImage(named: "homeImg")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition=segue.identifier
        if transition=="BorrowSegue"
        {
            var destination=segue.destination as! BorrowViewController
            destination.borrowBooks = books
        }
        else if transition=="ReturnSegue"
        {
            var destination=segue.destination as! ReturnViewController
            destination.returnBooks = books
        }
        else if transition == "CategorySegue" {
            var destination = segue.destination as! CategoryViewController
            destination.books = books
        }
    }
    
    func updateUserLabel() {
        if let username = ViewController.loggedInUsername {
                userLabelOL.text = "Hello \(username) 👋"
                borrowBtnOL.isEnabled = true
                returnBtnOL.isEnabled = true
                borrowBtnOL.alpha = 1.0    // Make buttons look normal
                returnBtnOL.alpha = 1.0
            } else {
                userLabelOL.text = "Hello Guest! 👋  Please Login to Borrow or Return a book!"
                borrowBtnOL.isEnabled = false
                returnBtnOL.isEnabled = false
                borrowBtnOL.alpha = 0.5    // Make buttons look faded
                returnBtnOL.alpha = 0.5
            }
        }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            updateUserLabel()  // ⬅️ Refresh every time we come back
        }
    
    
    func setupVideoBackground() {
        if let path = Bundle.main.path(forResource: "libApp", ofType: "mp4") {
            let url = URL(fileURLWithPath: path)
            player = AVPlayer(url: url)
            
            playerLayer = AVPlayerLayer(player: player)
            playerLayer?.frame = videoBackgroundView.bounds
            playerLayer?.videoGravity = .resizeAspectFill
            
            if let layer = playerLayer {
                videoBackgroundView.layer.addSublayer(layer)
            }
            
            player?.play()
            isVideoPlaying = true
            
            // Loop the video
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(restartVideo),
                                                   name: .AVPlayerItemDidPlayToEndTime,
                                                   object: player?.currentItem)
        } else {
            print("❌ Video file 'libApp.mp4' not found.")
        }
    }
    
    @objc func restartVideo() {
        player?.seek(to: .zero)
        player?.play()
    }
    
    @IBAction func booksBtnClicked(_ sender: UIButton) {
        playSound(1103)
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        playSound(1103)
    }
    
    @IBAction func BorrowBtnClicked(_ sender: UIButton) {
        playSound(1103)
    }
    
    @IBAction func returnBtnClicked(_ sender: UIButton) {
        playSound(1103)
    }
    
    func playSound(_ soundID: SystemSoundID) {
                AudioServicesPlaySystemSound(soundID)
            }
    
}


