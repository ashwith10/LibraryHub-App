//
//  CategoryViewController.swift
//  LibraryHub_App
//
//  Created by Shreyesh Chennagouni on 4/3/25.
//

import UIKit
import AVFoundation

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var quoteImageOL: UIImageView!
    
    var books: [Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        quoteImageOL.image=UIImage(named: "libQuote")
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition=segue.identifier
        if transition == "FictionSegue" {
            let destination = segue.destination as! FictionViewController
            destination.books = books
        }
        else if transition == "NonFictionSegue" {
            let destination = segue.destination as! NonFictionViewController
            destination.books = books
        }
        else if transition == "SciFiSegue" {
            let destination = segue.destination as! SciFiViewController
            destination.books = books
        }
    }
    
    @IBAction func fictionBtnClicked(_ sender: UIButton) {
        playSound(1103)
    }
    
    
    @IBAction func nonfictionBtnClicked(_ sender: UIButton) {
        playSound(1103)
 }
    
    @IBAction func sciBtnClicked(_ sender: UIButton) {
        playSound(1103)
}
    
    
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
    func playSound(_ soundID: SystemSoundID) {
                AudioServicesPlaySystemSound(soundID)
            }
        
    }
