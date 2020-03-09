
import UIKit

protocol AddViewControllerProtocol:class {
    func addButtonTapped(name:String,description:String,latitude:String,longitude:String)
}

class AddViewController: UIViewController {


    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var descriptionTV: UITextView!
    
    
    @IBOutlet weak var latitudeTF: UITextField!
    
    
    @IBOutlet weak var longitudeTF: UITextField!
    
    weak var delegate:AddViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTF.placeholder = "Name"
        self.descriptionTV.text = "enter description"
        self.latitudeTF.placeholder = "Longitude"
        self.longitudeTF.placeholder = "Latitude"
        self.descriptionTV.layer.borderColor = UIColor.lightGray.cgColor
        self.descriptionTV.layer.borderWidth = 1.0
    }
    
    func showAnAlert(message:String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func isAllFieldsFilled() -> Bool{
        
        if nameTF.text?.count == 0{
            //show an alert
            
            showAnAlert(message: "Please Enter the name")
            return false
        }
            
        if descriptionTV.text.count < 5{
            //show an alert
            showAnAlert(message: "Please Enter the description atleast 5 letters")
            return false
        }
        
        if latitudeTF.text!.count < 3{
            //show an alert
            showAnAlert(message: "Please Enter the latitude atleast 3 letters")
            return false
        }
        
        if longitudeTF.text!.count < 3{
            //show an alert
            showAnAlert(message: "Please Enter the longitude atleast 3 letters")
            return false
        }
        
        return true
        
    }
    
    
    @IBAction func AddButtonTapped(_ sender: Any) {
        
        if isAllFieldsFilled() == true {
            //call the delegate emthod
            
            self.delegate?.addButtonTapped(name: nameTF.text!, description: descriptionTV.text!, latitude: latitudeTF.text!, longitude: longitudeTF.text!)
            
            self.navigationController?.popViewController(animated: true)
        }
        
        
    }
    
}
