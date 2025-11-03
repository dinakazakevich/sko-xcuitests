//
//  OnboardingStartScreen.swift
//  SKOUITests
//
//  Created by Dina Kazakevich on 30/10/25.
//

import Foundation
import XCTest

final class OnboardingStartScreen: BaseScreen {
    // Element Proxies (Definitions using inherited 'app')
    typealias Locators = AppLocators.OnboardingStartScreen

    var skoTextLabel: XCUIElement {
        app.staticTexts[Locators.skoText.rawValue]
    }

    var assistantTextLabel: XCUIElement {
        app.staticTexts[Locators.skincareAssistant.rawValue]
    }

    var trackSkinTextLabel: XCUIElement {
        app.staticTexts[Locators.trackYourSkincare.rawValue]
    }

    var analyzeResultsTextLabel: XCUIElement {
        app.staticTexts[Locators.analyzeResults.rawValue]
    }

    var startButton: XCUIElement {
        app.buttons[Locators.startButton.rawValue]
    }

    func assertIsLoaded() {
        assertScreenLoaded(uniqueElement: assistantTextLabel)
        XCTAssertTrue(assistantTextLabel.exists)
    }

    // Action to transition away from the Onboarding screen
    func tapStart() -> SkinTypeScreen {
        startButton.tap()

        return SkinTypeScreen()
    }
}
