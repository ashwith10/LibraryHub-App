//
//  LoginViewController.swift
//  LibraryHub_App
//
//  Created by Shreyesh Chennagouni on 4/3/25.
//

import UIKit
import AVFoundation


class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameOL: UITextField!
    
    @IBOutlet weak var passwordOL: UITextField!
    
    
    @IBOutlet weak var loginStatusOL: UILabel!
    
    var loggedInUsername: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //loginStatusOL.text = ""
        passwordOL.isSecureTextEntry = true
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        playSound(1114)
        guard let enteredUsername = userNameOL.text, let enteredPassword = passwordOL.text else {
                    showAlert(title: "Missing Information", message: "Please enter both username and password.")
                    return
                }
                
                if let user = users.first(where: { $0.username == enteredUsername && $0.password == enteredPassword }) {
                    ViewController.loggedInUsername = user.username  // ⬅️ Set Static Variable
                    
                    loginStatusOL.text = "✅ Go back to Home Page"
                    loginStatusOL.textColor = .systemGreen
                    
                    playSound(1025)
                    showAlert(title: "Success", message: "Login Successful!") {
                        self.dismiss(animated: true, completion: nil)
                    }
                } else {
                    ViewController.loggedInUsername = nil
                    loginStatusOL.text = "❌ Invalid Credentials"
                    loginStatusOL.textColor = .red
                    showAlert(title: "Login Failed", message: "Invalid Username or Password.")
                }
    }
    
    @IBAction func resetBtnClicked(_ sender: UIButton) {
        playSound(1114)
        userNameOL.text = ""
                passwordOL.text = ""
    }
    
    @IBAction func signinBtnClicked(_ sender: UIButton) {
        playSound(1114)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // Show Alert Function
    func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    func playSound(_ soundID: SystemSoundID) {
                AudioServicesPlaySystemSound(soundID)
            }
}
