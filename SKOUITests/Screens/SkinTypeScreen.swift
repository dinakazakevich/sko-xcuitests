//
//  OnboardingSkinTypeScreen.swift
//  SKOUITests
//
//  Created by Dina Kazakevich on 30/10/25.
//
import Foundation
import XCTest

final class SkinTypeScreen: BaseScreen {
    // Element Proxies (Definitions using inherited 'app')
    typealias Locators = AppLocators.SkinTypeScreen

    var header: XCUIElement {
        app.staticTexts[Locators.ScreenElement.header.rawValue]
    }

    var subheader: XCUIElement {
        app.staticTexts[Locators.ScreenElement.subHeader.rawValue]
    }

    var suggestedAction: XCUIElement {
        app.staticTexts[Locators.ScreenElement.suggestedAction.rawValue]
    }

    var oilyRadioButton: XCUIElement {
        app.buttons[Locators.SkinType.oily.rawValue]
    }

    var dryRadioButton: XCUIElement {
        app.buttons[Locators.SkinType.dry.rawValue]
    }

    var combinationRadioButton: XCUIElement {
        app.buttons[Locators.SkinType.combination.rawValue]
    }

    var sensitiveRadioButton: XCUIElement {
        app.buttons[Locators.SkinType.sensitive.rawValue]
    }

    var normalRadioButton: XCUIElement {
        app.buttons[Locators.SkinType.normal.rawValue]
    }

    var nonExistentRadioButton: XCUIElement {
        app.buttons[Locators.SkinType.nonExistent.rawValue]
    }

    var nextButton: XCUIElement {
        app.buttons[Locators.ScreenElement.nextButton.rawValue]
    }

    func assertIsLoaded() {
        assertScreenLoaded(uniqueElement: header)
        XCTAssertTrue(header.exists)
    }

    // Action to transition away from the Skin Type screen
    func tapNext() -> ConcernsAndGoalsScreen {
        nextButton.tap()

        // Always return the resulting screen object
        return ConcernsAndGoalsScreen()
    }

    func selectRandomSkinType() {
        // Define the collection of elements to choose from
        let radioButtons: [XCUIElement] = [
            dryRadioButton,
            oilyRadioButton,
            combinationRadioButton,
            sensitiveRadioButton,
            normalRadioButton,
        ]

        // Safely choose a random element from the array
        guard let randomButton = radioButtons.randomElement() else {
            // If the array is empty (which shouldn't happen based on the list), fail the test
            XCTFail("No radio buttons were found in the list to select from.")
            return
        }
        // Optional: Print the selected element for easy debugging
        print("Selecting random skin type: \(randomButton)")

        // Tap the randomly selected radio button
        randomButton.tap()
    }
}
