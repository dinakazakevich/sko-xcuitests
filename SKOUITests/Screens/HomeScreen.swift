//
//  HomeScreen.swift
//  SKOUITests
//
//  Created by Dina Kazakevich on 31/10/25.
//

import Foundation
import XCTest

final class HomeScreen: BaseScreen {
    // Element Proxies (Definitions using inherited 'app')
    typealias Locators = AppLocators.HomeScreen

    var morningRoutineHeader: XCUIElement {
        app.staticTexts[Locators.MorningRoutine.header.rawValue]
    }

    var eveningRoutineHeader: XCUIElement {
        app.staticTexts[Locators.EveningRoutine.header.rawValue]
    }

    var morningButton: XCUIElement {
        app.buttons[Locators.RoutineTracker.morningButton.rawValue]
    }

    var eveningButton: XCUIElement {
        app.buttons[Locators.RoutineTracker.eveningButton.rawValue]
    }

    var homeButton: XCUIElement {
        app.buttons[Locators.navigatioBar.profileButtonId.rawValue]
    }

    var analyticsButton: XCUIElement {
        app.buttons[Locators.navigatioBar.analyticsButtonId.rawValue]
    }

    var skoButton: XCUIElement {
        app.buttons[Locators.navigatioBar.analyticsButtonId.rawValue]
    }

    var profileButton: XCUIElement {
        app.buttons[Locators.navigatioBar.profileButtonId.rawValue]
    }

    func assertIsLoaded() {
        assertScreenLoaded(uniqueElement: morningRoutineHeader)
        XCTAssertTrue(morningRoutineHeader.exists)
    }

//    // Action to transition away from the Concerns & Goals screen
//    func tapAnalytics() -> SkinTypeScreen {
//        finishButton.tap()
    ////        return SkinTypeScreen()
//    }
}
