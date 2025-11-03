# sko-xcuitests — README

## Overview
A minimal example XCTest UI testing framework for an iOS app. Demonstrates a clean, maintainable structure built around the Page Object pattern and XCUITest primitives to keep tests readable, stable and fast.

## SKO App
SKO App is an iOS app that is a beauty routine tracker https://www.skoapp.com/

## Project Structure
- Base/
  - BaseScreen.swift               — Base app initialization 
  - BaseTest.swift.                - Base test object, defining default launch flags 
  - TestApp.swift                  - A singleton to manage the app launch and global access
- Elements/
  - XCUIElements.swift             — All XCUI element locators (Accessibility IDs and static text labels)
- Screens/
  - ....                           — Application screen objects
- Tests/
  - SKOUIOnboardingTests.swift     — XCTest test flows using
- README.md

## Key Conventions
- A centralized source of truth for all XCUI element locators
- The app version used lacked Accessibility IDs so I had to use static text labels instead
- A singleton to manage the app launch and global access
- Tests use setup/teardown to prepare the app state; to allow for parallelization
- Launch flags to enforce app states, e.g. bypass onboarding, simulate a signed-in user 
- The launch flags are implemented in the AuthenticationManager the AppDelegate classes in the main app 
- Screen classes used in Page-Object-Model style  

## Running locally and CI
- Not possible to run this project since the SKO iOS app is a private repository. 
- I only have the permission to share the source code of the XCUITests project part. 

## Extending the Framework
- Add retry-on-failure wrapper for known-flaky interactions.
- Add launch flags for paid plan test users to test paid features.
