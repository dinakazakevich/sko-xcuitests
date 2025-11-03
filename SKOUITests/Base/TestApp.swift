//
//  TestApp.swift
//  SKOUITests
//
//  Created by Dina Kazakevich on 30/10/25.
//

import Foundation
import XCTest

// A singleton to manage the app launch and global access
final class TestApp {
    // The single, private instance of XCUIApplication.
    // This is created ONLY ONCE when the TestApp.shared instance is created.
    let application = XCUIApplication()

    // Static property for easy access (Singleton pattern).
    static let shared = TestApp()

    // Prevent external instantiation (ensures singleton property).
    private init() {}

    // PUBLIC getter property used by BaseScreen to access the instance
    var app: XCUIApplication {
        application
    }

    // Method to launch the app, clearing state if needed
    func launch(
        cleanState: Bool = false,
        bypassOnboarding: Bool = false,
        loggedIn: Bool = false,
    ) {
        // Clear any previous launch arguments to ensure a clean start
        application.launchArguments = []

        if cleanState {
            // Must use the private 'application' instance here
            // Resets setup to a clean pre-onboarding state
            application.launchArguments.append("--UITEST_RESET")
        }

        if bypassOnboarding {
            // Bypass onboarding steps
            application.launchArguments.append("--UITEST_BYPASS_ONBOARDING")
        }

        if loggedIn {
            // Sets up an existing user logged-in state
            application.launchArguments.append("--UITEST_LOGGED_IN")
        }

        application.launch()
    }

    // Method to terminate the app (used by BaseTest)
    func terminate() {
        application.terminate()
    }
}
