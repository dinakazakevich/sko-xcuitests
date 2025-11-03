//
//  UserProfileScreen.swift
//  SKOUITests
//
//  Created by Dina Kazakevich on 2/11/25.
//

import Foundation
import XCTest

final class UserProfileScreen: BaseScreen {
    // Element Proxies (Definitions using inherited 'app')
    typealias Locators = AppLocators.UserProfileScreen

    var userFullName: XCUIElement {
        app.staticTexts[Locators.UserData.userFullName.rawValue]
    }

    var mockUserEmail: XCUIElement {
        app.staticTexts["mockuser@example.com"]
    }

    var mockUserName: XCUIElement {
        app.staticTexts["Your Name"]
    }
}
