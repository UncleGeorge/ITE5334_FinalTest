
import UIKit
import FacebookCore
import FacebookLogin

class ViewController: UIViewController {
    
    // facebook button in the storyboard layout, same to figma
    @IBOutlet weak var fbButton: UIButton!
    
    // The login button can jump to the next page at the bottom of the screen
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var isLoggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.setCursorOffset(offset: 20)
        passwordTextField.setCursorOffset(offset: 20)
        adjustFontSize()
        
        // login button provided by facebook
        let facebookLoginButton = FBLoginButton()
        facebookLoginButton.delegate = self
        
        // Replace layout's button with facebook's login button
        facebookLoginButton.frame = fbButton.frame
        fbButton.removeFromSuperview()
        view.addSubview(facebookLoginButton)
        
        // Set isLoggedIn to true if there is currently an token for Facebook
        if AccessToken.current != nil {
            isLoggedIn = true
        }
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        
        if isLoggedIn {
            // If already logged in facebook, then user can jump to the next page
            performSegue(withIdentifier: "goToCalendar", sender: nil)
        } else {
            // Prompt the user to log in first
            let alertController = UIAlertController(title: "Not Logged In", message: "Please log in first", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
}

extension ViewController: LoginButtonDelegate{
    
    // Executed after login button is clicked, if login is successful set isLoggedIn to true
    func loginButton(_ loginButton: FBSDKLoginKit.FBLoginButton, didCompleteWith result: FBSDKLoginKit.LoginManagerLoginResult?, error: Error?) {
        
        if let error = error {
            print("Error occurred during login: \(error.localizedDescription)")
        } else if let result = result, !result.isCancelled {
            isLoggedIn = true
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginKit.FBLoginButton) {
        isLoggedIn = false
    }
    
    
}

