//
//  LoginUseCaseFactory.swift
//  AnalyticsManager
//
//  Created by Saikat Das on 29/01/24.
//

import Foundation

final class LoginUseCaseFactory {
    func makeUseCase() -> LoginUseCase {
        LoginUseCase(
            output: LoginUseCaseOutputComposer(
                [
                    FirebaseCrashAnalyticsLoginTracker(),
                    CrashAnalyticsLoginTracker(),
                    LoginPresenter()
                ]
            )
        )
    }
}
