//
//  LoginUserCaseOutputComposerTests.swift
//  AnalyticsManagerTests
//
//  Created by Saikat Das on 29/01/24.
//

import XCTest
@testable import AnalyticsManager

final class LoginUserCaseOutputComposerTests: XCTestCase {
    func testComposingeroOutputDoesNotCrash() {
        let sut = LoginUseCaseOutputComposer([])
        sut.success()
        sut.failure()
    }
    
    func testSuccessDelegate() {
        let output = LoginUseCaseSpy()
        let sut = LoginUseCaseOutputComposer([output])
        sut.success()
        XCTAssertEqual(output.failureCount, 0)
        XCTAssertEqual(output.successCount, 1)
    }
    
    func testFailureDelegate() {
        let output = LoginUseCaseSpy()
        let sut = LoginUseCaseOutputComposer([output])
        sut.failure()
        XCTAssertEqual(output.failureCount, 1)
        XCTAssertEqual(output.successCount, 0)
    }
    
    func testComposerWithMoreThanOneOutput() {
        let output1 = LoginUseCaseSpy()
        let output2 = LoginUseCaseSpy()
        let sut = LoginUseCaseOutputComposer([output1, output2])
        sut.failure()
        XCTAssertEqual(output1.failureCount, 1)
        XCTAssertEqual(output1.successCount, 0)
        XCTAssertEqual(output2.failureCount, 1)
        XCTAssertEqual(output2.successCount, 0)
        
        sut.success()
        XCTAssertEqual(output1.failureCount, 1)
        XCTAssertEqual(output1.successCount, 1)
        XCTAssertEqual(output2.failureCount, 1)
        XCTAssertEqual(output2.successCount, 1)
    }
    
    private class LoginUseCaseSpy: LoginUseCaseOutput {
        var successCount = 0
        var failureCount = 0
        
        func success() {
            successCount += 1
        }
        
        func failure() {
            failureCount += 1
        }
        
        
    }
}
