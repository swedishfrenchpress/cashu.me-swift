import XCTest

/// UI tests for wallet-header Settings navigation and basic interactions.
final class SettingsUITests: UITestBase {
    override var launchMode: LaunchMode { .seededWallet }

    // MARK: - Helpers

    private func navigateToSettings() {
        waitForMainTab()
        let settings = app.buttons["wallet-settings-button"]
        XCTAssertTrue(settings.waitForExistence(timeout: 5))
        settings.tap()
    }

    // MARK: - Tests

    func testSettingsViewLoads() throws {
        navigateToSettings()

        // Assert the real Settings screen rendered: its nav bar plus a known row.
        XCTAssertTrue(
            app.navigationBars["Settings"].waitForExistence(timeout: 10),
            "Settings navigation bar should appear"
        )
        XCTAssertTrue(
            app.buttons["Delete Wallet"].waitForExistence(timeout: 5),
            "Settings content should render (Delete Wallet row visible)"
        )
    }

    func testSettingsButtonIsAccessible() throws {
        navigateToSettings()

        XCTAssertTrue(app.navigationBars["Settings"].exists)
        XCTAssertFalse(app.tabBars.firstMatch.exists)
    }

    func testCanReturnToWalletFromSettings() throws {
        navigateToSettings()

        app.navigationBars["Settings"].buttons.firstMatch.tap()
        XCTAssertTrue(app.buttons["wallet-settings-button"].waitForExistence(timeout: 5))
        XCTAssertTrue(tabButton("Wallet").isSelected)
    }
}
