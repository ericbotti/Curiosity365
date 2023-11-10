//
//  SignUpViewController.swift
//  Curiosity365
//
//  Created by Eric Bottinelli on 05.09.19.
//  Copyright © 2019 Eric Bottinelli. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField:UITextField!
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    
    @IBOutlet weak var image_DefaultPicture: UIImageView!
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Username text field
               
        usernameTextField.backgroundColor = UIColor.clear
        usernameTextField.tintColor = UIColor.white
        usernameTextField.textColor = UIColor.white
        usernameTextField.attributedPlaceholder = NSAttributedString(string: usernameTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        let bottomLayerUsername = CALayer()
        bottomLayerUsername.frame = CGRect(x: 0, y: 40, width: 374, height: 0.6)
        bottomLayerUsername.backgroundColor = UIColor.white.cgColor
        usernameTextField.layer.addSublayer(bottomLayerUsername)
        
        // Email text field
               
        emailTextField.backgroundColor = UIColor.clear
        emailTextField.tintColor = UIColor.white
        emailTextField.textColor = UIColor.white
        emailTextField.attributedPlaceholder = NSAttributedString(string: emailTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        let bottomLayerEmail = CALayer()
        bottomLayerEmail.frame = CGRect(x: 0, y: 40, width: 374, height: 0.6)
        bottomLayerEmail.backgroundColor = UIColor.white.cgColor
        emailTextField.layer.addSublayer(bottomLayerEmail)

        // Password text field

        passwordTextField.backgroundColor = UIColor.clear
        passwordTextField.tintColor = UIColor.white
        passwordTextField.textColor = UIColor.white
        passwordTextField.attributedPlaceholder = NSAttributedString(string: passwordTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        let bottomLayerPassword = CALayer()
        bottomLayerPassword.frame = CGRect(x: 0, y: 40, width: 374, height: 0.6)
        bottomLayerPassword.backgroundColor = UIColor.white.cgColor
        passwordTextField.layer.addSublayer(bottomLayerPassword)
        
        // Profile image
        
        image_DefaultPicture.layer.cornerRadius = 40
        image_DefaultPicture.clipsToBounds = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.handleSelectProfileImageView))
        image_DefaultPicture.addGestureRecognizer(tapGesture)
        image_DefaultPicture.isUserInteractionEnabled = true
        
    }
    
    @objc func handleSelectProfileImageView(){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func dismiss_onClick(_ sender: Any) { //click su "Hai un account? Accedi." ti porta alla SignIn page
        dismiss(animated: true, completion: nil)
    }
    // Dopo aver cliccato "Registrati", il programma si connette con Firebase per la creazione di un nuovo utente.
    @IBAction func signUpButton_TouchUpInside(_ sender: Any) {
        
        // Codici per la creazione di un utente su firebase mediante l'inserimento dei dati nella sezione SignUp dell'app.
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user: AuthDataResult?, error) in
            if error != nil{
                print(error!.localizedDescription)
                return
            }
            
            let uid = user!.user.uid
            let storageRef = Storage.storage().reference(forURL: "gs://curiosity365-1876a.appspot.com").child("profile_image").child(uid)
            if let profileImg = self.selectedImage, let imageData = profileImg.jpegData(compressionQuality: 0.1) {
                storageRef.putData(imageData, metadata: nil, completion: { (metadata, error) in
                    if error != nil, metadata != nil {
                        print(error ?? "")
                        return
                    }
                    
                    let ref = Database.database().reference()
                    let usersReference = ref.child("users")
                    
                    // let profileImageUrl = metadata?.downloadURL()?.absoluteString Vecchia versione
                    
                    storageRef.downloadURL(completion: { (url, error) in
                        if error != nil {
                            print(error!.localizedDescription)
                            return
                        }
                        if let profileImageUrl = url?.absoluteString {
                            let newUserReference = usersReference.child(uid)
                            newUserReference.setValue(["username": self.usernameTextField.text!, "email": self.emailTextField.text!, "profileImageUrl": profileImageUrl])
                
                        }
                    })

                    /*
                    let ref = Database.database().reference()
                    let usersReference = ref.child("users")
                    // https://curiosity365-1876a.firebaseio.com/users
                    
                    let newUserReference = usersReference.child(uid)
                    newUserReference.setValue(["username": self.usernameTextField.text!, "email": self.emailTextField.text!])
                    */
                    
                })
            }
            /*
            let ref = Database.database().reference()
            let usersReference = ref.child("users")
            // https://curiosity365-1876a.firebaseio.com/users
            
            let newUserReference = usersReference.child(uid)
            newUserReference.setValue(["username": self.usernameTextField.text!, "email": self.emailTextField.text!])
 */
        })
    }
}

// Ci permettere di utilizzare alcuni codici per inserire le foto nel database
extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImage = image // Send to firebase
            image_DefaultPicture.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}
  
