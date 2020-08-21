//
//  AuthPresenter.swift
//  Application
//
//  Created by Nikita Egoshin on 11.08.2020.
//  Copyright © 2020 Omega-R. All rights reserved.
//

import Domain

protocol MainView: AnyObject {
    var username: String { get }
    var password: String { get }
    
    func showError(_ error: Error)
    func showGreetings(withUsername username: String)
    
    func clearUsernameField()
    func clearPasswordField()
}

final class AuthPresenter {

	private unowned var view: MainView
	private let navigator: AuthNavigator
    private let useCase: AuthUseCase

	// MARK: - Lifecycle

    init(view: MainView, navigator: AuthNavigator, useCase: AuthUseCase) {
		self.view = view
		self.navigator = navigator
        self.useCase = useCase
	}

	// MARK: - Actions

    func authTriggered() {
        useCase.signInWithUsername(view.username, password: view.password) { [unowned self] (result) in
            switch result {
            case .success(let username):
                self.view.showGreetings(withUsername: username)
                self.view.clearUsernameField()
                self.view.clearPasswordField()
            case .failure(let error):
                self.view.showError(error)
            }
        }
    }
}
