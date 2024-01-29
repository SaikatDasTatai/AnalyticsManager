//
//  LoginUseCase.swift
//  AnalyticsManager
//
//  Created by Saikat Das on 29/01/24.
//

import Foundation

protocol LoginUseCaseOutput {
    func success()
    func failure()
}

final class LoginUseCase {
    let output: LoginUseCaseOutput
    init(output: LoginUseCaseOutput) {
        self.output = output
    }
    func login(name: String, password: String) {
        // if success
        output.success()
        // else
        output.failure()
    }
}

