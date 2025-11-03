//
//  ConcernsAndGoalsScreen.swift
//  SKOUITests
//
//  Created by Dina Kazakevich on 31/10/25.
//

import Foundation
import XCTest

final class ConcernsAndGoalsScreen: BaseScreen {
    // Element Proxies (Definitions using inherited 'app')
    typealias Locators = AppLocators.ConcernsAndGoalsScreen

    var finishButton: XCUIElement {
        app.buttons[Locators.ScreenElement.finishButton.rawValue]
    }

    var header: XCUIElement {
        app.staticTexts[Locators.ScreenElement.header.rawValue]
    }

    var suggestedAction: XCUIElement {
        app.staticTexts[Locators.ScreenElement.suggestedAction.rawValue]
    }

    var concernsSubheader: XCUIElement {
        app.staticTexts[Locators.ScreenElement.concernsSubheader.rawValue]
    }

    var goalsSubheader: XCUIElement {
        app.staticTexts[Locators.ScreenElement.goalsSubheader.rawValue]
    }

    func assertIsLoaded() {
        assertScreenLoaded(uniqueElement: header)
        XCTAssertTrue(header.exists)
    }

    // Action to transition away from the Concerns & Goals screen
    func tapFinish() -> HomeScreen {
        finishButton.tap()

        // Always return the resulting screen object
        return HomeScreen()
    }

    // Function to get a Skin Concern checkbox element
    func skinConcernCheckbox(type: Locators.SkinConcern) -> XCUIElement {
        // We locate the button using the rawValue (the display text/label)
        app.buttons[type.rawValue].firstMatch
    }

    // Function to get a Skin Goal checkbox element
    func skinGoalCheckbox(type: Locators.SkinGoal) -> XCUIElement {
        // We locate the button using the rawValue (the display text/label)
        app.buttons[type.rawValue].firstMatch
    }

    // --- Random Selection Logic ---

    // Get all concern elements as an array of XCUIElement
    var allConcernCheckboxes: [XCUIElement] {
        Locators.SkinConcern.allCases.map { type in
            skinConcernCheckbox(type: type)
        }
    }

    // Get all goal elements as an array of XCUIElement
    var allGoalCheckboxes: [XCUIElement] {
        Locators.SkinGoal.allCases.map { type in
            skinGoalCheckbox(type: type)
        }
    }

    // Function to select a random Skin Concern
    func selectRandomSkinConcern() {
        guard let randomCheckbox = allConcernCheckboxes.randomElement() else {
            XCTFail("No skin concern checkboxes found.")
            return
        }
        randomCheckbox.tap()
    }

    // Function to select a random Skin Goal
    func selectRandomSkinGoal() {
        guard let randomCheckbox = allGoalCheckboxes.randomElement() else {
            XCTFail("No skin goal checkboxes found.")
            return
        }
        randomCheckbox.tap()
    }
}
