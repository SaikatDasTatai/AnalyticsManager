//
//  LoginUseCaseFactoryTests.swift
//  AnalyticsManagerTests
//
//  Created by Saikat Das on 29/01/24.
//

import XCTest
@testable import AnalyticsManager

final class LoginUseCaseFactoryTests: XCTestCase {

    func testInitial() {
        let sut = LoginUseCaseFactory()
        let useCase = sut.makeUseCase()
        let composer = useCase.output as? LoginUseCaseOutputComposer
        XCTAssertNotNil(composer)
        XCTAssertEqual(composer?.outputs.count, 3)
        XCTAssertEqual(composer?.count(ofType: FirebaseCrashAnalyticsLoginTracker.self), 1)
        XCTAssertEqual(composer?.count(ofType: CrashAnalyticsLoginTracker.self), 1)
        XCTAssertEqual(composer?.count(ofType: LoginPresenter.self), 1)
    }
}

private extension LoginUseCaseOutputComposer {
    func count<T>(ofType: T.Type) -> Int {
        outputs.filter { $0 is T }.count
    }
}
