import Foundation
import UIKit
import MapKit
import Alamofire

class RequestRideController: UIViewController, MKMapViewDelegate, UITextFieldDelegate {


    @IBOutlet weak var pickupField: UITextField!
    @IBOutlet weak var dropoffField: UITextField!
    @IBOutlet weak var carTypeField: UITextField!

    @IBOutlet weak var carType: UILabel!
    @IBOutlet weak var rideBtn: UIButton!

    var pickupPicker = UIPickerView()
    var dropoffPicker = UIPickerView()
    var carPicker = UIPickerView()

    let locations = ["UWI- Mona Campus", "Papine - Irvine Hall", "Liguanea - Sovereign Centre", "Half Way Tree - Transport Centre", "Liguanea - Wendy's", "Waterloo - Fontana", "Half Way Tree - Express Fitness"]

    let carTypes = ["Toyota|Corolla", "Honda|Fit", "Cadillac|Escalade", "Toyota|HiAce"]

    private func enableRideBtn() {
        if dropoffField.text != pickupField.text && pickupField.text != "" && dropoffField.text != "" && carTypeField.text != "" {
            rideBtn.isHidden = false
        }
        else{
            rideBtn.isHidden = true
        }
    }

    override func viewDidLoad() {
        rideBtn.isHidden = true
        carType.layer.shadowColor = UIColor.black.cgColor
        carType.layer.shadowRadius = 3.0
        carType.layer.shadowOpacity = 0.45
        carType.layer.shadowOffset = CGSize(width: 0, height: 0)
        carType.layer.masksToBounds = false

        pickupField.inputView = pickupPicker
        dropoffField.inputView = dropoffPicker
        carTypeField.inputView = carPicker

        pickupField.placeholder = "Select your pickup location"
        dropoffField.placeholder = "Select your drop-off location"
        carTypeField.placeholder = "Select the type of vehicle"

        pickupField.textAlignment = .center
        dropoffField.textAlignment = .center
        carTypeField.textAlignment = .center

        pickupPicker.dataSource = self
        pickupPicker.delegate = self
        

        dropoffPicker.dataSource = self
        dropoffPicker.delegate = self
        
        carPicker.dataSource = self
        carPicker.delegate = self

        pickupPicker.tag = 1
        dropoffPicker.tag = 2
        carPicker.tag = 3


    }



}

extension RequestRideController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        switch pickerView.tag {
        case 1:
            return locations.count
        case 2:
            return locations.count
        case 3:
            return carTypes.count
        default:
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        switch pickerView.tag {
        case 1:
            return locations[row]
        case 2:
            return locations[row]
        case 3:
            return carTypes[row]
        default:
            return "Data not found"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            pickupField.text = locations[row]
            pickupField.resignFirstResponder()
            enableRideBtn()
        case 2:
            dropoffField.text = locations[row]
            dropoffField.resignFirstResponder()
            enableRideBtn()
        case 3:
            carTypeField.text = carTypes[row]
            carTypeField.resignFirstResponder()
            enableRideBtn()
        default:
            return
        }

    }
}
