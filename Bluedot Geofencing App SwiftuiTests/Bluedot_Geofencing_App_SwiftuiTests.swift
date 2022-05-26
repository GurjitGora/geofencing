//
//  Bluedot_Geofencing_App_SwiftuiTests.swift
//  Bluedot Geofencing App SwiftuiTests
//
//  Created by Gurjit Singh on 25/5/2022.
//

import XCTest
import CoreLocation
import MapKit

@testable import Bluedot_Geofencing_App_Swiftui

enum mapDefaults {
    static let initialLocation = CLLocationCoordinate2D(latitude: 37.5, longitude: -122.011033)
    static let initialSpan = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
}

class Bluedot_Geofencing_App_SwiftuiTests: XCTestCase {
    
    var mapViewModel = MapViewModel()


    func bluedot_geofence_unit_test() throws {
        // given
        let geofenceRegion = CLCircularRegion(center: mapDefaults.initialLocation,
                                              radius: 10,
                                              identifier: "SafeArea")
        // then
        XCTAssert(geofenceRegion.contains(mapViewModel.geofenceRegion.center))
    }

}
