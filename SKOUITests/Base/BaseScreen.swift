//
//  BaseScreen.swift
//  SKOUITests
//
//  Created by Dina Kazakevich on 30/10/25.
//

import Foundation
import XCTest

class BaseScreen {
    var app: XCUIApplication {
        // Accesses the single instance stored within the TestApp singleton
        // Note: This requires keeping 'application' in TestApp 'internal' or 'public'
        TestApp.shared.app
    }

    // --- Common Helper Methods ---

    // Waits for an element to appear and asserts its existence.
    // This is the foundation of handling asynchronous UI transitions.
    func waitForElementToAppear(_ element: XCUIElement, timeout: TimeInterval = 10) {
        let exists = element.waitForExistence(timeout: timeout)
        XCTAssertTrue(exists, "Element '\(element.identifier)' did not appear within \(timeout) seconds.")
    }

    // Verifies the unique element for the screen is present and interactable.
    func assertScreenLoaded(uniqueElement: XCUIElement) {
        waitForElementToAppear(uniqueElement)
        // Checks hittability to ensure the element isn't hidden behind an overlay
        XCTAssertTrue(uniqueElement.isHittable, "Screen failed to load: unique element is not hittable.")
    }
}
