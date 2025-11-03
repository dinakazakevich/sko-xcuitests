//
//  XCUIElements.swift
//  SKOUITests
//
//  Created by Dina Kazakevich on 30/10/25.
//
import Foundation
import XCTest

/**
 A centralized source of truth for all XCUI element locators (Accessibility IDs and static text labels).
 Elements are grouped by screen using nested Enums.

 Disclaimer: The app version I worked with lacked accessibility IDs so I worked with static text labels instead of the preferred identifiers.

 Usage:
 let usernameField = app.textFields[AppLocators.LoginScreen.usernameInputID.rawValue]
 let oilyButton = app.buttons[AppLocators.SkinTypeScreen.SkinType.oily.rawValue]
 */
enum AppLocators {
    // --- Onboarding Screen ---
    enum OnboardingStartScreen: String {
        // All locators on this screen are text labels
        case skoText = "SKO"
        case skincareAssistant = "Your personal skincare assistant"
        case trackYourSkincare = "Track your skincare"
        case analyzeResults = "Analyze results"
        case shareExperience = "Share experience"
        case startButton = "Start"
    }

    // --- Skin Type Screen ---
    enum SkinTypeScreen {
        // Nested enum for a specific group of elements (the skin type options)
        enum SkinType: String {
            case oily = "Oily"
            case dry = "Dry"
            case combination = "Combination"
            case sensitive = "Sensitive"
            case normal = "Normal"
            case nonExistent = "Non Existent Text" // Example for testing non-existent elements
        }

        // Nested enum for general screen text
        enum ScreenElement: String {
            case header = "What is your skin type?"
            case subHeader = "This will help us provide suitable recommendations"
            case suggestedAction = "If you're not sure, choose \"Normal\" for now. You can always change it later in your profile."
            case nextButton = "Next"
        }
    }

    // --- Skin Survey Screen ---
    enum ConcernsAndGoalsScreen {
        enum SkinConcern: String, CaseIterable {
            case acne = "Acne"
            case wrinkles = "Wrinkles"
            case pigmentation = "Pigmentation"
            case dryness = "Dryness"
            case redness = "Redness"
            case dullness = "Dullness"
        }

        enum SkinGoal: String, CaseIterable {
            case hydrationAndGlow = "Hydration and glow"
            case antiAging = "Anti-aging"
            case acneInflammationControl = "Acne and inflammation control"
            case evenSkinTone = "Even skin tone"
            case protectionFromEnv = "Protection from environmental factors"
        }

        enum ScreenElement: String {
            case header = "What are your skin concerns and goals?"
            case suggestedAction = "Select at least one concern and one goal"
            case concernsSubheader = "Skin Concerns"
            case goalsSubheader = "Skin Goals"
            case finishButton = "Finish"
        }
    }

    // --- Login Screen ---
    enum LoginScreen: String {
        // Accessibility Identifiers (The preferred choice)
        case usernameInputID = "login_username_input"
        case passwordInputID = "login_password_input"

        // Raw Text/Labels (The fallback/necessity)
        case forgotPasswordLink = "Forgot Password?"
        case legalTermsLabel = "By logging in, you agree to our terms."
    }

    // --- Home Screen ---
    enum HomeScreen {
        enum RoutineTracker: String {
            case morningButton = "Morning"
            case eveningButton = "Evening"
        }

        enum MorningRoutine: String {
            case header = "Morning Routine"
            case cleanser = "Cleanser"
            case serum = "Serum"
            case eyeCream = "Eye Cream"
            case guaSha = "Gua Sha"
            case toner = "Toner"
            case cream = "Cream"
            case spf = "SPF"
            case ledMask = "LED Mask"
        }

        enum EveningRoutine: String {
            case header = "Evening Routine"
            case cleanser = "Cleanser"
            case serum = "Serum"
            case eyeCream = "Eye Cream"
            case guaSha = "Gua Sha"
            case toner = "Toner"
            case cream = "Cream"
            case spf = "SPF"
            case ledMask = "LED Mask"
        }

        enum ActiveIngredients: String {
            case vitaminC = "Vitamin C"
            case retinol = "Retinol"
            case niacinamide = "Niacinamide"
            case hyaluronicAcid = "Hyaluronic Acid"
            case salicylicAcid = "Salicylic Acid"
            case azelaic = "Azelaic"
        }

        // Accessibility Identifier
        enum navigatioBar: String {
            case homeButtonId = "house"
            case analyticsButtonId = "chart.bar"
            case skoButtonId = "ractangle.stack"
            case profileButtonId = "Profile"
        }
    }

    // --- User Profile Screen ---
    enum UserProfileScreen {
        enum UserData: String {
            case userFullName = "Your Name"
            case accountType = "Free Account"
            case planType = "GET A PRO"
            case email = "mockuser@example.com"
        }

        enum accountSettings: String {
            case editButton = "Edit"
            case resetPassword = "Reset Password"
            case changePassword = "Change Password"
            case logOut = "Log Out"
            case deleteAccount = "Delete Account"
        }
    }
}
