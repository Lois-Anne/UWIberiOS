//
//  RequestRideController.swift
//  UWIber
//
//  Created by Lois-Anne Hall on 14/06/2021.
//

import Foundation
import UIKit
import MapKit

class RequestRideController: UIViewController, MKMapViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var carType: UILabel!
    @IBOutlet weak var carsPicker: UIPickerView!
    
    override func viewDidLoad() {
        carType.layer.shadowColor = UIColor.black.cgColor
        carType.layer.shadowRadius = 3.0
        carType.layer.shadowOpacity = 0.45
        carType.layer.shadowOffset = CGSize(width: 0, height: 0)
        carType.layer.masksToBounds = false
    }
    
}