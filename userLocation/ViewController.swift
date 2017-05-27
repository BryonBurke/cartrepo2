//
//  ViewController.swift
//  userLocation
//
//  Created by Macbook on 5/2/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    //Map
    @IBOutlet weak var map: MKMapView!
    
    let manager=CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let span:MKCoordinateSpan=MKCoordinateSpanMake(0.01,0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude,location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region, animated: true)
        self.map.showsUserLocation = true
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate=self
        manager.desiredAccuracy=kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addPin(_ sender: UILongPressGestureRecognizer) {
        
        let location = sender.location(in: self.map)
        let locCoord = self.map.convert(location, toCoordinateFrom: self.map)
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = locCoord
        annotation.title = "New Pod"
        annotation.subtitle = "hell yeas!!"
        map.addAnnotation(annotation)

        
        self.map.removeAnnotations(map.annotations)
        self.map.addAnnotation(annotation)
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        let identifier = "CustomAnnotation"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        //if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
            annotationView!.image = UIImage(named: "pod.png")!   // go ahead and use forced unwrapping and you'll be notified if it can't be found; alternatively, use `guard` statement to accomplish the same thing and show a custom error message
        //} else {
            //annotationView!.annotation = annotation
        //}
        
        return annotationView
    }
    


}

