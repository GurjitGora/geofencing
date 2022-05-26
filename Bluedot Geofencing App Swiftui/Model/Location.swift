//
//  Location.swift
//  Bluedot Geofencing App Swiftui
//
//  Created by Gurjit Singh on 27/5/2022.
//

import Foundation
import CoreLocation


struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
