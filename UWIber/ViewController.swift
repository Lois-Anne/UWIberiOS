//
//  ViewController.swift
//  UWIber
//
//  Created by Lois-Anne Hall on 09/05/2021.
//

import UIKit
import MapKit



class ViewController: UIViewController, MKMapViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var locationView: UIView!
    @IBOutlet var homeMap: MKMapView!
    @IBOutlet weak var pickupTitle: UILabel!
    @IBOutlet weak var dropoffTitle: UILabel!
    @IBOutlet weak var switchBtn: UIButton!
    @IBOutlet weak var rideBtn: UIButton!
    
    
    @IBOutlet weak var dropoffText: UITextField!
    @IBOutlet weak var pickupText: UITextField!
    

    let boldStyle = UIFont.boldSystemFont(ofSize: 16.0)
    let regularStyle = UIFont.systemFont(ofSize: 15.0)
    var pickupCounter = 0
    var currentBluePin: MKMarkerAnnotationView = MKMarkerAnnotationView()
    var currentGreenPin: MKMarkerAnnotationView = MKMarkerAnnotationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickupTitle.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        
        homeMap.delegate = self
        self.configureMap()
        self.placePins()
        
        rideBtn.isHidden = true
        
    }
    func configureMap(){
        let center = CLLocationCoordinate2D(latitude: 18.019870747171865, longitude: -76.76657658900501)
        let region = MKCoordinateRegion(center:center, latitudinalMeters: 5000, longitudinalMeters: 8000)
        homeMap.setRegion(region, animated: true)
    }
    func placePins() {
        let coordinates = [
            CLLocationCoordinate2D(latitude: 18.004683, longitude: -76.745176),
            CLLocationCoordinate2D(latitude: 18.0056517, longitude: -76.7424631),
            CLLocationCoordinate2D(latitude: 18.0215699, longitude: -76.7691380),
            CLLocationCoordinate2D(latitude: 18.0113407, longitude: -76.7992441),
            CLLocationCoordinate2D(latitude: 18.019870747171865, longitude: -76.76657658900501),
            CLLocationCoordinate2D(latitude: 18.018574215548618, longitude: -76.79195045139824),
            CLLocationCoordinate2D(latitude: 18.015803829987163, longitude: -76.79574850063887)
        ]
        let titles = [
             "UWI - Mona Campus",
             "Papine - Irvine Hall",
             "Liguanea - Sovereign Centre",
              "Half Way Tree - Transport Centre",
              "Liguanea - Wendy's",
              "Waterloo - Fontana",
              "Half Way Tree - Express Fitness"
        ]
        for pin in coordinates.indices {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinates[pin]
            annotation.title = titles[pin]
            homeMap.addAnnotation(annotation)
        }
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if case pickupTitle.font = boldStyle {
            _ = pickupText.text
            let pickupAnnotation = view.annotation
            let markerText = pickupAnnotation?.title
            
            if let pickupSelector = markerText {
                pickupText.text = pickupSelector
            }
            if let view = view as? MKMarkerAnnotationView {
                view.markerTintColor = UIColor.systemBlue
            }

            
        }
        else{
            if case dropoffTitle.font = boldStyle {
                _ = dropoffText.text
                let markerText = view.annotation?.title
                if let dropoffSelector = markerText {
                    dropoffText.text = dropoffSelector
                }
                if let view = view as? MKMarkerAnnotationView {
                    currentGreenPin.markerTintColor = UIColor.systemRed
                    view.markerTintColor = UIColor.systemGreen
                    currentGreenPin = view

                }
            }
        }
        if dropoffText.text != pickupText.text && pickupText.text != "" && dropoffText.text != "" {
            rideBtn.isHidden = false
        }
    }
    
    @IBAction func switchLocation(_ sender: UIButton) {
        if dropoffTitle.font != boldStyle{
            dropoffTitle.font = boldStyle
            pickupTitle.font = regularStyle
        }
        else{
            dropoffTitle.font = regularStyle
            pickupTitle.font = boldStyle
        }
         
    }
//    private func textField(pickupText: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//
//        let text = (pickupText.text! as NSString).replacingCharacters(in: range, with: string)
//
//        if !text.isEmpty{
//            rideBtn.isHidden = false
////            rideBtn.isUserInteractionEnabled = true
//        }
//        else{
//            rideBtn.isHidden = true
//        }
//        return true
//    }
    
    @IBAction func pickupDidEnd(_ sender: UITextField) {
       
    }
    @IBAction func enableRide(_ sender: Any) {
        
        
    }
    
}

