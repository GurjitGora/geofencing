//
//  Bluedot_Geofencing_App_SwiftuiUITestsLaunchTests.swift
//  Bluedot Geofencing App SwiftuiUITests
//
//  Created by Gurjit Singh on 25/5/2022.
//

import XCTest

class Bluedot_Geofencing_App_SwiftuiUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
