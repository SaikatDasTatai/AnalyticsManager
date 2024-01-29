//
//  LoginUseCaseOutputComposer.swift
//  AnalyticsManager
//
//  Created by Saikat Das on 29/01/24.
//

import Foundation

final class LoginUseCaseOutputComposer: LoginUseCaseOutput {
    let outputs: [LoginUseCaseOutput]
    init(_ outputs: [LoginUseCaseOutput]) {
        self.outputs = outputs
    }
    func success() {
        outputs.forEach { $0.success() }
    }
    
    func failure() {
        outputs.forEach { $0.failure() }
    }
}
