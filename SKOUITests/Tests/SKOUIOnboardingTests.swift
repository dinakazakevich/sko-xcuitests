//
//  SKOUITests.swift
//  SKOUITests
//
//  Created by Dina Kazakevich on 30/10/25.
//
import Foundation
import XCTest

// MARK: - 1. OnboardingFlowTests (Full Flow)

final class OnboardingFlowTests: BaseTest {
    // --- Launch Flag Overrides ---

    /// 1. REQUIRED: Clears state to ensure a clean launch (e.g., logged out state).
    override var shouldCleanState: Bool {
        true
    }

    /// 2. REQUIRED: Tells the app to skip onboarding by setting the UserDefaults flag.
    override var shouldBypassOnboarding: Bool {
        false
    }

    @MainActor
    func testOnboardingFlow() throws {
        // --- Onboarding first screen ---

        let onboardingStartScreen = OnboardingStartScreen()

        // Assertion: Verify the screen is loaded and content is present
        // Using the correct variable name and assuming startButton is an XCUIElement
        onboardingStartScreen.assertIsLoaded()

        // Verify all the needed text labels are present on the initial onboarding screen
        XCTAssertTrue(onboardingStartScreen.skoTextLabel.exists)
        XCTAssertTrue(onboardingStartScreen.assistantTextLabel.exists)
        XCTAssertTrue(onboardingStartScreen.trackSkinTextLabel.exists)
        XCTAssertTrue(onboardingStartScreen.analyzeResultsTextLabel.exists)
        XCTAssertTrue(onboardingStartScreen.startButton.exists)

        // Tap the Start button to proceed to the next screen
        let skinTypeScreen: SkinTypeScreen = onboardingStartScreen.tapStart()
        skinTypeScreen.assertIsLoaded()

        // --- Onboarding Skin Type Selection Screen  ---

        // Assert all text elements on the screen are correct
        XCTAssertTrue(skinTypeScreen.header.exists)
        XCTAssertTrue(skinTypeScreen.subheader.exists)
        XCTAssertTrue(skinTypeScreen.suggestedAction.exists)

        // Assert all radio button options exist and have correct labels
        XCTAssertTrue(skinTypeScreen.oilyRadioButton.exists)
        XCTAssertTrue(skinTypeScreen.combinationRadioButton.exists)
        XCTAssertTrue(skinTypeScreen.sensitiveRadioButton.exists)
        XCTAssertTrue(skinTypeScreen.normalRadioButton.exists)

        // Select a random button from the list
        skinTypeScreen.selectRandomSkinType()

        // Tap the Next button to proceed to the next screen
        let concernsAndGoalsScreen = skinTypeScreen.tapNext()
        concernsAndGoalsScreen.assertIsLoaded()

        // --- Onboarding Skin Concerns and Goals Selection Screen  ---

        // Assert all text elements on the screen are correct
        XCTAssertTrue(concernsAndGoalsScreen.header.exists)
        XCTAssertTrue(concernsAndGoalsScreen.suggestedAction.exists)
        XCTAssertTrue(concernsAndGoalsScreen.concernsSubheader.exists)
        XCTAssertTrue(concernsAndGoalsScreen.goalsSubheader.exists)

        // Assert all skin concerns options exist
        typealias Concern = AppLocators.ConcernsAndGoalsScreen.SkinConcern
        XCTAssertTrue(concernsAndGoalsScreen.skinConcernCheckbox(type: Concern.acne).exists)
        XCTAssertTrue(concernsAndGoalsScreen.skinConcernCheckbox(type: Concern.wrinkles).exists)
        XCTAssertTrue(concernsAndGoalsScreen.skinConcernCheckbox(type: Concern.pigmentation).exists)
        XCTAssertTrue(concernsAndGoalsScreen.skinConcernCheckbox(type: Concern.dryness).exists)
        XCTAssertTrue(concernsAndGoalsScreen.skinConcernCheckbox(type: Concern.redness).exists)
        XCTAssertTrue(concernsAndGoalsScreen.skinConcernCheckbox(type: Concern.dullness).exists)

        // Assert all skin goals options exist
        typealias Goal = AppLocators.ConcernsAndGoalsScreen.SkinGoal
        XCTAssertTrue(concernsAndGoalsScreen.skinGoalCheckbox(type: Goal.hydrationAndGlow).exists)
        XCTAssertTrue(concernsAndGoalsScreen.skinGoalCheckbox(type: Goal.antiAging).exists)
        XCTAssertTrue(concernsAndGoalsScreen.skinGoalCheckbox(type: Goal.acneInflammationControl).exists)
        XCTAssertTrue(concernsAndGoalsScreen.skinGoalCheckbox(type: Goal.evenSkinTone).exists)
        XCTAssertTrue(concernsAndGoalsScreen.skinGoalCheckbox(type: Goal.protectionFromEnv).exists)

        // Select three random concerns
        concernsAndGoalsScreen.selectRandomSkinConcern()
        concernsAndGoalsScreen.selectRandomSkinConcern()
        concernsAndGoalsScreen.selectRandomSkinConcern()

        // Select two random goals
        concernsAndGoalsScreen.selectRandomSkinGoal()
        concernsAndGoalsScreen.selectRandomSkinGoal()
        concernsAndGoalsScreen.selectRandomSkinGoal()

        // Tap the Next button to proceed to the next screen
        let homeScreen = concernsAndGoalsScreen.tapFinish()
        homeScreen.assertIsLoaded()
    }
}

// MARK: - 2. MainAppLaunchTests (Bypass Onboarding)

// This class is used for tests that require skipping onboarding to reach the main app content quickly.
final class MainAppLaunchTests: BaseTest {
    // --- Launch Flag Overrides ---

    /// 1. REQUIRED: Clears state to ensure a clean launch (e.g., logged out state).
    override var shouldCleanState: Bool {
        true
    }

    // 2. REQUIRED: Tells the app to skip onboarding by setting the UserDefaults flag.
    override var shouldBypassOnboarding: Bool {
        true
    }

    @MainActor
    func testSkipOnboardingUnauthorized() throws {
        // Since we set shouldBypassOnboarding = true, the app should be on the main view.

        // Assuming 'HomeScreen' is the initial view inside MainTabView
        let homeScreen = HomeScreen()

        // Verify Home screen loaded skipping onboarding
        homeScreen.assertIsLoaded()
    }
}

// This class is used for tests that require login to reach screens available only with authentication.
final class AuthenticatedFeaturesTests: BaseTest {
    override var shouldCleanState: Bool {
        true // Start fresh
    }

    override var shouldBypassOnboarding: Bool {
        true // Skip setup screens
    }

    override var shouldBeLoggedIn: Bool {
        true // Go straight to the main logged-in view
    }

    @MainActor
    func testUserProfileScreenElements() throws {
        // App is already logged in and on the main tab view...

        let homeScreen = HomeScreen()
        homeScreen.profileButton.tap()

        let userProfileScreen = UserProfileScreen()
        userProfileScreen.assertScreenLoaded(uniqueElement: userProfileScreen.mockUserName)

        XCTAssertTrue(userProfileScreen.mockUserEmail.exists)
    }
}
