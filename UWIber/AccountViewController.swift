//
//  AccountViewController.swift
//  UWIber
//
//  Created by Lois-Anne Hall on 14/06/2021.
//

import Foundation
import UIKit
import MapKit

class AccountViewController: UIViewController, MKMapViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var passwordVisible: UIImageView!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var dob: UIDatePicker!
    @IBOutlet weak var telephoneNumber: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    
}
