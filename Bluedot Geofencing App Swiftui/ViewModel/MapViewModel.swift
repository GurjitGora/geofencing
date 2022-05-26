//
//  MapViewModel.swift
//  Bluedot Geofencing App Swiftui
//
//  Created by Gurjit Singh on 25/5/2022.
//

import CoreLocation
import MapKit
import SwiftUI

enum mapDefaults {
    static let initialLocation = CLLocationCoordinate2D(latitude: 37.5, longitude: -122.011033)
    static let initialSpan = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
}

final class MapViewModel : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published private(set) var authorizationStatus: UNAuthorizationStatus?
    
    @Published var region: MKCoordinateRegion = MKCoordinateRegion(
        center: mapDefaults.initialLocation,
        span: mapDefaults.initialSpan)
    
    
    // Create Geofence Region with 10 meter radius
    let geofenceRegion = CLCircularRegion(center: mapDefaults.initialLocation,
                                          radius: 10,
                                          identifier: "SafeArea")
    
    var circle = MKCircle(center: mapDefaults.initialLocation, radius: 10)
    
    var locationMangager: CLLocationManager?
    
    func checkLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationMangager = CLLocationManager()
            locationMangager!.delegate = self
            locationMangager?.startUpdatingLocation()
            locationMangager?.startMonitoring(for: geofenceRegion)
            print("Location permission enabled")
        }
        else{
            print("Location permission not enabled")
        }
    }
   
   // Check if user authorized location
   private func checkLocationAuth() {
        guard let locationMangager = locationMangager else {
            return
        }
        
        switch locationMangager.authorizationStatus{
            
        case .notDetermined:
            locationMangager.requestWhenInUseAuthorization()
        case .restricted:
            print("User location access is restricted")
        case .denied:
            print("User denied location access")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationMangager.location!.coordinate, span: mapDefaults.initialSpan)
        @unknown default:
            break
        }
    }
    
    // Check if user changed location after first time
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        //check for location authorization
        checkLocationAuth()
        
        // request for notification access
        requestAuthorization()
    }
    
    // enter safe area (region)
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        triggerLocalNotification(subTitle: "Entering Safe Area", body: "You entered inside the safe area, don't leave if not urgent be safe mate")
    }
    
    // exiting safe area (region)
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        triggerLocalNotification(subTitle: "Exiting Safe Area", body: "Are you sure you want to exit the comfy safe area? Think about it or go back!")
    }
    
    // request for notification
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { isGranted, _ in
            DispatchQueue.main.async {
                self.authorizationStatus = isGranted ? .authorized : .denied
            }
        }
    }
    
    // create user notification
    func triggerLocalNotification(subTitle: String, body: String){
                // configure notification content
                let content = UNMutableNotificationContent()
                content.title = "Alert!"
                content.subtitle = subTitle
                content.body = body
                content.sound = UNNotificationSound.default
                
                // setup trigger
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                // create request
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                // add notification request
                UNUserNotificationCenter.current().add(request)
    }
}

