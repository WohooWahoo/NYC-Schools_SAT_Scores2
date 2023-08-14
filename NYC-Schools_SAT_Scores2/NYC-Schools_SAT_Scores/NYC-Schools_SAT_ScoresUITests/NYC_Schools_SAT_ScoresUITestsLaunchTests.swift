//
//  NYC_Schools_SAT_ScoresUITestsLaunchTests.swift
//  NYC-Schools_SAT_ScoresUITests
//
//  Created by Randall_B on 8/12/23.
//

import XCTest

final class NYC_Schools_SAT_ScoresUITestsLaunchTests: XCTestCase {

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
