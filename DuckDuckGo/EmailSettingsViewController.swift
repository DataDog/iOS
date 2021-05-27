//
//  EmailSettingsViewController.swift
//  DuckDuckGo
//
//  Copyright © 2020 DuckDuckGo. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import UIKit
import Core
import BrowserServicesKit

class EmailSettingsViewController: UIViewController {

    @IBOutlet var showLoginPageButton: UIButton! {
        didSet {
            showLoginPageButton.layer.cornerRadius = 6.0
        }
    }

    @IBOutlet var showAccountRegistrationPageButton: UIButton! {
        didSet {
            showAccountRegistrationPageButton.layer.cornerRadius = 6.0
        }
    }

    @IBOutlet var joinDuckAddressWaitlist: UIButton! {
        didSet {
            joinDuckAddressWaitlist.layer.cornerRadius = 6.0
        }
    }

    private let emailManager = EmailManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme(ThemeManager.shared.currentTheme)
    }

    @IBAction func showLoginPage(_ sender: UIButton) {
        print("Showing login page")
    }

    @IBAction func showAccountRegistrationPage(_ sender: UIButton) {
        print("Showing account registration page")
    }

    @IBAction func joinDuckAddressWaitlist(_ sender: UIButton) {
        print("Joining waitlist")
    }

}

extension EmailSettingsViewController: Themable {
    
    func decorate(with theme: Theme) {
        view.backgroundColor = theme.backgroundColor
    }

}
