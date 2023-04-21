
import UIKit
import FacebookCore
import FacebookLogin

class ViewController: UIViewController {

    @IBOutlet weak var fbButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    private var isLoggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustFontSize()

        let facebookLoginButton = FBLoginButton()
        facebookLoginButton.delegate = self

        facebookLoginButton.frame = fbButton.frame
        
        fbButton.removeFromSuperview()

        view.addSubview(facebookLoginButton)
        
        if AccessToken.current != nil {
            isLoggedIn = true
        }
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        if isLoggedIn {
            performSegue(withIdentifier: "goToCalendar", sender: nil)
        } else {
            let alertController = UIAlertController(title: "Not Logged In", message: "Please log in first", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
}

extension ViewController: LoginButtonDelegate{
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

