//
//  SigninViewController.swift
//  LibraryHub_App
//
//  Created by Shreyesh Chennagouni on 4/27/25.
//

import UIKit
import AVFoundation


class SigninViewController: UIViewController {
    
    @IBOutlet weak var usernameOL: UITextField!
    
    @IBOutlet weak var passwordOL: UITextField!
    
    @IBOutlet weak var emailOL: UITextField!
    
    @IBOutlet weak var phoneOL: UITextField!
    
    @IBOutlet weak var signinStatusOL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        signinStatusOL.text = ""
        passwordOL.isSecureTextEntry = true
    }
    
    @IBAction func signinBtnClicked(_ sender: UIButton) {
        playSound(1114)
        guard let username = usernameOL.text, !username.isEmpty,
              let password = passwordOL.text, !password.isEmpty,
              let email = emailOL.text, !email.isEmpty,
              let phone = phoneOL.text, !phone.isEmpty else {
            signinStatusOL.text = "⚠️ Please fill all fields!"
            signinStatusOL.textColor = .red
            return
        }
        if !isValidEmail(email) {
                    signinStatusOL.text = "⚠️ Invalid Email Format!"
                    signinStatusOL.textColor = .red
                    return
                }
                
                if !isValidPhone(phone) {
                    signinStatusOL.text = "⚠️ Invalid Phone Number!"
                    signinStatusOL.textColor = .red
                    return
                }
                
                // Check if username already exists
                if users.contains(where: { $0.username == username }) {
                    signinStatusOL.text = "⚠️ Username already taken!"
                    signinStatusOL.textColor = .red
                    return
                }
                
                // All good, add user
                let newUser = User(username: username, password: password, email: email, phoneNumber: phone)
                users.append(newUser)
                
        playSound(1025)
        signinStatusOL.text = "✅ Sign Up Successful! Go and Login."
                signinStatusOL.textColor = .systemGreen
                
                // Optionally reset fields
                resetFields()
    }
    
    @IBAction func resetBtnClicked(_ sender: UIButton) {
        playSound(1114)
        usernameOL.text = ""
        passwordOL.text = ""
        emailOL.text = ""
        phoneOL.text = ""
    }
    
    func resetFields() {
            usernameOL.text = ""
            passwordOL.text = ""
            emailOL.text = ""
            phoneOL.text = ""
        }
    
    func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
    
    func isValidPhone(_ phone: String) -> Bool {
            let phoneRegEx = "^[0-9]{10}$"   // Basic: 10 digits only
            let phonePred = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
            return phonePred.evaluate(with: phone)
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
