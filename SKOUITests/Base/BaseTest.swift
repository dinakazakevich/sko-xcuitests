//
//  BaseTest.swift
//  SKOUITests
//
//  Created by Dina Kazakevich on 30/10/25.
//

import Foundation
import XCTest

class BaseTest: XCTestCase {
    // MARK: - Customizable Launch Flags

    // 💡 Allow subclasses to override which flags are set for launch.
    // Defaulting to 'false' is safest and fastest, forcing subclasses to opt-in.

    // Override this in a subclass to launch the app with a clean state (--UITEST_RESET).
    var shouldCleanState: Bool {
        false
    }

    // Override this in a subclass to skip the onboarding flow (--UITEST_BYPASS_ONBOARDING).
    var shouldBypassOnboarding: Bool {
        false
    }

    /// Override this in a subclass to skip the onboarding flow (--UITEST_LOGGED_IN).
    var shouldBeLoggedIn: Bool {
        false
    }

    // MARK: - App Management

    var app: XCUIApplication {
        TestApp.shared.app
    }

    // Set this flag once for the entire suite
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false

        // 🚀 Use the customizable properties to drive the launch arguments
        TestApp.shared.launch(
            cleanState: shouldCleanState,
            bypassOnboarding: shouldBypassOnboarding,
            loggedIn: shouldBeLoggedIn,
        )
    }

    // Clean up after every test
    override func tearDownWithError() throws {
        TestApp.shared.terminate()
        try super.tearDownWithError()
    }
}
