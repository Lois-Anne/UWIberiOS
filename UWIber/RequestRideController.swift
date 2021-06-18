//
//  RequestRideController.swift
//  UWIber
//
//  Created by Lois-Anne Hall on 14/06/2021.
//

import Foundation
import UIKit
import MapKit
import Alamofire

class RequestRideController: UIViewController, MKMapViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var pickupPicker: UIPickerView!
    @IBOutlet weak var dropoffPicker: UIPickerView!

    @IBOutlet weak var carType: UILabel!
    @IBOutlet weak var carsPicker: UIPickerView!
    @IBOutlet weak var rideBtn: UIButton!



    override func viewDidLoad() {
        rideBtn.isHidden = true
        carType.layer.shadowColor = UIColor.black.cgColor
        carType.layer.shadowRadius = 3.0
        carType.layer.shadowOpacity = 0.45
        carType.layer.shadowOffset = CGSize(width: 0, height: 0)
        carType.layer.masksToBounds = false

        pickupPicker.dataSource = self
        pickupPicker.delegate = self

        dropoffPicker.dataSource = self
        dropoffPicker.delegate = self

    }
//
//        if pickupField.text != pickupField.text && pickupField.text != "" && dropoffField.text != "" {
//            rideBtn.isHidden = false
//        }
}
extension RequestRideController {

    func getLocations() {
        //return array of location names

    }
}
extension RequestRideController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //replace with return locationName.count
        return 10
    }
}
extension RequestRideController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if pickerView == pickupPicker {
            //replace with locationName[row]
            return "true"
        }
        //The false is for the dropLocationNames. I believe I can handle that part.. I hope
        return "false"
    }
}
