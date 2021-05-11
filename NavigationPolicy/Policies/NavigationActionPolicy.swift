//
//  NavigationActionPolicy.swift
//  DuckDuckGo
//
//  Copyright © 2021 DuckDuckGo. All rights reserved.
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

import Foundation
import WebKit

public typealias NavigationActionResultCompletion = (NavigationActionResult) -> Void
public typealias NavigationActionCancellation = () -> Void
public typealias NavigationActionDeferredCompletion = (NavigationActionResultCompletion) -> Void

public enum NavigationActionResult {
    case immediate(WKNavigationActionPolicy, NavigationActionCancellation?)
    case deferred(NavigationActionDeferredCompletion)

    static var allow = NavigationActionResult.immediate(.allow, nil)
}

public protocol NavigationActionPolicy {

    func check(navigationAction: WKNavigationAction) -> NavigationActionResult

}

public struct NavigationActionPolicyChecker {

    public static func check(policies: [NavigationActionPolicy], for navigationAction: WKNavigationAction) -> NavigationActionResult {

        guard let nextPolicy = policies.first else {
            return .allow
        }

        let result = nextPolicy.check(navigationAction: navigationAction)

        if case let .immediate(policy, _) = result, policy == .cancel {
            return result
        } else {
            return check(policies: Array(policies.dropFirst()), for: navigationAction)
        }
    }

}
